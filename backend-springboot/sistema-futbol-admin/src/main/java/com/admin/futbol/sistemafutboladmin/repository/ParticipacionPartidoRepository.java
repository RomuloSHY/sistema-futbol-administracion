package com.admin.futbol.sistemafutboladmin.repository;

import com.admin.futbol.sistemafutboladmin.entity.ParticipacionPartido;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ParticipacionPartidoRepository extends JpaRepository<ParticipacionPartido, Long> {
    boolean existsByPartidoIdAndJugadorId(Long partidoId, Long jugadorId);
}
