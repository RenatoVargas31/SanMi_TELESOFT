package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Evento;

import java.sql.*;
import java.util.ArrayList;

public class DaoCoordinadora extends BaseDao{

    public ArrayList<Evento> listaEventos(){
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT * FROM eventos";
        try(Connection connection= this.getConection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setDescriptionEvento(rs.getString("descriptionEvento"));

                listaEventos.add(evento);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEventos;
    }

}
