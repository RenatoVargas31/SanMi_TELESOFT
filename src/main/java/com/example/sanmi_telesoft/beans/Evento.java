package com.example.sanmi_telesoft.beans;

import java.sql.Time;
import java.util.Date;

public class Evento {
    private Byte[] fotosStart;
    private String descriptionEvento;
    private int vacantesDisp;
    private String lugarEvento;
    private Date fechaEventoStart;
    private Date fechaEventoEnd;
    private Time horaEventoStart;
    private Time horaEventoEnd;
    private String materialesEvento;
    private int Profesores_idProfesores;
    private Byte[] fotosEnd;
    private int TipoEvento_idTipoEvento;
    private int FrecuenciaEvento_idFrecuenciaEvento;
    private int EstadoEvento_idEstadoEvento;
    private boolean asistenciaCoordi;
    private Time asistenciaLlegada;
    private Time asistenciaSalida;

    private int idEventos;
    private String nombreEvento;

    public void setIdEventos(int idEventos) {
        this.idEventos = idEventos;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public void setFotosStart(Byte[] fotosStart) {
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

    public void setFechaEventoStart(Date fechaEventoStart) {
        this.fechaEventoStart = fechaEventoStart;
    }

    public void setFechaEventoEnd(Date fechaEventoEnd) {
        this.fechaEventoEnd = fechaEventoEnd;
    }

    public void setHoraEventoStart(Time horaEventoStart) {
        this.horaEventoStart = horaEventoStart;
    }

    public void setHoraEventoEnd(Time horaEventoEnd) {
        this.horaEventoEnd = horaEventoEnd;
    }

    public void setMaterialesEvento(String materialesEvento) {
        this.materialesEvento = materialesEvento;
    }

    public void setProfesores_idProfesores(int profesores_idProfesores) {
        Profesores_idProfesores = profesores_idProfesores;
    }

    public void setFotosEnd(Byte[] fotosEnd) {
        this.fotosEnd = fotosEnd;
    }

    public void setTipoEvento_idTipoEvento(int tipoEvento_idTipoEvento) {
        TipoEvento_idTipoEvento = tipoEvento_idTipoEvento;
    }

    public void setFrecuenciaEvento_idFrecuenciaEvento(int frecuenciaEvento_idFrecuenciaEvento) {
        FrecuenciaEvento_idFrecuenciaEvento = frecuenciaEvento_idFrecuenciaEvento;
    }

    public void setEstadoEvento_idEstadoEvento(int estadoEvento_idEstadoEvento) {
        EstadoEvento_idEstadoEvento = estadoEvento_idEstadoEvento;
    }

    public void setAsistenciaCoordi(boolean asistenciaCoordi) {
        this.asistenciaCoordi = asistenciaCoordi;
    }

    public void setAsistenciaLlegada(Time asistenciaLlegada) {
        this.asistenciaLlegada = asistenciaLlegada;
    }

    public void setAsistenciaSalida(Time asistenciaSalida) {
        this.asistenciaSalida = asistenciaSalida;
    }

    public int getIdEventos() {
        return idEventos;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public Byte[] getFotosStart() {
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

    public Date getFechaEventoStart() {
        return fechaEventoStart;
    }

    public Date getFechaEventoEnd() {
        return fechaEventoEnd;
    }

    public Time getHoraEventoStart() {
        return horaEventoStart;
    }

    public Time getHoraEventoEnd() {
        return horaEventoEnd;
    }

    public String getMaterialesEvento() {
        return materialesEvento;
    }

    public int getProfesores_idProfesores() {
        return Profesores_idProfesores;
    }

    public Byte[] getFotosEnd() {
        return fotosEnd;
    }

    public int getTipoEvento_idTipoEvento() {
        return TipoEvento_idTipoEvento;
    }

    public int getFrecuenciaEvento_idFrecuenciaEvento() {
        return FrecuenciaEvento_idFrecuenciaEvento;
    }

    public int getEstadoEvento_idEstadoEvento() {
        return EstadoEvento_idEstadoEvento;
    }

    public boolean isAsistenciaCoordi() {
        return asistenciaCoordi;
    }

    public Time getAsistenciaLlegada() {
        return asistenciaLlegada;
    }

    public Time getAsistenciaSalida() {
        return asistenciaSalida;
    }



}
