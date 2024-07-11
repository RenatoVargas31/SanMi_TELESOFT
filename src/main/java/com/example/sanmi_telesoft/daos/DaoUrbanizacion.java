package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Urbanizacion;

import java.sql.*;
import java.util.ArrayList;

public class DaoUrbanizacion extends BaseDao{
    public ArrayList<Urbanizacion> getUrbanizaciones(){
        ArrayList<Urbanizacion> urbanizaciones = new ArrayList<>();

        String sql = "select * from urbanizacion";

        try(Connection conn = this.getConection();
            Statement ps = conn.createStatement();
            ResultSet rs = ps.executeQuery(sql)){

            while(rs.next()){
                Urbanizacion urbanizacion = new Urbanizacion();
                urbanizacion.setId(rs.getInt(1));
                urbanizacion.setName(rs.getString(2));
                urbanizaciones.add(urbanizacion);
            }


        } catch (SQLException e){
            e.printStackTrace();
        }

        return urbanizaciones;
    }
}
