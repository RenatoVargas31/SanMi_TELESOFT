package com.example.sanmi_telesoft.beans;

public class Profesor {

    private int idProfesores;
    private String nombreProfesor;
    private String apellidoProfesor;
    private String dniProfesor;
    private String tipoProfesor;
    private String cursoProfesor;
    private boolean isEnable;

    public int getIdProfesores() {
        return idProfesores;
    }

    public void setIdProfesores(int idProfesores) {
        this.idProfesores = idProfesores;
    }

    public String getNombreProfesor() {
        return nombreProfesor;
    }

    public void setNombreProfesor(String nombreProfesor) {
        this.nombreProfesor = nombreProfesor;
    }

    public String getApellidoProfesor() {
        return apellidoProfesor;
    }

    public void setApellidoProfesor(String apellidoProfesor) {
        this.apellidoProfesor = apellidoProfesor;
    }

    public String getDniProfesor() {
        return dniProfesor;
    }

    public void setDniProfesor(String dniProfesor) {
        this.dniProfesor = dniProfesor;
    }

    public String getTipoProfesor() {
        return tipoProfesor;
    }

    public void setTipoProfesor(String tipoProfesor) {
        this.tipoProfesor = tipoProfesor;
    }

    public String getCursoProfesor() {
        return cursoProfesor;
    }

    public void setCursoProfesor(String cursoProfesor) {
        this.cursoProfesor = cursoProfesor;
    }

    public boolean getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(boolean isEnable) {
        this.isEnable = isEnable;
    }
}
