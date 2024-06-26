package com.example.sanmi_telesoft.beans;

public class Usuario {
    private int idUsuarios;
    private int idRoles;
    private String correoUsuario;
    private String passwordUsuario;
    private String nombreUsuario;
    private String apellidoUsuario;
    private String dniUsuario;
    private String direccionUsuario;
    private String telefonoUsuario;
    private int idUrbanizacion;
    private String activationToken;
    private String isActive;
    private String nacimientoDate;
    private int idTipoCoordinadora;
    private int idEstadoVecinoEvento;
    private boolean isBannedApp;
    private String motivoBannedApp;

    public String getRol() {
        switch (idRoles) {
            case 1:
                return "Administrador";
            case 2:
                return "Coordinadora";
            case 3:
                return "Vecino";
            default:
                return "Desconocido";
        }
    }

    public String getIsActive() {
        return isActive;
    }
    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }
    public int getIdUsuarios() {
        return idUsuarios;
    }
    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }
    public int getIdRoles() {
        return idRoles;
    }
    public void setIdRoles(int idRoles) {
        this.idRoles = idRoles;
    }
    public String getCorreoUsuario() {
        return correoUsuario;
    }
    public void setCorreoUsuario(String correoUsuario) {
        this.correoUsuario = correoUsuario;
    }
    public String getPasswordUsuario() {
        return passwordUsuario;
    }
    public void setPasswordUsuario(String passwordUsuario) {
        this.passwordUsuario = passwordUsuario;
    }
    public String getNombreUsuario() {
        return nombreUsuario;
    }
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    public String getApellidoUsuario() {
        return apellidoUsuario;
    }
    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }
    public String getDniUsuario() {
        return dniUsuario;
    }
    public void setDniUsuario(String dniUsuario) {
        this.dniUsuario = dniUsuario;
    }
    public String getDireccionUsuario() {
        return direccionUsuario;
    }
    public void setDireccionUsuario(String direccionUsuario) {
        this.direccionUsuario = direccionUsuario;
    }
    public String getTelefonoUsuario() {
        return telefonoUsuario;
    }
    public void setTelefonoUsuario(String telefonoUsuario) {
        this.telefonoUsuario = telefonoUsuario;
    }
    public int getIdUrbanizacion() {
        return idUrbanizacion;
    }
    public void setIdUrbanizacion(int idUrbanizacion) {
        this.idUrbanizacion = idUrbanizacion;
    }
    public String getActivationToken() {
        return activationToken;
    }
    public void setActivationToken(String activationToken) {
        this.activationToken = activationToken;
    }
    public String getNacimientoDate() {
        return nacimientoDate;
    }
    public void setNacimientoDate(String nacimientoDate) {
        this.nacimientoDate = nacimientoDate;
    }
    public int getIdTipoCoordinadora() {
        return idTipoCoordinadora;
    }
    public void setIdTipoCoordinadora(int idTipoCoordinadora) {
        this.idTipoCoordinadora = idTipoCoordinadora;
    }
    public int getIdEstadoVecinoEvento() {
        return idEstadoVecinoEvento;
    }
    public void setIdEstadoVecinoEvento(int idEstadoVecinoEvento) {
        this.idEstadoVecinoEvento = idEstadoVecinoEvento;
    }
    public boolean isBannedApp() {
        return isBannedApp;
    }
    public void setBannedApp(boolean bannedApp) {
        isBannedApp = bannedApp;
    }
    public String getMotivoBannedApp() {
        return motivoBannedApp;
    }
    public void setMotivoBannedApp(String motivoBannedApp) {
        this.motivoBannedApp = motivoBannedApp;
    }
}