package com.example.TaskBoard.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "tasks")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "department")
    private String department;

    @Column(name = "nameTask")
    private String nameTask;

    @Column(name = "textTask")
    private String textTask;

    @Column(name = "dateOfStart")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private LocalDate dateOfStart;

    @Column(name = "dateOfEnd")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private LocalDate dateOfEnd;

    @Column(name = "status")
    private boolean status;

    @Column(name = "dateOfDelivery")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private LocalDate dateOfDelivery;
}


