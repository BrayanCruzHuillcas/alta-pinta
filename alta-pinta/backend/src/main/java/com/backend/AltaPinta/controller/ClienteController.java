package com.backend.AltaPinta.controller;

import com.backend.AltaPinta.model.Cliente;
import com.backend.AltaPinta.repository.ClienteRepository;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cliente")
@CrossOrigin("*")
public class ClienteController {

    private final ClienteRepository clienteRepo;

    public ClienteController(ClienteRepository clienteRepo) {
        this.clienteRepo = clienteRepo;
    }

    // PERFIL DEL USUARIO LOGUEADO
    @GetMapping("/me")
    public Cliente perfil(Authentication auth) {
        return clienteRepo.findByCorreo(auth.getName())
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));
    }

    // ACTUALIZAR PERFIL (SIN CORREO NI PASSWORD)
    @PutMapping("/actualizar")
    public Cliente actualizar(@RequestBody Cliente c, Authentication auth) {

        Cliente db = clienteRepo.findByCorreo(auth.getName())
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));

        // campos permitidos
        db.setNombre(c.getNombre());
        db.setDireccion(c.getDireccion());
        db.setDni(c.getDni());

        return clienteRepo.save(db);
    }
}
