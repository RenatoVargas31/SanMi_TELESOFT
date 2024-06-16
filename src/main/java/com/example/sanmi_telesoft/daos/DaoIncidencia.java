package com.example.sanmi_telesoft.daos;
import com.example.sanmi_telesoft.beans.Incidencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import java.sql.Statement;
import java.util.ArrayList;

public class DaoIncidencia extends BaseDao{
    public ArrayList<Incidencia> listarIncidencias() {

        ArrayList<Incidencia> listaIncidencia = new ArrayList<>();

        String sql = "select i.*, concat(u.nombreUsuario,' ', apellidoUsuario) as name_completo from incidencias i, usuarios u WHERE i.Usuarios_idUsuarios = u.idUsuarios;";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencias(rs.getInt(1));
                incidencia.setNombreIncidencia(rs.getString(2));
                incidencia.setLugarIncidencia(rs.getString(3));
                incidencia.setReferenciaIncidencia(rs.getString(4));
                incidencia.setTelefono(rs.getInt(6));
                incidencia.setRequiereAmbulancia(rs.getBoolean(7));
                incidencia.setRequierePolicia(rs.getBoolean(8));
                incidencia.setRequiereBombero(rs.getBoolean(9));
                incidencia.setDescripcionSolucion(rs.getString(10));
                incidencia.setSerenazgoid(rs.getInt(11));
                incidencia.setAmbulalciaid(rs.getInt(12));
                incidencia.setNameUsuario(rs.getString(17));
                incidencia.setEstado(rs.getInt(14));
                incidencia.setCriticidad(rs.getInt(15));
                incidencia.setTipo(rs.getInt(16));

                listaIncidencia.add(incidencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaIncidencia;
    }
    public void insertarIncidencia(Incidencia incidencia) {
        String sql = "INSERT INTO incidencias (nombreIncidencia, lugarIncidencia, referenciaIncidencia, fotoIncidencia, requiereAmbulancia, telefono, tipo) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarIncidencia());
            pstmt.setString(3, incidencia.getReferenciaIncidencia());
            pstmt.setString(4, incidencia.getFotoIncidencia());
            pstmt.setBoolean(5, incidencia.isRequiereAmbulancia());
            pstmt.setInt(6, incidencia.getTelefono());
            pstmt.setInt(7, incidencia.getTipo());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
