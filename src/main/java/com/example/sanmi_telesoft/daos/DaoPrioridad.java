package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Prioridad;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoPrioridad extends BaseDao{
    public ArrayList<Prioridad> getListaPrioridad(){
        ArrayList<Prioridad> listaPrioridad = new ArrayList<>();

        String sql = "select * from criticidadincidencia";

        try(Connection conn = this.getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
                while(rs.next()){
                    Prioridad prioridad = new Prioridad();
                    prioridad.setId(rs.getInt(1));
                    prioridad.setNombre(rs.getString(2));
                    listaPrioridad.add(prioridad);
                }

        } catch (SQLException e){
                e.printStackTrace();
        }

        return listaPrioridad;
    }
}
