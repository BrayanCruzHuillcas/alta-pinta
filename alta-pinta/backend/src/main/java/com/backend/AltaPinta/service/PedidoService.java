package com.backend.AltaPinta.service;

import com.backend.AltaPinta.dto.ConfirmarPedidoDTO;
import com.backend.AltaPinta.dto.PedidoResponse;
import com.backend.AltaPinta.model.*;
import com.backend.AltaPinta.repository.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class PedidoService {

    private final PedidoRepository pedidoRepo;
    private final PedidoDetalleRepository detalleRepo;
    private final ProductoRepository productoRepo;
    private final ClienteRepository clienteRepo;
    private final EnvioRepository envioRepo;
    private final CarritoItemRepository carritoItemRepo;
    private final CuentaTiendaRepository cuentaTiendaRepo;
    private final TarjetaRepository tarjetaRepo;
    private final EmailService emailService;
    private final FacturaRepository facturaRepository;
    private final FacturaPdfService facturaPdfService;

    public PedidoService(
            PedidoRepository pedidoRepo,
            PedidoDetalleRepository detalleRepo,
            ProductoRepository productoRepo,
            ClienteRepository clienteRepo,
            EnvioRepository envioRepo,
            CarritoItemRepository carritoItemRepo,
            CuentaTiendaRepository cuentaTiendaRepo,
            TarjetaRepository tarjetaRepo,
            EmailService emailService,
            FacturaRepository facturaRepository,
            FacturaPdfService facturaPdfService
    ) {
        this.pedidoRepo = pedidoRepo;
        this.detalleRepo = detalleRepo;
        this.productoRepo = productoRepo;
        this.clienteRepo = clienteRepo;
        this.envioRepo = envioRepo;
        this.carritoItemRepo = carritoItemRepo;
        this.cuentaTiendaRepo = cuentaTiendaRepo;
        this.tarjetaRepo = tarjetaRepo;
        this.emailService = emailService;
        this.facturaRepository = facturaRepository;
        this.facturaPdfService = facturaPdfService;
    }

    public PedidoResponse confirmarPedido(String correoCliente, ConfirmarPedidoDTO dto) {

        Cliente cliente = clienteRepo.findByCorreo(correoCliente)
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));

        List<CarritoItem> itemsCarrito = carritoItemRepo.findByCarritoClienteId(cliente.getId());

        if (itemsCarrito.isEmpty()) {
            throw new RuntimeException("El carrito está vacío");
        }

        double subtotal = 0;

        // Validar stock y calcular subtotal
        for (CarritoItem item : itemsCarrito) {
            Producto producto = item.getProducto();

            if (producto.getStock() < item.getCantidad()) {
                throw new RuntimeException("Stock insuficiente: " + producto.getNombre());
            }

            subtotal += producto.getPrecio() * item.getCantidad();
        }

        // Envío (opcional)
        Envio envio = null;
        double costoEnvio = 0;
        if (dto.getEnvioId() != null) {
            envio = envioRepo.findById(dto.getEnvioId())
                    .orElseThrow(() -> new RuntimeException("Envío inválido"));
            costoEnvio = envio.getCosto();
        }

        double total = subtotal + costoEnvio;

        // Validar tarjeta y descontar saldo
        Tarjeta tarjeta = tarjetaRepo
                .findByIdAndClienteId(dto.getTarjetaId(), cliente.getId())
                .orElseThrow(() -> new RuntimeException("La tarjeta no pertenece al cliente"));

        if (tarjeta.getSaldo() < total) {
            throw new RuntimeException("Saldo insuficiente en la tarjeta");
        }

        tarjeta.setSaldo(tarjeta.getSaldo() - total);
        tarjetaRepo.save(tarjeta);

        // Crear pedido
        Pedido pedido = new Pedido();
        pedido.setCliente(cliente);
        pedido.setEnvio(envio);
        pedido.setTotal(total);
        pedido.setEstado("PAGADO");
        pedido.setFecha(LocalDateTime.now());
        pedidoRepo.save(pedido);

        // Crear detalles de pedido y descontar stock
        List<PedidoDetalle> detalles = new ArrayList<>();
        for (CarritoItem item : itemsCarrito) {
            Producto producto = item.getProducto();

            producto.setStock(producto.getStock() - item.getCantidad());
            productoRepo.save(producto);

            PedidoDetalle detalle = new PedidoDetalle();
            detalle.setPedido(pedido);
            detalle.setProducto(producto);
            detalle.setCantidad(item.getCantidad());
            detalle.setPrecioUnitario(producto.getPrecio());

            detalleRepo.save(detalle);
            detalles.add(detalle);
        }

        // Registrar ingreso en cuenta de la tienda
        CuentaTienda cuenta = cuentaTiendaRepo.findById(1L)
                .orElseThrow(() -> new RuntimeException("Cuenta de la tienda no configurada"));
        cuenta.setSaldo(cuenta.getSaldo() + total);
        cuentaTiendaRepo.save(cuenta);

        // Vaciar carrito
        carritoItemRepo.deleteByCarritoClienteId(cliente.getId());

        // Crear factura
        Factura factura = new Factura();
        factura.setNumero("FAC-" + System.currentTimeMillis());
        factura.setFecha(LocalDateTime.now());
        factura.setSubtotal(subtotal);
        factura.setEnvio(costoEnvio);
        factura.setTotal(total);
        factura.setPedido(pedido);

        // Generar PDF de factura
        String urlPdf = facturaPdfService.generarFactura(pedido, detalles);
        factura.setUrlPdf(urlPdf);

        facturaRepository.save(factura);

        // Enviar correo al cliente
        emailService.sendCompraDetalle(cliente.getCorreo(), pedido, detalles);

        // Preparar respuesta
        PedidoResponse response = new PedidoResponse();
        response.setPedidoId(pedido.getId());
        response.setTotal(total);
        response.setEstado(pedido.getEstado());
        response.setTiempoEntrega(envio != null ? calcularTiempoEntrega(envio.getLugar()) : "Recojo en tienda");

        return response;
    }

    public String calcularTiempoEntrega(String lugar) {
        if (lugar == null) return "No definido";

        return switch (lugar.toLowerCase()) {
            case "lima" -> "24 a 48 horas";
            case "callao" -> "48 horas";
            default -> "3 a 5 días hábiles";
        };
    }
}
