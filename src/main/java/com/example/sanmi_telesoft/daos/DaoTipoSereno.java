package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Prioridad;
import com.example.sanmi_telesoft.beans.TipoSereno;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoTipoSereno extends BaseDao{
    public ArrayList<TipoSereno> getListaTipoSereno() throws ClassNotFoundException, SQLException{
        ArrayList<TipoSereno> lista = new ArrayList<>();

        String sql = "select * from criticidadincidencia";

        try(Connection conn = this.getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()){
                TipoSereno t = new TipoSereno();
                t.setIdTipoSereno(rs.getInt(1));
                t.setNameTipo(rs.getString(2));
                lista.add(t);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }

        return lista;
    }
}
