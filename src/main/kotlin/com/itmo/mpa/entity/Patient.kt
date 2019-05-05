package com.itmo.mpa.entity

import java.time.Instant
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne
import javax.persistence.OneToOne
import javax.persistence.Table

@Entity
@Table(name = "patient")
class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    var id: Long = 0

    @Column(name = "name", nullable = false)
    lateinit var name: String

    @Column(name = "birth_date", nullable = false)
    lateinit var birthDate: Instant

    @ManyToOne
    @JoinColumn(name = "disease_id", nullable = true)
    lateinit var disease: Disease

    @OneToOne
    @JoinColumn(name = "status_id", nullable = true)
    var status: Status? = null
}