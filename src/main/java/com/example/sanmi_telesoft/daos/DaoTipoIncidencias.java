package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.TipoIncidencia;
import com.example.sanmi_telesoft.beans.Urbanizacion;
import com.google.protobuf.TimestampProto;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoTipoIncidencias extends BaseDao{
    public ArrayList<TipoIncidencia> getTipoIncidencias(){
        ArrayList<TipoIncidencia> tipos = new ArrayList<>();

        String sql = "select * from tipoincidencia";

        try(Connection conn = this.getConection();
            Statement ps = conn.createStatement();
            ResultSet rs = ps.executeQuery(sql)){

            while(rs.next()){
                TipoIncidencia t = new TipoIncidencia();
                t.setId(rs.getInt(1));
                t.setName(rs.getString(2));
                tipos.add(t);
            }


        } catch (SQLException e){
            e.printStackTrace();
        }

        return tipos;
    }
}
