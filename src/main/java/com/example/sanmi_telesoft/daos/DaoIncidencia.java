package com.example.sanmi_telesoft.daos;
import com.example.sanmi_telesoft.beans.Incidencia;
import com.example.sanmi_telesoft.dto.IncidenciasFalsas;

import javax.print.attribute.ResolutionSyntax;
import java.io.InputStream;
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

        String sql = "select i.*, concat(u.nombreUsuario,' ', apellidoUsuario) as name_completo from incidencias i, usuarios u WHERE i.Usuarios_idUsuarios = u.idUsuarios AND enabled = 1 order by fecha_registro desc";


        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                incidencia.setTelefono(rs.getInt("contactoIncidencia"));
                incidencia.setRequiereAmbulancia(rs.getBoolean("requiereAmbulancia"));
                incidencia.setRequierePolicia(rs.getBoolean("requierePolicia"));
                incidencia.setRequiereBombero(rs.getBoolean("requiereBombero"));
                incidencia.setDescripcionSolucion(rs.getString("descriptionSolucion"));
                incidencia.setSerenazgoid(rs.getInt("Serenazgos_idSerenazgos"));
                incidencia.setAmbulalciaid(rs.getInt("personalAmbulancia_idpersonalAmbulancia"));
                incidencia.setNameUsuario(rs.getString("name_completo"));
                incidencia.setEstado(rs.getInt("EstadoIncidencia_idEstadoIncidencia"));
                incidencia.setCriticidad(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                incidencia.setIdTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                incidencia.setFechaRegistro(rs.getTimestamp("fecha_registro"));

                byte[] fotote = rs.getBytes("fotoIncidencia");
                incidencia.setFotoIncidencia(fotote);

                listaIncidencia.add(incidencia);



            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaIncidencia;
    }
    public ArrayList<Incidencia> listarIncidenciasSerenazo() {

        ArrayList<Incidencia> listaIncidencia = new ArrayList<>();

        String sql = "SELECT i.*, CONCAT(u.nombreUsuario, ' ', u.apellidoUsuario) AS name_completo " +
                "FROM incidencias i " +
                "JOIN usuarios u ON i.Usuarios_idUsuarios = u.idUsuarios " +
                "WHERE i.enabled = 1 AND (i.EstadoIncidencia_idEstadoIncidencia = 2 OR i.EstadoIncidencia_idEstadoIncidencia = 1) order by i.fecha_registro desc";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                incidencia.setTelefono(rs.getInt("contactoIncidencia"));
                incidencia.setRequiereAmbulancia(rs.getBoolean("requiereAmbulancia"));
                incidencia.setRequierePolicia(rs.getBoolean("requierePolicia"));
                incidencia.setRequiereBombero(rs.getBoolean("requiereBombero"));
                incidencia.setDescripcionSolucion(rs.getString("descriptionSolucion"));
                incidencia.setSerenazgoid(rs.getInt("Serenazgos_idSerenazgos"));
                incidencia.setAmbulalciaid(rs.getInt("personalAmbulancia_idpersonalAmbulancia"));
                incidencia.setNameUsuario(rs.getString("name_completo"));
                incidencia.setEstado(rs.getInt("EstadoIncidencia_idEstadoIncidencia"));
                incidencia.setCriticidad(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                incidencia.setIdTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                incidencia.setFechaRegistro(rs.getTimestamp("fecha_registro"));

                byte[] fotote = rs.getBytes("fotoIncidencia");
                incidencia.setFotoIncidencia(fotote);

                listaIncidencia.add(incidencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaIncidencia;
    }

    public ArrayList<Incidencia> listarMisIncidenciasSerenazo(int id) {

        ArrayList<Incidencia> listaIncidencia = new ArrayList<>();

        String sql = "SELECT i.*, CONCAT(u.nombreUsuario, ' ', u.apellidoUsuario) AS name_completo " +
                "FROM incidencias i " +
                "JOIN usuarios u ON i.Usuarios_idUsuarios = u.idUsuarios " +
                "WHERE i.enabled = 1 AND i.EstadoIncidencia_idEstadoIncidencia = 2 AND idSerenazgo = ? order by i.fecha_registro desc";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                incidencia.setTelefono(rs.getInt("contactoIncidencia"));
                incidencia.setRequiereAmbulancia(rs.getBoolean("requiereAmbulancia"));
                incidencia.setRequierePolicia(rs.getBoolean("requierePolicia"));
                incidencia.setRequiereBombero(rs.getBoolean("requiereBombero"));
                incidencia.setDescripcionSolucion(rs.getString("descriptionSolucion"));
                incidencia.setSerenazgoid(rs.getInt("Serenazgos_idSerenazgos"));
                incidencia.setAmbulalciaid(rs.getInt("personalAmbulancia_idpersonalAmbulancia"));
                incidencia.setNameUsuario(rs.getString("name_completo"));
                incidencia.setEstado(rs.getInt("EstadoIncidencia_idEstadoIncidencia"));
                incidencia.setCriticidad(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                incidencia.setIdTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                incidencia.setFechaRegistro(rs.getTimestamp("fecha_registro"));

                byte[] fotote = rs.getBytes("fotoIncidencia");
                incidencia.setFotoIncidencia(fotote);

                listaIncidencia.add(incidencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaIncidencia;
    }


        public ArrayList<Incidencia> listarMisIncidencias(int idUsuario) {

        ArrayList<Incidencia> listaMisIncidencias = new ArrayList<>();

        String sql = "select i.*, concat(u.nombreUsuario,' ', apellidoUsuario) as name_completo from incidencias i, usuarios u WHERE i.Usuarios_idUsuarios = u.idUsuarios and i.Usuarios_idUsuarios = ? AND enabled = 1 order by fecha_registro desc";

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
                incidencia.setNameUsuario(rs.getString(18 ));
                incidencia.setEstado(rs.getInt(14));
                incidencia.setCriticidad(rs.getInt(15));
                incidencia.setIdTipoIncidencia(rs.getInt(16));
                incidencia.setFechaRegistro(rs.getTimestamp("fecha_registro"));

                byte[] fotote = rs.getBytes("fotoIncidencia");
                incidencia.setFotoIncidencia(fotote);

                listaMisIncidencias.add(incidencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaMisIncidencias;
    }
    public void insertarIncidencia(Incidencia incidencia) {
        String sql = "INSERT INTO incidencias (nombreIncidencia, lugarExacto, referenciaIncidencia, requiereAmbulancia, requierePolicia, requiereBombero, contactoIncidencia, fotoIncidencia, TipoIncidencia_idTipoIncidencia, Urbanizacion_idUrbanizacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarIncidencia());
            pstmt.setString(3, incidencia.getReferenciaIncidencia());
            pstmt.setBoolean(4, incidencia.isRequiereAmbulancia());
            pstmt.setBoolean(5, incidencia.isRequierePolicia());
            pstmt.setBoolean(6, incidencia.isRequiereBombero());
            pstmt.setInt(7, incidencia.getTelefono());
            pstmt.setBytes(8, incidencia.getFotoIncidencia());
            pstmt.setInt(9, incidencia.getIdTipoIncidencia());
            pstmt.setInt(10, incidencia.getIdUrbanizacion());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void guardarSolucion(boolean ambulancia, boolean policia, boolean bombero, int idTipoIncidencia, int idAmbulancia, int idSereno, int idIncidencias) {
        String sql = "UPDATE incidencias SET requiereAmbulancia = ?, requierePolicia = ?, requiereBombero = ?, CriticidadIncidencia_idCriticidadIncidencia = ?, personalAmbulancia_idpersonalAmbulancia = ?, Serenazgos_idSerenazgos = ? WHERE idIncidencias = ?";

        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setBoolean(1, ambulancia);
            pstmt.setBoolean(2,policia);
            pstmt.setBoolean(3, bombero);
            pstmt.setInt(4,idTipoIncidencia);
            pstmt.setInt(5,idAmbulancia);
            pstmt.setInt(6,idSereno);
            pstmt.setInt(7,idIncidencias);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




    public byte[] obtenerFotoIncidencia(int idIncidencia) throws SQLException {
        byte[] foto = null;
        String sql = "SELECT fotoIncidencia FROM incidencias WHERE idIncidencias = ?";
        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idIncidencia);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    foto = rs.getBytes("fotoIncidencia");
                }
            }
        }
        return foto;
    }


    public void insertarIncidencia_vecino(Incidencia incidencia) {
        String sql = "INSERT INTO incidencias (nombreIncidencia, lugarExacto, referenciaIncidencia, requiereAmbulancia, requierePolicia, requiereBombero, contactoIncidencia, fotoIncidencia, TipoIncidencia_idTipoIncidencia, Urbanizacion_idUrbanizacion, Usuarios_idUsuarios) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarIncidencia());
            pstmt.setString(3, incidencia.getReferenciaIncidencia());
            pstmt.setBoolean(4, incidencia.isRequiereAmbulancia());
            pstmt.setBoolean(5, incidencia.isRequierePolicia());
            pstmt.setBoolean(6, incidencia.isRequiereBombero());
            pstmt.setInt(7, incidencia.getTelefono());
            pstmt.setBytes(8, incidencia.getFotoIncidencia());
            pstmt.setInt(9, incidencia.getIdTipoIncidencia());
            pstmt.setInt(10, incidencia.getIdUrbanizacion());
            pstmt.setInt(11, incidencia.getUsuarioId());


            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarIncidencia(Incidencia incidencia) {
        String sql = "UPDATE incidencias SET nombreIncidencia = ?, lugarExacto = ?, referenciaIncidencia = ?, contactoIncidencia = ?, requiereAmbulancia = ?, requiereBombero = ?, fotoIncidencia = ?, TipoIncidencia_idTipoIncidencia = ?, Urbanizacion_idUrbanizacion = ? WHERE idIncidencias = ?";
        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarIncidencia());
            pstmt.setString(3, incidencia.getReferenciaIncidencia());
            pstmt.setInt(4, incidencia.getTelefono());
            pstmt.setBoolean(5, incidencia.isRequiereAmbulancia());
            pstmt.setBoolean(6, incidencia.isRequiereBombero());
            pstmt.setBytes(7, incidencia.getFotoIncidencia());
            pstmt.setInt(8, incidencia.getIdTipoIncidencia());
            pstmt.setInt(9, incidencia.getIdUrbanizacion());
            pstmt.setInt(10, incidencia.getIdIncidencias());

            int rowsUpdated = pstmt.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Incidencia obtenerIncidencia(int idIncidencia) {
        Incidencia incidencia = null;
        String sql = "SELECT * FROM incidencias WHERE idIncidencias = ?";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idIncidencia);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                incidencia = new Incidencia();
                incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                incidencia.setTelefono(rs.getInt("contactoIncidencia"));
                incidencia.setRequiereAmbulancia(rs.getBoolean("requiereAmbulancia"));
                incidencia.setRequierePolicia(rs.getBoolean("requierePolicia"));
                incidencia.setRequiereBombero(rs.getBoolean("requiereBombero"));
                incidencia.setDescripcionSolucion(rs.getString("descriptionSolucion"));
                incidencia.setNameUsuario(rs.getString("Usuarios_idUsuarios"));
                incidencia.setUsuarioId(rs.getInt("Usuarios_idUsuarios"));
                incidencia.setFechaRegistro(rs.getTimestamp("fecha_registro"));
                incidencia.setEstado(rs.getInt("EstadoIncidencia_idEstadoIncidencia"));
                incidencia.setIdTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia")); // Nuevo campo
                incidencia.setIdUrbanizacion(rs.getInt("Urbanizacion_idUrbanizacion"));
                incidencia.setSerenazgoid(rs.getInt("idSerenazgo"));// Nuevo campo

                byte[] fotote = rs.getBytes("fotoIncidencia");
                incidencia.setFotoIncidencia(fotote);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return incidencia;
    }
    public List<Incidencia> listarIncidenciasSemana() {
        List<Incidencia> listaIncidencia = new ArrayList<>();
        String sql = "SELECT i.*, concat(u.nombreUsuario,' ', u.apellidoUsuario) as name_completo FROM incidencias i, usuarios u WHERE i.Usuarios_idUsuarios = u.idUsuarios AND WEEK(i.fecha_registro) = WEEK(CURDATE()) AND YEAR(i.fecha_registro) = YEAR(CURDATE())";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                incidencia.setTelefono(rs.getInt("contactoIncidencia"));
                incidencia.setRequiereAmbulancia(rs.getBoolean("requiereAmbulancia"));
                incidencia.setRequierePolicia(rs.getBoolean("requierePolicia"));
                incidencia.setRequiereBombero(rs.getBoolean("requiereBombero"));
                incidencia.setDescripcionSolucion(rs.getString("descriptionSolucion"));
                incidencia.setSerenazgoid(rs.getInt("Serenazgos_idSerenazgos"));
                incidencia.setAmbulalciaid(rs.getInt("personalAmbulancia_idpersonalAmbulancia"));
                incidencia.setNameUsuario(rs.getString("name_completo"));
                incidencia.setEstado(rs.getInt("EstadoIncidencia_idEstadoIncidencia"));
                incidencia.setCriticidad(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                incidencia.setIdTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                incidencia.setFechaRegistro(rs.getTimestamp("fecha_registro"));

                byte[] fotote = rs.getBytes("fotoIncidencia");
                incidencia.setFotoIncidencia(fotote);

                listaIncidencia.add(incidencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaIncidencia;
    }
    public List<Incidencia> listarIncidenciasDia() {
        List<Incidencia> listaIncidencia = new ArrayList<>();
        String sql = "SELECT i.*, concat(u.nombreUsuario,' ', u.apellidoUsuario) as name_completo FROM incidencias i, usuarios u WHERE i.Usuarios_idUsuarios = u.idUsuarios AND DATE(i.fecha_registro) = CURDATE()";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencias(rs.getInt("idIncidencias"));
                incidencia.setNombreIncidencia(rs.getString("nombreIncidencia"));
                incidencia.setLugarIncidencia(rs.getString("lugarExacto"));
                incidencia.setReferenciaIncidencia(rs.getString("referenciaIncidencia"));
                incidencia.setTelefono(rs.getInt("contactoIncidencia"));
                incidencia.setRequiereAmbulancia(rs.getBoolean("requiereAmbulancia"));
                incidencia.setRequierePolicia(rs.getBoolean("requierePolicia"));
                incidencia.setRequiereBombero(rs.getBoolean("requiereBombero"));
                incidencia.setDescripcionSolucion(rs.getString("descriptionSolucion"));
                incidencia.setSerenazgoid(rs.getInt("Serenazgos_idSerenazgos"));
                incidencia.setAmbulalciaid(rs.getInt("personalAmbulancia_idpersonalAmbulancia"));
                incidencia.setNameUsuario(rs.getString("name_completo"));
                incidencia.setEstado(rs.getInt("EstadoIncidencia_idEstadoIncidencia"));
                incidencia.setCriticidad(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                incidencia.setIdTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                incidencia.setFechaRegistro(rs.getTimestamp("fecha_registro"));

                byte[] fotote = rs.getBytes("fotoIncidencia");
                incidencia.setFotoIncidencia(fotote);

                listaIncidencia.add(incidencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaIncidencia;
    }
    public String obtenerNombreUsuarioPorIdIncidencia(int idIncidencia) {
        String nombreCompleto = "";
        String sql = "SELECT concat(u.nombreUsuario, ' ', u.apellidoUsuario) as nombre_completo " +
                "FROM incidencias i JOIN usuarios u ON i.Usuarios_idUsuarios = u.idUsuarios " +
                "WHERE i.idIncidencias = ?";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idIncidencia);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                nombreCompleto = rs.getString("nombre_completo");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return nombreCompleto;
    }

    public void eliminarIncidencia(int idIncidencia) {
        String sql = "DELETE FROM incidencias WHERE idIncidencias = ?";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idIncidencia);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void falsearIncidencia(int idIncidencia){
        String sql = "UPDATE incidencias SET enabled = 0 WHERE idIncidencias = ?";

        try(Connection conn = this.getConection();
            PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setInt(1, idIncidencia);
            stmt.executeUpdate();

        } catch (SQLException e ){
            e.printStackTrace();
        }
    }

    public ArrayList<IncidenciasFalsas> listarIncidenciasFalsas() {
        ArrayList<IncidenciasFalsas> listaFalsas = new ArrayList<>();

        String sql = "select  concat(u.nombreUsuario,' ', apellidoUsuario) as name_completo, u.correoUsuario, u.is_bannedApp ,count(i.enabled) as count from incidencias i, usuarios u where i.enabled = 0 and i.Usuarios_idUsuarios = u.idUsuarios group by  Usuarios_idUsuarios";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()) {
                IncidenciasFalsas i = new IncidenciasFalsas();
                i.setNombreCompleto(rs.getString("name_completo"));
                i.setCorreo(rs.getString("correoUsuario"));
                i.setCounter(rs.getInt("count"));
                i.setEstadoUsuario(rs.getInt("is_bannedApp") == 1);

                listaFalsas.add(i);

            }


        }catch (SQLException e){
            e.printStackTrace();
        }
        return listaFalsas;
    }

    public ArrayList<Incidencia> listarIncidenciasHistorial() {
        ArrayList<Incidencia> listaHistorial = new ArrayList<>();
            String sql = "select i.*, concat(u.nombreUsuario,' ', apellidoUsuario) as name_completo from incidencias i, usuarios u WHERE i.Usuarios_idUsuarios = u.idUsuarios and EstadoIncidencia_idEstadoIncidencia = 3 AND enabled = 1 order by fecha_registro desc";

        try (Connection conn = this.getConection();
            Statement st =  conn.createStatement();
            ResultSet rs = st.executeQuery(sql)){
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
                    incidencia.setEstado(rs.getInt(14));
                    incidencia.setCriticidad(rs.getInt(15));
                    incidencia.setIdTipoIncidencia(rs.getInt(16));
                    incidencia.setFechaRegistro(rs.getTimestamp(18));
                    incidencia.setNameUsuario(rs.getString("name_completo"));

                    listaHistorial.add(incidencia);
                }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return listaHistorial;
    }

    public  void insertarSerenazgoIncidencia(int idInci, int idSere){
        String sql = "update incidencias set EstadoIncidencia_idEstadoIncidencia = 2, idSerenazgo = ? where idIncidencias = ?";

        try (Connection conn = this.getConection();
            PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setInt(1, idSere);
            stmt.setInt(2, idInci);
            stmt.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

}
