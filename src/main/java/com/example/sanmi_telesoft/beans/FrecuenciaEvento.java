package com.example.sanmi_telesoft.beans;

public class FrecuenciaEvento {
    private int idFrecuenciaEvento;
    private String frecuenciaTipo;
    private boolean lunesActive;
    private boolean martesActive;
    private boolean miercolesActive;
    private boolean juevesActive;
    private boolean viernesActive;
    private boolean sabadoActive;
    private boolean domingoActive;

    public int getIdFrecuenciaEvento() {
        return idFrecuenciaEvento;
    }

    public void setIdFrecuenciaEvento(int idFrecuenciaEvento) {
        this.idFrecuenciaEvento = idFrecuenciaEvento;
    }

    public String getFrecuenciaTipo() {
        return frecuenciaTipo;
    }

    public void setFrecuenciaTipo(String frecuenciaTipo) {
        this.frecuenciaTipo = frecuenciaTipo;
    }

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
}
