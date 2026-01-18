package com.backend.AltaPinta.controller;

import com.backend.AltaPinta.model.*;
import com.backend.AltaPinta.dto.CarritoDTO;
import com.backend.AltaPinta.dto.CarritoItemDTO;
import com.backend.AltaPinta.repository.CarritoItemRepository;
import com.backend.AltaPinta.repository.CarritoRepository;
import com.backend.AltaPinta.repository.ClienteRepository;
import com.backend.AltaPinta.repository.ProductoRepository;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/carrito")
@CrossOrigin("*")
public class CarritoController {

    private final CarritoRepository carritoRepo;
    private final CarritoItemRepository itemRepo;
    private final ProductoRepository productoRepo;
    private final ClienteRepository clienteRepo;

    public CarritoController(
            CarritoRepository carritoRepo,
            CarritoItemRepository itemRepo,
            ProductoRepository productoRepo,
            ClienteRepository clienteRepo) {
        this.carritoRepo = carritoRepo;
        this.itemRepo = itemRepo;
        this.productoRepo = productoRepo;
        this.clienteRepo = clienteRepo;
    }

    // MÉTODO INTERNO
    private Carrito obtenerCarritoEntidad(Authentication auth) {

        String correo = auth.getName();

        Cliente cliente = clienteRepo
                .findByCorreo(correo)
                .orElseThrow(() ->
                        new RuntimeException("Cliente no encontrado"));

        return carritoRepo
                .findByClienteId(cliente.getId())
                .orElseGet(() -> {
                    Carrito nuevo = new Carrito();
                    nuevo.setCliente(cliente);
                    return carritoRepo.save(nuevo);
                });
    }

    private CarritoDTO toDto(Carrito c) {
        CarritoDTO dto = new CarritoDTO();
        dto.setId(c.getId());
        dto.setTotal(c.getTotal());

        dto.setItems(
                c.getItems().stream().map(i -> {
                    CarritoItemDTO d = new CarritoItemDTO();
                    d.setProductoId(i.getProducto().getId());
                    d.setNombre(i.getProducto().getNombre());
                    d.setPrecio(i.getProducto().getPrecio());
                    d.setCantidad(i.getCantidad());
                    d.setImagenUrl(i.getProducto().getImagenUrl());
                    return d;
                }).toList()
        );

        return dto;
    }

    // RF013 – VER CARRITO
    @GetMapping
    public CarritoDTO obtenerCarrito(Authentication auth) {
        return toDto(obtenerCarritoEntidad(auth));
    }

    // RF010 – AGREGAR PRODUCTO
    @PostMapping("/agregar/{productoId}")
    public void agregar(@PathVariable Long productoId,
                        @RequestParam int cantidad,
                        Authentication auth) {

        Carrito carrito = obtenerCarritoEntidad(auth);
        Producto p = productoRepo.findById(productoId).orElseThrow();

        CarritoItem item = itemRepo
                .findByCarritoIdAndProductoId(carrito.getId(), productoId)
                .orElseGet(() -> {
                    CarritoItem i = new CarritoItem();
                    i.setCarrito(carrito);
                    i.setProducto(p);
                    i.setCantidad(0);
                    return i;
                });

        item.setCantidad(item.getCantidad() + cantidad);
        itemRepo.save(item);
    }

    // RF011 – MODIFICAR CANTIDAD
    @PutMapping("/actualizar/{productoId}")
    public void actualizar(@PathVariable Long productoId,
                           @RequestParam int cantidad,
                           Authentication auth) {

        Carrito carrito = obtenerCarritoEntidad(auth);

        CarritoItem item = itemRepo
                .findByCarritoIdAndProductoId(carrito.getId(), productoId)
                .orElseThrow();

        item.setCantidad(cantidad);
        itemRepo.save(item);
    }

    // RF012 – ELIMINAR PRODUCTO
    @DeleteMapping("/eliminar/{productoId}")
    public void eliminar(@PathVariable Long productoId, Authentication auth) {
        Carrito carrito = obtenerCarritoEntidad(auth);
        itemRepo.findByCarritoIdAndProductoId(carrito.getId(), productoId)
                .ifPresent(itemRepo::delete);
    }
}
