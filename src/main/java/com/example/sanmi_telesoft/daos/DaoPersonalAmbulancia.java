package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.PersonalAmbulancia;
import com.example.sanmi_telesoft.beans.Prioridad;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoPersonalAmbulancia extends BaseDao{
    public ArrayList<PersonalAmbulancia> getListaPersonalAmbulancia() throws SQLException, ClassNotFoundException{
        ArrayList<PersonalAmbulancia> lista = new ArrayList<>();

        String sql = "select * from personalambulancia";

        try(Connection conn = this.getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()){
                PersonalAmbulancia p = new PersonalAmbulancia();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setApellido(rs.getString(3));
                p.setDni(Integer.parseInt(rs.getString(4)));
                p.setTurno(rs.getString(5));
                lista.add(p);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }

        return lista;
    }
}
