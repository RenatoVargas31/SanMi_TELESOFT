package com.example.sanmi_telesoft.daos;
import com.example.sanmi_telesoft.beans.Incidencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.List;
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

    public ArrayList<Incidencia> listarMisIncidencias(int idUsuario) {

        ArrayList<Incidencia> listaMisIncidencias = new ArrayList<>();

        String sql = "select i.*, concat(u.nombreUsuario,' ', apellidoUsuario) as name_completo from incidencias i, usuarios u WHERE i.Usuarios_idUsuarios = u.idUsuarios and i.Usuarios_idUsuarios = ?";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUsuario);

            ResultSet rs = stmt.executeQuery();

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

                listaMisIncidencias.add(incidencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaMisIncidencias;
    }
    public void insertarIncidencia(Incidencia incidencia) {
        /*String sql = "INSERT INTO incidencias (nombreIncidencia, lugarIncidencia, referenciaIncidencia, fotoIncidencia, requiereAmbulancia, telefono, tipo) VALUES (?, ?, ?, ?, ?, ?, ?)";*/
        String sql = "INSERT INTO incidencias (nombreIncidencia, lugarExacto, referenciaIncidencia, requiereAmbulancia, requierePolicia, requiereBombero, contactoIncidencia) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarIncidencia());
            pstmt.setString(3, incidencia.getReferenciaIncidencia());
            /*pstmt.setString(4, incidencia.getFotoIncidencia());*/
            pstmt.setBoolean(4, incidencia.isRequiereAmbulancia());
            pstmt.setBoolean(5, incidencia.isRequierePolicia());
            pstmt.setBoolean(6, incidencia.isRequiereBombero());
            pstmt.setInt(7, incidencia.getTelefono());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Incidencia> listarIncidenciasPorVecino(int vecinoId) {
        List<Incidencia> incidencias = new ArrayList<>();
        String sql = "SELECT * FROM incidencias WHERE Usuarios_idUsuarios = ?";

        try (Connection conn = getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, vecinoId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Incidencia incidencia = new Incidencia();
                    incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                    incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                    incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                    incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                    incidencia.setFotoIncidencia(rs.getString("fotoIncidencia"));
                    incidencia.setTelefono(rs.getInt("contactoIncidencia"));
                    incidencia.setRequiereAmbulancia(rs.getBoolean("requiereAmbulancia"));
                    incidencia.setRequierePolicia(rs.getBoolean("requierePolicia"));
                    incidencia.setRequiereBombero(rs.getBoolean("requiereBombero"));
                    incidencia.setDescripcionSolucion(rs.getString("descriptionSolucion"));
                    incidencia.setEstado(rs.getInt("EstadoIncidencia_idEstadoIncidencia"));
                    incidencia.setCriticidad(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                    incidencia.setTipo(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                    incidencias.add(incidencia);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return incidencias;
    }
    public void actualizarIncidencia(Incidencia incidencia) {
        String sql = "UPDATE incidencias SET nombreIncidencia = ? ,lugarExacto = ?, referenciaIncidencia = ?, contactoIncidencia = ?, requiereAmbulancia = ?, requiereBombero = ? WHERE idIncidencias = ?";
        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarIncidencia());
            pstmt.setString(3, incidencia.getReferenciaIncidencia());
            pstmt.setInt(4, incidencia.getTelefono());
            /*pstmt.setString(4, incidencia.getFotoIncidencia());*/
            pstmt.setBoolean(5, incidencia.isRequiereAmbulancia());
            pstmt.setBoolean(6, incidencia.isRequiereBombero());
            pstmt.setInt(7, incidencia.getIdIncidencias());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Incidencia obtenerIncidencia(int idIncidencia) {
        Incidencia incidencia = null;
        String sql = "SELECT * FROM incidencias WHERE idIncidencias = ?";
        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idIncidencia);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    incidencia = new Incidencia();
                    incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                    incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                    incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                    incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                    incidencia.setTelefono(Integer.parseInt(rs.getString(6)));
                    incidencia.setRequiereAmbulancia(rs.getInt(7) == 1);
                    incidencia.setRequiereBombero(rs.getInt(9) == 1);
                    // Otros campos...
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return incidencia;
    }

    public void eliminarIncidencia(int idIncidencia) {
        String sql = "DELETE FROM incidencias WHERE idIncidencias = ?";

        try (Connection conn = getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idIncidencia);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
