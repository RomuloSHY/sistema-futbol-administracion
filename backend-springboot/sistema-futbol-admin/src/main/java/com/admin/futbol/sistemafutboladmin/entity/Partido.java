package com.admin.futbol.sistemafutboladmin.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "partido")
public class Partido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "fecha", nullable = false)
    private LocalDate fecha;

    @Column(name = "costo_por_jugador", scale = 2, nullable = false)
    private BigDecimal costoPorJugador;

    @Column(name = "estado", length = 20, nullable = false)
    private String estado;
}
