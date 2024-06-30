package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Profesor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoProfesor extends BaseDao {

    public ArrayList<Profesor> listarProfesores() {
        ArrayList<Profesor> lista = new ArrayList<>();
        String sql = "SELECT * FROM profesores";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Profesor profesor = new Profesor();
                profesor.setIdProfesores(rs.getInt("idProfesores"));
                profesor.setNombreProfesor(rs.getString("nombreProfesor"));
                profesor.setApellidoProfesor(rs.getString("apellidoProfesor"));
                profesor.setDniProfesor(rs.getString("dniProfesor"));
                profesor.setTipoProfesor(rs.getString("tipoProfesor"));
                profesor.setCursoProfesor(rs.getString("cursoProfesor"));
                profesor.setIsEnable(rs.getBoolean("isEnable"));
                lista.add(profesor);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
}
