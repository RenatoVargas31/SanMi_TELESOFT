package com.example.sanmi_telesoft.daos;


import com.example.sanmi_telesoft.dto.serenoYtipo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoTipoSereno extends BaseDao{
    public ArrayList<serenoYtipo> getListaTipoSereno() throws ClassNotFoundException, SQLException{
        ArrayList<serenoYtipo> lista = new ArrayList<>();

        String sql = "select s.idSerenazgos, concat(s.nombreSereno,' ', apellidoSereno) as name_completo, t.nameTipo from serenazgos s, tiposereno t where t.idTipoSereno = s.TipoSereno_idTipoSereno;\n";

        try(Connection conn = this.getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()){
                serenoYtipo t = new serenoYtipo();
                t.setId(rs.getInt(1));
                t.setNombre(rs.getString(2));
                t.setTipo(rs.getString(3));
                lista.add(t);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }

        return lista;
    }
}
