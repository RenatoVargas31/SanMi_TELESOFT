package com.example.sanmi_telesoft.beans;
import java.sql.Timestamp;

public class Incidencia {
    private int idIncidencias;
    private String nombreIncidencia;
    private String lugarIncidencia;
    private String referenciaIncidencia;
    private byte[] fotoIncidencia;
    private boolean requiereAmbulancia;
    private boolean requierePolicia;
    private boolean requiereBombero;
    private boolean enable;
    private String descripcionSolucion;
    private String nameUsuario;
    private int idTipoIncidencia;
    private int idUrbanizacion;
    private String nombreUrbanizacion;
    private int telefono;
    private int serenazgoid;
    private int ambulalciaid;
    private int estado;
    private int criticidad;
    private String victima;
    private int usuarioId;
    private String fechaCreacion;


    private Timestamp fechaRegistro;

    // Getters y Setters
    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }


    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public int getCriticidad() {
        return criticidad;
    }

    public void setCriticidad(int criticidad) {
        this.criticidad = criticidad;
    }

    public String getVictima() {
        return victima;
    }

    public void setVictima(String victima) {
        this.victima = victima;
    }


    public int getSerenazgoid() {
        return serenazgoid;
    }

    public void setSerenazgoid(int serenazgoid) {
        this.serenazgoid = serenazgoid;
    }

    public int getAmbulalciaid() {
        return ambulalciaid;
    }

    public void setAmbulalciaid(int ambulalciaid) {
        this.ambulalciaid = ambulalciaid;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }



    public boolean isRequiereBombero() {
        return requiereBombero;
    }

    public void setRequiereBombero(boolean requiereBombero) {
        this.requiereBombero = requiereBombero;
    }


    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }


    // Getters y Setters
    public int getIdIncidencias() {
        return idIncidencias;
    }

    public void setIdIncidencias(int idIncidencias) {
        this.idIncidencias = idIncidencias;
    }

    public String getNombreIncidencia() {
        return nombreIncidencia;
    }

    public void setNombreIncidencia(String nombreIncidencia) {
        this.nombreIncidencia = nombreIncidencia;
    }

    public String getLugarIncidencia() {
        return lugarIncidencia;
    }

    public void setLugarIncidencia(String lugarIncidencia) {
        this.lugarIncidencia = lugarIncidencia;
    }

    public String getReferenciaIncidencia() {
        return referenciaIncidencia;
    }

    public void setReferenciaIncidencia(String referenciaIncidencia) {
        this.referenciaIncidencia = referenciaIncidencia;
    }

    public byte[] getFotoIncidencia() {
        return fotoIncidencia;
    }

    public void setFotoIncidencia(byte[] fotoIncidencia) {
        this.fotoIncidencia = fotoIncidencia;
    }

    public boolean isRequiereAmbulancia() {
        return requiereAmbulancia;
    }

    public void setRequiereAmbulancia(boolean requiereAmbulancia) {
        this.requiereAmbulancia = requiereAmbulancia;
    }

    public boolean isRequierePolicia() {
        return requierePolicia;
    }

    public void setRequierePolicia(boolean requierePolicia) {
        this.requierePolicia = requierePolicia;
    }

    public String getDescripcionSolucion() {
        return descripcionSolucion;
    }

    public void setDescripcionSolucion(String descripcionSolucion) {
        this.descripcionSolucion = descripcionSolucion;
    }

    public int getIdTipoIncidencia() {
        return idTipoIncidencia;
    }

    public void setIdTipoIncidencia(int idTipoIncidencia) {
        this.idTipoIncidencia = idTipoIncidencia;
    }

    public String getNombreUrbanizacion() {
        return nombreUrbanizacion;
    }

    public void setNombreUrbanizacion(String nombreUrbanizacion) {
        this.nombreUrbanizacion = nombreUrbanizacion;
    }

    public String getNameUsuario() {
        return nameUsuario;
    }

    public void setNameUsuario(String nameUsuario) {
        this.nameUsuario = nameUsuario;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public int getIdUrbanizacion() {
        return idUrbanizacion;
    }

    public void setIdUrbanizacion(int idUrbanizacion) {
        this.idUrbanizacion = idUrbanizacion;
    }
}


