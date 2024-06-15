package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class DaoEvento extends BaseDao{

    public ArrayList<Evento> listaEventos(){
        ArrayList<Evento> listaEventos = new ArrayList<>();
        TipoEvento tipoEvento = new TipoEvento();
        String sql = "SELECT * FROM eventos e " +
                "left join tipoevento t on e.TipoEvento_idTipoEvento=t.idTipoEvento " ;
        try(Connection connection= this.getConection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                evento.setHoraEventoStart(rs.getString("horaEventoStart"));

                tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                evento.setTipoEvento(tipoEvento);

                listaEventos.add(evento);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEventos;
    }

    public ArrayList<Evento> listaEventosCultura(){
        ArrayList<Evento> listaEventos = new ArrayList<>();
        TipoEvento tipoEvento = new TipoEvento();
        String sql = "SELECT * FROM eventos where TipoEvento_idTipoEvento = 2 " +
                "left join tipoevento t on e.Tipoevento_idTipoevento=t.idTipoevento " ;
        try(Connection connection= this.getConection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setNombreEvento(rs.getString("descriptionEvento"));
                evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                evento.setHoraEventoStart(rs.getString("horaEventoStart"));

                tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                evento.setTipoEvento(tipoEvento);

                listaEventos.add(evento);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEventos;
    }

    public ArrayList<Evento> listaEventosDeporte(){
        ArrayList<Evento> listaEventos = new ArrayList<>();
        TipoEvento tipoEvento = new TipoEvento();
        String sql = "SELECT * FROM eventos where TipoEvento_idTipoEvento = 1 " +
                "left join tipoevento t on e.TipoEvento_idTipoEvento=t.idTipoevento " ;
        try(Connection connection= this.getConection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setNombreEvento(rs.getString("descriptionEvento"));
                evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                evento.setHoraEventoStart(rs.getString("horaEventoStart"));

                tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                evento.setTipoEvento(tipoEvento);

                listaEventos.add(evento);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEventos;
    }



    public Evento searchEventobyId(int id){
        Evento evento = new Evento();
        Profesor profesor = new Profesor();
        EstadoEvento estadoEvento = new EstadoEvento();
        FrecuenciaEvento frecuenciaEvento = new FrecuenciaEvento();
        TipoEvento tipoEvento = new TipoEvento();

        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN profesores p ON e.Profesores_idProfesores = p.idProfesores " +
                "LEFT JOIN tipoevento t ON e.Tipoevento_idTipoEvento = t.idTipoEvento " +
                "LEFT JOIN frecuenciaevento f ON e.FrecuenciaEvento_idFrecuenciaEvento = f.idFrecuenciaEvento " +
                "LEFT JOIN estadoevento ee ON e.EstadoEvento_idEstadoEvento = ee.idEstadoEvento " +
                "WHERE e.idEventos = ?";
        try(Connection connection= this.getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1, id);

            try(ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {

                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFotosStart(rs.getBytes("fotosStart"));
                    evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                    evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                    evento.setLugarEvento(rs.getString("lugarEvento"));
                    evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                    evento.setFechaEventoEnd(rs.getString("fechaEventoEnd"));
                    evento.setHoraEventoStart(rs.getString("horaEventoStart"));
                    evento.setHoraEventoEnd(rs.getString("horaEventoEnd"));
                    evento.setMaterialesEvento(rs.getString("materialesEvento"));

                    profesor.setIdProfesores(rs.getInt("Profesores_idProfesores"));
                    profesor.setNombreProfesor(rs.getString("p.nombreProfesor"));
                    profesor.setApellidoProfesor(rs.getString("p.apellidoProfesor"));
                    evento.setProfesor(profesor);

                    evento.setFotosEnd(rs.getBytes("fotosEnd"));

                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    frecuenciaEvento.setIdFrecuenciaEvento(rs.getInt("FrecuenciaEvento_idFrecuenciaEvento"));
                    frecuenciaEvento.setFrecuenciaTipo(rs.getString("f.frecuenciaTipo"));
                    evento.setFrecuenciaEvento(frecuenciaEvento);

                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));


                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return evento;
    }

    public ArrayList<Evento> searchEventobyName(String busqueda){
        ArrayList<Evento> listaEventos = new ArrayList<>();
        Evento evento = new Evento();
        Profesor profesor = new Profesor();
        EstadoEvento estadoEvento = new EstadoEvento();
        FrecuenciaEvento frecuenciaEvento = new FrecuenciaEvento();
        TipoEvento tipoEvento = new TipoEvento();

        String sql = "SELECT * FROM eventos e where nombreEvento like ? " +
                "left join profesores p on e.Profesores_idProfesor=p.idProfesores " +
                "left join tipoevento t on e.Tipoevento_idTipoevento=t.idTipoevento " +
                "left join frecuenciaevento f on e.FrecuenciaEvento_idFrecuenciaevento=f.idFrecuenciaevento "+
                "left join estadoevento ee on e.EstadoEvento_idEstadoEvento= ee.idEstadoEvento";
        try(Connection connection= this.getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, "%"+busqueda+"%");

            try(ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {

                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFotosStart(rs.getBytes("fotosStart"));
                    evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                    evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                    evento.setLugarEvento(rs.getString("lugarEvento"));
                    evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                    evento.setFechaEventoEnd(rs.getString("fechaEventoEnd"));
                    evento.setHoraEventoStart(rs.getString("horaEventoStart"));
                    evento.setHoraEventoEnd(rs.getString("horaEventoEnd"));
                    evento.setMaterialesEvento(rs.getString("materialesEvento"));

                    profesor.setIdProfesores(rs.getInt("Profesores_idProfesores"));
                    profesor.setNombreProfesor(rs.getString("p.nombreProfesor"));
                    profesor.setApellidoProfesor(rs.getString("p.apellidoProfesor"));
                    evento.setProfesor(profesor);

                    evento.setFotosEnd(rs.getBytes("fotosEnd"));

                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    frecuenciaEvento.setIdFrecuenciaEvento(rs.getInt("FrecuenciaEvento_idFrecuenciaEvento"));
                    frecuenciaEvento.setFrecuenciaTipo(rs.getString("f.frecuenciaTipo"));
                    evento.setFrecuenciaEvento(frecuenciaEvento);

                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));

                    listaEventos.add(evento);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEventos;
    }

}
