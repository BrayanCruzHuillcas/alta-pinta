package com.backend.AltaPinta.repository;

import com.backend.AltaPinta.model.CarritoItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CarritoItemRepository extends JpaRepository<CarritoItem, Long> {
    List<CarritoItem> findByCarritoId(Long carritoId);
    Optional<CarritoItem> findByCarritoIdAndProductoId(Long carritoId, Long productoId);
    List<CarritoItem> findByCarritoClienteId(Long clienteId);
    void deleteByCarritoClienteId(Long clienteId);
}
