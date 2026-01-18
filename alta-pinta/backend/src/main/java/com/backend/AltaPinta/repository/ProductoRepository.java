package com.backend.AltaPinta.repository;

import com.backend.AltaPinta.model.Producto;
import com.backend.AltaPinta.model.Talla;
import com.backend.AltaPinta.model.TipoPrenda;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductoRepository extends JpaRepository<Producto, Long> {
    List<Producto> findByCategoriaNombre(String categoria);
    List<Producto> findByTipoPrendaNombre(String tipoPrenda);
    List<Producto> findByTallaNombre(String talla);

    @Query("""
        SELECT DISTINCT p.tipoPrenda
        FROM Producto p
        JOIN p.categoria c
        WHERE LOWER(c.nombre) = LOWER(:categoria)
    """)
    List<TipoPrenda> findTiposByCategoria(@Param("categoria") String categoria);

    @Query("""
      SELECT DISTINCT p.talla
      FROM Producto p
      WHERE p.categoria.nombre = :categoria
    """)
    List<Talla> findTallasByCategoria(@Param("categoria") String categoria);

}
