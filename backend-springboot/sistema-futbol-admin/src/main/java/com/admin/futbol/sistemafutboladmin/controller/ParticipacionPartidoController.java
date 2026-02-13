package com.admin.futbol.sistemafutboladmin.controller;

import com.admin.futbol.sistemafutboladmin.entity.ParticipacionPartido;
import com.admin.futbol.sistemafutboladmin.service.ParticipacionPartidoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/participacion")
public class ParticipacionPartidoController {

    private final ParticipacionPartidoService participacionPartidoService;
    public ParticipacionPartidoController(ParticipacionPartidoService participacionPartidoService) {
        this.participacionPartidoService = participacionPartidoService;
    }

    @PostMapping("/registrar")
    public ResponseEntity<String> registrarAsistencia(
            @RequestParam Long partidoId,
            @RequestBody List<Long> jugadorIds){

        participacionPartidoService.registrarAsistencia(partidoId, jugadorIds);
        return ResponseEntity.ok("Asistencia registrada correctamente");
        }
}

