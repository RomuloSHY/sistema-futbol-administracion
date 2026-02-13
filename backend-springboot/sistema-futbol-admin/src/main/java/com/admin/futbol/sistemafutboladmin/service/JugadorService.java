package com.admin.futbol.sistemafutboladmin.service;

import com.admin.futbol.sistemafutboladmin.entity.Jugador;
import com.admin.futbol.sistemafutboladmin.repository.JugadorRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JugadorService {
    private final JugadorRepository jugadorRepository;
    public JugadorService(JugadorRepository jugadorRepository){
        this.jugadorRepository = jugadorRepository;
    }

    public List<Jugador> listarJugadores(){
        return jugadorRepository.findAll();
    }

    public Jugador agregarJugador(Jugador jugador) {
        return jugadorRepository.save(jugador);
    }
}
