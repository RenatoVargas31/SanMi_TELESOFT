package com.example.sanmi_telesoft.beans;

import java.sql.Blob;
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
    private EstadoEvento estadoEvento;
    private boolean asistenciaCoordi;
    private String asistenciaLlegada;
    private String asistenciaSalida;
    private int idCoordinadora;
    private boolean lunesActive;
    private boolean martesActive;
    private boolean miercolesActive;
    private boolean juevesActive;
    private boolean viernesActive;
    private boolean sabadoActive;
    private boolean domingoActive;
private int entradaUser;
    private int idEventos;
    private String nombreEvento;

    public void setIdEventos(int idEventos) {
        this.idEventos = idEventos;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
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

    public void setProfesor(Profesor profesor) {
        this.profesor = profesor;
    }

    public void setTipoEvento(TipoEvento tipoEvento) {
        this.tipoEvento = tipoEvento;
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

    public EstadoEvento getEstadoEvento() {
        return estadoEvento;
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

    public byte[] getFotosStart() {
        return fotosStart;
    }

    public void setFotosStart(byte[] fotosStart) {
        this.fotosStart = fotosStart;
    }

    public byte[] getFotosEnd() {
        return fotosEnd;
    }

    public void setFotosEnd(byte[] fotosEnd) {
        this.fotosEnd = fotosEnd;
    }

    public int getIdCoordinadora() {return idCoordinadora;}

    public void setIdCoordinadora(int idCoordinadora) {this.idCoordinadora = idCoordinadora;}

    public boolean isLunesActive() {
        return lunesActive;
    }
    public void setLunesActive(boolean lunesActive) {
        this.lunesActive = lunesActive;
    }

    public boolean isMartesActive() {
        return martesActive;
    }

    public void setMartesActive(boolean martesActive) {
        this.martesActive = martesActive;
    }

    public boolean isMiercolesActive() {
        return miercolesActive;
    }

    public void setMiercolesActive(boolean miercolesActive) {
        this.miercolesActive = miercolesActive;
    }

    public boolean isJuevesActive() {
        return juevesActive;
    }

    public void setJuevesActive(boolean juevesActive) {
        this.juevesActive = juevesActive;
    }

    public boolean isViernesActive() {
        return viernesActive;
    }

    public void setViernesActive(boolean viernesActive) {
        this.viernesActive = viernesActive;
    }

    public boolean isSabadoActive() {
        return sabadoActive;
    }

    public void setSabadoActive(boolean sabadoActive) {
        this.sabadoActive = sabadoActive;
    }

    public boolean isDomingoActive() {
        return domingoActive;
    }

    public void setDomingoActive(boolean domingoActive) {
        this.domingoActive = domingoActive;
    }

    public int getEntradaUser() {
        return entradaUser;
    }

    public void setEntradaUser(int entradaUser) {
        this.entradaUser = entradaUser;
    }
}
