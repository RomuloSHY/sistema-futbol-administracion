package com.admin.futbol.sistemafutboladmin.service;

import com.admin.futbol.sistemafutboladmin.entity.Jugador;
import com.admin.futbol.sistemafutboladmin.entity.ParticipacionPartido;
import com.admin.futbol.sistemafutboladmin.entity.Partido;
import com.admin.futbol.sistemafutboladmin.repository.JugadorRepository;
import com.admin.futbol.sistemafutboladmin.repository.ParticipacionPartidoRepository;
import com.admin.futbol.sistemafutboladmin.repository.PartidoRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ParticipacionPartidoService {
    private final ParticipacionPartidoRepository participacionPartidoRepository;
    private final PartidoRepository partidoRepository;
    private final JugadorRepository jugadorRepository;

    public ParticipacionPartidoService(
            ParticipacionPartidoRepository participacionPartidoRepository,
            PartidoRepository partidoRepository,
            JugadorRepository jugadorRepository){
        this.participacionPartidoRepository = participacionPartidoRepository;
        this.partidoRepository = partidoRepository;
        this.jugadorRepository = jugadorRepository;
    }

    public void registrarAsistencia(Long partidoId, List<Long> jugadorIds){

        Partido partido = partidoRepository.findById(partidoId)
                .orElseThrow(() -> new RuntimeException("Partido no encontrado"));

        for (Long jugadorId : jugadorIds){

            Jugador jugador = jugadorRepository.findById(jugadorId)
                    .orElseThrow(() -> new RuntimeException("Jugador no encontrado"));
            ParticipacionPartido p = new ParticipacionPartido();
            p.setPartido(partido);
            p.setJugador(jugador);
            p.setMontoPagado(BigDecimal.ZERO);
            p.setDeudaGenerada(BigDecimal.ZERO);

            participacionPartidoRepository.save(p);
        }

    }
}
