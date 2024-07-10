package com.example.sanmi_telesoft.dto;

import java.time.LocalDate;
import java.time.LocalTime;

public class DiaconHoras {
    private LocalDate fecha;
    private LocalTime horaInicio;
    private LocalTime horaFin;

    // Getters y setters según sea necesario
    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }

}
