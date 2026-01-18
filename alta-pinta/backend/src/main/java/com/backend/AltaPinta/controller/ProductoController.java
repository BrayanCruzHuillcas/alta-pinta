package com.backend.AltaPinta.controller;

import com.backend.AltaPinta.model.Producto;
import com.backend.AltaPinta.repository.ProductoRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/productos")
@CrossOrigin("*")
public class ProductoController {

    private final ProductoRepository repo;

    public ProductoController(ProductoRepository repo) {
        this.repo = repo;
    }

    // RF001 Registrar producto
    @PostMapping
    public Producto crear(@RequestBody Producto p) { return repo.save(p); }

    // RF002 Editar producto
    @PutMapping("/{id}")
    public Producto editar(@PathVariable Long id, @RequestBody Producto p){
        p.setId(id);
        return repo.save(p);
    }

    // RF003 Eliminar producto
    @DeleteMapping("/{id}")
    public void eliminar(@PathVariable Long id) { repo.deleteById(id); }

    // RF004 Listar productos
    @GetMapping
    public List<Producto> listar() { return repo.findAll(); }

    // *** CLIENTE RF007 RF008 RF009 ***
    @GetMapping("/categoria/{nombre}")
    public List<Producto> filtrarPorCategoria(@PathVariable String nombre){
        return repo.findByCategoriaNombre(nombre);
    }

    @GetMapping("/tipo/{nombre}")
    public List<Producto> filtrarPorTipo(@PathVariable String nombre){
        return repo.findByTipoPrendaNombre(nombre);
    }

    @GetMapping("/talla/{nombre}")
    public List<Producto> filtrarPorTalla(@PathVariable String nombre){
        return repo.findByTallaNombre(nombre);
    }

    /*@GetMapping("/{id}")
    public Producto obtener(@PathVariable Long id){
        return repo.findById(id).orElseThrow(() -> new RuntimeException("No existe"));
    }*/

    @GetMapping("/{id}")
    public Producto obtener(@PathVariable Long id) {
        return repo.findById(id)
                .orElseThrow(() -> new RuntimeException("Producto no encontrado"));
    }

}
