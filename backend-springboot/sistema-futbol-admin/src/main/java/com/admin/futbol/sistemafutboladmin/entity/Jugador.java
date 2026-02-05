package com.admin.futbol.sistemafutboladmin.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "jugador")
@Getter
@Setter
@NoArgsConstructor
public class Jugador {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name ="nombre", nullable = false, length = 100)
    private String nombre;

    @Column(name = "telefono",length = 20)
    private String telefono;

    @Column(name = "activo",nullable = false)
    private Boolean activo = true;

}
