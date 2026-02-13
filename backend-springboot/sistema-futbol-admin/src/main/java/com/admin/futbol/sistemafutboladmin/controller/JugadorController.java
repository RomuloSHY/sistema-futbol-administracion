package com.admin.futbol.sistemafutboladmin.controller;

import com.admin.futbol.sistemafutboladmin.entity.Jugador;
import com.admin.futbol.sistemafutboladmin.service.JugadorService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/jugador")
public class JugadorController {

    private final JugadorService jugadorService;
    public JugadorController(JugadorService jugadorService){
        this.jugadorService = jugadorService;
    }

    @GetMapping("/lista")
    public List<Jugador> listarJugadores(){
        return jugadorService.listarJugadores();
    }

    @PostMapping
    public ResponseEntity<Jugador> agregarJugador(@RequestBody Jugador jugador) {
        Jugador nuevoJugador = jugadorService.agregarJugador(jugador);
        return ResponseEntity.ok(nuevoJugador);
    }
}
