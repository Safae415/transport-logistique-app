package org.example.transportlogistiquebackend.entity;

import jakarta.persistence.*;
import org.example.transportlogistiquebackend.entity.enums.Role;

import java.time.LocalDateTime;

@MappedSuperclass
public abstract class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    protected String nom;
    protected String prenom;
    protected String email;
    protected String password;
    protected String telephone;

    @Enumerated(EnumType.STRING)
    protected Role role;

    protected Boolean active;
    protected LocalDateTime createdAt;
}
