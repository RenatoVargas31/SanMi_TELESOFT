package com.example.sanmi_telesoft.beans;

import java.sql.Time;

public class Evento {
    public Evento() {
        // Constructor sin argumentos
    }
    private byte[] fotosStart;
    private String descriptionEvento;
    private int vacantesDisp;
    private String lugarEvento;
    private String fechaEventoStart;
    private String fechaEventoEnd;
    private String horaEventoStart;
    private String horaEventoEnd;
    private String materialesEvento;
    private Profesor profesor;
    private byte[] fotosEnd;
    private TipoEvento tipoEvento;
    private FrecuenciaEvento frecuenciaEvento;
    private EstadoEvento estadoEvento;
    private boolean asistenciaCoordi;
    private String asistenciaLlegada;
    private String asistenciaSalida;

    private int idEventos;
    private String nombreEvento;

    public void setIdEventos(int idEventos) {
        this.idEventos = idEventos;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public void setFotosStart(byte[] fotosStart) {
        this.fotosStart = fotosStart;
    }

    public void setDescriptionEvento(String descriptionEvento) {
        this.descriptionEvento = descriptionEvento;
    }

    public void setVacantesDisp(int vacantesDisp) {
        this.vacantesDisp = vacantesDisp;
    }

    public void setLugarEvento(String lugarEvento) {
        this.lugarEvento = lugarEvento;
    }

    public void setFechaEventoStart(String fechaEventoStart) {
        this.fechaEventoStart = fechaEventoStart;
    }

    public void setFechaEventoEnd(String fechaEventoEnd) {
        this.fechaEventoEnd = fechaEventoEnd;
    }

    public void setHoraEventoStart(String horaEventoStart) {
        this.horaEventoStart = horaEventoStart;
    }

    public void setHoraEventoEnd(String horaEventoEnd) {
        this.horaEventoEnd = horaEventoEnd;
    }

    public void setMaterialesEvento(String materialesEvento) {
        this.materialesEvento = materialesEvento;
    }

    public void setFotosEnd(byte[] fotosEnd) {
        this.fotosEnd = fotosEnd;
    }

    public void setProfesor(Profesor profesor) {
        this.profesor = profesor;
    }

    public void setTipoEvento(TipoEvento tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

    public void setFrecuenciaEvento(FrecuenciaEvento frecuenciaEvento) {
        this.frecuenciaEvento = frecuenciaEvento;
    }

    public void setEstadoEvento(EstadoEvento estadoEvento) {
        this.estadoEvento = estadoEvento;
    }

    public void setAsistenciaCoordi(boolean asistenciaCoordi) {
        this.asistenciaCoordi = asistenciaCoordi;
    }

    public void setAsistenciaLlegada(String asistenciaLlegada) {
        this.asistenciaLlegada = asistenciaLlegada;
    }

    public void setAsistenciaSalida(String asistenciaSalida) {
        this.asistenciaSalida = asistenciaSalida;
    }

    public int getIdEventos() {
        return idEventos;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public byte[] getFotosStart() {
        return fotosStart;
    }

    public String getDescriptionEvento() {
        return descriptionEvento;
    }

    public int getVacantesDisp() {
        return vacantesDisp;
    }

    public String getLugarEvento() {
        return lugarEvento;
    }

    public String getFechaEventoStart() {
        return fechaEventoStart;
    }

    public String getFechaEventoEnd() {
        return fechaEventoEnd;
    }

    public String getHoraEventoStart() {
        return horaEventoStart;
    }

    public String getHoraEventoEnd() {
        return horaEventoEnd;
    }

    public String getMaterialesEvento() {
        return materialesEvento;
    }

    public Profesor getProfesor() {
        return profesor;
    }

    public TipoEvento getTipoEvento() {
        return tipoEvento;
    }

    public FrecuenciaEvento getFrecuenciaEvento() {
        return frecuenciaEvento;
    }

    public EstadoEvento getEstadoEvento() {
        return estadoEvento;
    }

    public byte[] getFotosEnd() {
        return fotosEnd;
    }

    public boolean isAsistenciaCoordi() {
        return asistenciaCoordi;
    }

    public String getAsistenciaLlegada() {
        return asistenciaLlegada;
    }

    public String getAsistenciaSalida() {
        return asistenciaSalida;
    }



}
