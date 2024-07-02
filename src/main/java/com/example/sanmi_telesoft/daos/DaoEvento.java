package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.*;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Random;

public class DaoEvento extends BaseDao {

    public void crearEvento(Evento evento) {
        // SQL de inserción con el número correcto de placeholders
        String sql = "INSERT INTO eventos (idEventos, nombreEvento, fotosStart, descriptionEvento, vacantesDisp, lugarEvento, fechaEventoStart, fechaEventoEnd, horaEventoStart, horaEventoEnd, materialesEvento, Profesores_idProfesores, fotosEnd, TipoEvento_idtipoEvento, EstadoEvento_idEstadoEvento, asistenciaCoordi, asistenciaLlegada, asistenciaSalida, idCoordinadora, lunesActive, martesActive, miercolesActive, juevesActive, viernesActive, sabadoActive, domingoActive) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Configura los parámetros del PreparedStatement en el orden correcto
            pstmt.setInt(1, evento.getIdEventos());
            pstmt.setString(2, evento.getNombreEvento());
            pstmt.setBytes(3, evento.getFotosStart()); // Asume que es un BLOB o BYTEA
            pstmt.setString(4, evento.getDescriptionEvento());
            pstmt.setInt(5, evento.getVacantesDisp());
            pstmt.setString(6, evento.getLugarEvento());
            pstmt.setString(7, evento.getFechaEventoStart());
            pstmt.setString(8, evento.getFechaEventoEnd());
            pstmt.setString(9, evento.getHoraEventoStart());
            pstmt.setString(10, evento.getHoraEventoEnd());
            pstmt.setString(11, evento.getMaterialesEvento());
            pstmt.setInt(12, evento.getProfesor().getIdProfesores());
            pstmt.setBytes(13, evento.getFotosEnd()); // Asume que es un BLOB o BYTEA
            pstmt.setInt(14, evento.getTipoEvento().getIdTipoEvento());
            pstmt.setInt(15, evento.getEstadoEvento().getIdEstadoEvento());
            pstmt.setBoolean(16, evento.isAsistenciaCoordi());
            pstmt.setString(17, evento.getAsistenciaLlegada());
            pstmt.setString(18, evento.getAsistenciaSalida());
            pstmt.setInt(19, evento.getIdCoordinadora());
            pstmt.setBoolean(20, evento.isLunesActive());
            pstmt.setBoolean(21, evento.isMartesActive());
            pstmt.setBoolean(22, evento.isMiercolesActive());
            pstmt.setBoolean(23, evento.isJuevesActive());
            pstmt.setBoolean(24, evento.isViernesActive());
            pstmt.setBoolean(25, evento.isSabadoActive());
            pstmt.setBoolean(26, evento.isDomingoActive());

            // Ejecuta la inserción
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // Manejo de errores
            e.printStackTrace(); // Considera usar un logger en lugar de printStackTrace
        }
    }


    public void actualizarEvento(Evento evento) {
        // SQL de actualización con todos los campos, incluyendo los días de la semana
        String sql = "UPDATE eventos SET nombreEvento = ?, fotosStart = ?, descriptionEvento = ?, vacantesDisp = ?, lugarEvento = ?, fechaEventoStart = ?, fechaEventoEnd = ?, horaEventoStart = ?, horaEventoEnd = ?, materialesEvento = ?, Profesores_idProfesores = ?, fotosEnd = ?, EstadoEvento_idEstadoEvento = ?, asistenciaCoordi = ?, asistenciaLlegada = ?, asistenciaSalida = ?, lunesActive = ?, martesActive = ?, miercolesActive = ?, juevesActive = ?, viernesActive = ?, sabadoActive = ?, domingoActive = ? WHERE idEventos = ?";

        try (Connection conn = this.getConection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Configura los parámetros del PreparedStatement
            pstmt.setString(1, evento.getNombreEvento());
            pstmt.setBytes(2, evento.getFotosStart()); // Asume que fotosStart es de tipo BLOB o BYTEA
            pstmt.setString(3, evento.getDescriptionEvento());
            pstmt.setInt(4, evento.getVacantesDisp());
            pstmt.setString(5, evento.getLugarEvento());
            pstmt.setString(6, evento.getFechaEventoStart());
            pstmt.setString(7, evento.getFechaEventoEnd());
            pstmt.setString(8, evento.getHoraEventoStart());
            pstmt.setString(9, evento.getHoraEventoEnd());
            pstmt.setString(10, evento.getMaterialesEvento());
            pstmt.setInt(11, evento.getProfesor().getIdProfesores());
            pstmt.setBytes(12, evento.getFotosEnd());
            pstmt.setInt(13, evento.getEstadoEvento().getIdEstadoEvento());
            pstmt.setBoolean(14, evento.isAsistenciaCoordi());
            pstmt.setString(15, evento.getAsistenciaLlegada());
            pstmt.setString(16, evento.getAsistenciaSalida());
            pstmt.setBoolean(17, evento.isLunesActive());
            pstmt.setBoolean(18, evento.isMartesActive());
            pstmt.setBoolean(19, evento.isMiercolesActive());
            pstmt.setBoolean(20, evento.isJuevesActive());
            pstmt.setBoolean(21, evento.isViernesActive());
            pstmt.setBoolean(22, evento.isSabadoActive());
            pstmt.setBoolean(23, evento.isDomingoActive());

            // Establece el valor de la clave primaria al final
            pstmt.setInt(24, evento.getIdEventos());

            // Ejecuta la actualización
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Considera usar un logger en lugar de printStackTrace
        }
    }




    public ArrayList<Evento> listaEventos(int offset, int limit) {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento " +
                "ORDER BY e.idEventos DESC " + // Ordenar por algún criterio, en este caso, por el ID de eventos de forma descendente
                "LIMIT ? OFFSET ?"; // Limitar y desplazar los resultados según los parámetros

        try (Connection connection = this.getConection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, limit); // Establecer el límite de resultados por página
            stmt.setInt(2, offset); // Establecer el desplazamiento para la paginación

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Evento evento = new Evento();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                    evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                    evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                    evento.setHoraEventoStart(rs.getString("horaEventoStart"));

                    if (esFechaHoraValida(evento.getFechaEventoStart(), evento.getHoraEventoStart())) {
                        TipoEvento tipoEvento = new TipoEvento();
                        tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                        tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                        evento.setTipoEvento(tipoEvento);

                        listaEventos.add(evento);
                    }
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos con fecha y hora válidas con paginación", e);
        }

        return listaEventos;
    }

    public ArrayList<Evento> listaEventosUser(int userId) {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT e.*, t.nameTipo \n" +
                "                FROM eventos e \n" +
                "                LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento \n" +
                "                INNER JOIN usuarios_has_eventos uhe ON e.idEventos = uhe.Eventos_idEventos \n" +
                "                WHERE uhe.Usuarios_idUsuarios = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            LocalDateTime now = LocalDateTime.now(); // Obtener la fecha y hora actuales

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                evento.setHoraEventoStart(rs.getString("horaEventoStart"));
                evento.setLugarEvento(rs.getString("lugarEvento"));

                // Convertir la fecha y hora del evento a objetos LocalDateTime para comparación
                LocalDateTime fechaHoraEvento = LocalDateTime.of(
                        LocalDate.parse(evento.getFechaEventoStart()),
                        LocalTime.parse(evento.getHoraEventoStart())
                );
                TipoEvento tipoEvento = new TipoEvento();
                // Comparar la fecha y hora del evento con la fecha y hora actuales
                if (esFechaHoraValida(evento.getFechaEventoStart(), evento.getHoraEventoStart())) {
                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    listaEventos.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos de tipo Cultura con fecha y hora válidas", e);
        }

        return listaEventos;
    }

    public ArrayList<Evento> listaEventosCoordinadora(int userId) {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT e.*, t.nameTipo \n" +
                "                FROM eventos e \n" +
                "                LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento \n" +
                "                WHERE e.idCoordinadora = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            LocalDateTime now = LocalDateTime.now(); // Obtener la fecha y hora actuales

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                evento.setHoraEventoStart(rs.getString("horaEventoStart"));
                evento.setLugarEvento(rs.getString("lugarEvento"));

                // Convertir la fecha y hora del evento a objetos LocalDateTime para comparación
                LocalDateTime fechaHoraEvento = LocalDateTime.of(
                        LocalDate.parse(evento.getFechaEventoStart()),
                        LocalTime.parse(evento.getHoraEventoStart())
                );
                TipoEvento tipoEvento = new TipoEvento();
                // Comparar la fecha y hora del evento con la fecha y hora actuales
                if (esFechaHoraValida(evento.getFechaEventoStart(), evento.getHoraEventoStart())) {
                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    listaEventos.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos de tipo Cultura con fecha y hora válidas", e);
        }

        return listaEventos;
    }
    public void borrarEvento(int idEvento) {
        borrarenHasEvento(idEvento);
        String sql = "DELETE FROM eventos WHERE idEventos = ?";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void borrarenHasEvento(int idEvento) {
        String sql = "DELETE FROM usuarios_has_eventos WHERE Eventos_idEventos = ?";

        try (Connection conn = this.getConection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEvento);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public ArrayList<Evento> listaEventosCultura() {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        TipoEvento tipoEvento = new TipoEvento();
        String sql = "SELECT e.*, t.nameTipo FROM eventos e " +
                "LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento " +
                "WHERE e.TipoEvento_idTipoEvento = 1"; // Filtrar por eventos de tipo Cultura

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            LocalDateTime now = LocalDateTime.now(); // Obtener la fecha y hora actuales

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                evento.setHoraEventoStart(rs.getString("horaEventoStart"));

                // Convertir la fecha y hora del evento a objetos LocalDateTime para comparación
                LocalDateTime fechaHoraEvento = LocalDateTime.of(
                        LocalDate.parse(evento.getFechaEventoStart()),
                        LocalTime.parse(evento.getHoraEventoStart())
                );

                // Comparar la fecha y hora del evento con la fecha y hora actuales
                if (esFechaHoraValida(evento.getFechaEventoStart(), evento.getHoraEventoStart())) {
                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    listaEventos.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos de tipo Cultura con fecha y hora válidas", e);
        }

        return listaEventos;
    }


    public ArrayList<Evento> listaEventosDeporte() {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        TipoEvento tipoEvento = new TipoEvento();
        String sql = "SELECT e.*, t.nameTipo FROM eventos e " +
                "LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento " +
                "WHERE e.TipoEvento_idTipoEvento = 2"; // Filtrar por eventos de tipo Deporte

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            LocalDateTime now = LocalDateTime.now(); // Obtener la fecha y hora actuales

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEventos(rs.getInt("idEventos"));
                evento.setNombreEvento(rs.getString("nombreEvento"));
                evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                evento.setHoraEventoStart(rs.getString("horaEventoStart"));

                // Convertir la fecha y hora del evento a objetos LocalDateTime para comparación
                LocalDateTime fechaHoraEvento = LocalDateTime.of(
                        LocalDate.parse(evento.getFechaEventoStart()),
                        LocalTime.parse(evento.getHoraEventoStart())
                );

                // Comparar la fecha y hora del evento con la fecha y hora actuales
                if (esFechaHoraValida(evento.getFechaEventoStart(), evento.getHoraEventoStart())) {
                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    listaEventos.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos de tipo Cultura con fecha y hora válidas", e);
        }

        return listaEventos;
    }


    public Evento searchEventobyId(int id) {
        Evento evento = new Evento();
        Profesor profesor = new Profesor();
        EstadoEvento estadoEvento = new EstadoEvento();
        TipoEvento tipoEvento = new TipoEvento();

        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN profesores p ON e.Profesores_idProfesores = p.idProfesores " +
                "LEFT JOIN tipoevento t ON e.Tipoevento_idTipoEvento = t.idTipoEvento " +
                "LEFT JOIN estadoevento ee ON e.EstadoEvento_idEstadoEvento = ee.idEstadoEvento " +
                "WHERE e.idEventos = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {

                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFotosStart(rs.getBytes("fotosStart"));
                    evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                    evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                    evento.setLugarEvento(rs.getString("lugarEvento"));
                    evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                    evento.setFechaEventoEnd(rs.getString("fechaEventoEnd"));
                    evento.setHoraEventoStart(rs.getString("horaEventoStart"));
                    evento.setHoraEventoEnd(rs.getString("horaEventoEnd"));
                    evento.setMaterialesEvento(rs.getString("materialesEvento"));

                    profesor.setIdProfesores(rs.getInt("Profesores_idProfesores"));
                    profesor.setNombreProfesor(rs.getString("p.nombreProfesor"));
                    profesor.setApellidoProfesor(rs.getString("p.apellidoProfesor"));
                        profesor.setDniProfesor(rs.getString("p.dniProfesor"));
                    profesor.setCursoProfesor(rs.getString("p.cursoProfesor"));
                    evento.setProfesor(profesor);

                    evento.setFotosEnd(rs.getBytes("fotosEnd"));

                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);


                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));
                    evento.setIdCoordinadora(rs.getInt("idCoordinadora"));
                    evento.setLunesActive(rs.getBoolean("lunesActive"));
                    evento.setMartesActive(rs.getBoolean("martesActive"));
                    evento.setMiercolesActive(rs.getBoolean("miercolesActive"));
                    evento.setJuevesActive(rs.getBoolean("juevesActive"));
                    evento.setViernesActive(rs.getBoolean("viernesActive"));
                    evento.setSabadoActive(rs.getBoolean("sabadoActive"));
                    evento.setDomingoActive(rs.getBoolean("domingoActive"));


                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return evento;
    }

    public ArrayList<Evento> searchEventobyName(String busqueda) {
        ArrayList<Evento> listaEventos = new ArrayList<>();

        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN profesores p ON e.Profesores_idProfesores = p.idProfesores " +
                "LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento " +
               "LEFT JOIN estadoevento ee ON e.EstadoEvento_idEstadoEvento = ee.idEstadoEvento " +
                "WHERE nombreEvento LIKE ?";

        try (Connection connection = getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "%" + busqueda + "%");

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Evento evento = new Evento();
                    Profesor profesor = new Profesor();
                    EstadoEvento estadoEvento = new EstadoEvento();
                    TipoEvento tipoEvento = new TipoEvento();

                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFotosStart(rs.getBytes("fotosStart"));
                    evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                    evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                    evento.setLugarEvento(rs.getString("lugarEvento"));
                    evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                    evento.setFechaEventoEnd(rs.getString("fechaEventoEnd"));
                    evento.setHoraEventoStart(rs.getString("horaEventoStart"));
                    evento.setHoraEventoEnd(rs.getString("horaEventoEnd"));
                    evento.setMaterialesEvento(rs.getString("materialesEvento"));

                    profesor.setIdProfesores(rs.getInt("Profesores_idProfesores"));
                    profesor.setNombreProfesor(rs.getString("p.nombreProfesor"));
                    profesor.setApellidoProfesor(rs.getString("p.apellidoProfesor"));
                    evento.setProfesor(profesor);

                    evento.setFotosEnd(rs.getBytes("fotosEnd"));

                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    evento.setLunesActive(rs.getBoolean("lunesActive"));
                    evento.setMartesActive(rs.getBoolean("martesActive"));
                    evento.setMiercolesActive(rs.getBoolean("miercolesActive"));
                    evento.setJuevesActive(rs.getBoolean("juevesActive"));
                    evento.setViernesActive(rs.getBoolean("viernesActive"));
                    evento.setSabadoActive(rs.getBoolean("sabadoActive"));
                    evento.setDomingoActive(rs.getBoolean("domingoActive"));
                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));
                    evento.setIdCoordinadora(rs.getInt("idCoordinadora"));
                    listaEventos.add(evento);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al buscar eventos por nombre", e);
        }

        return listaEventos;
    }

    public ArrayList<Evento> searchEventobyNameFiltrado(String busqueda, int idTipoFiltro) {
        ArrayList<Evento> listaEventos = new ArrayList<>();

        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN profesores p ON e.Profesores_idProfesores = p.idProfesores " +
                "LEFT JOIN tipoevento t ON e.Tipoevento_idTipoEvento = t.idTipoEvento " +
                 "LEFT JOIN estadoevento ee ON e.EstadoEvento_idEstadoEvento = ee.idEstadoEvento " +
                "WHERE nombreEvento LIKE ? AND Tipoevento_idTipoEvento = ? ";

        try (Connection connection = getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "%" + busqueda + "%");
            pstmt.setInt(2, idTipoFiltro);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Evento evento = new Evento();
                    Profesor profesor = new Profesor();
                    EstadoEvento estadoEvento = new EstadoEvento();
                    TipoEvento tipoEvento = new TipoEvento();

                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFotosStart(rs.getBytes("fotosStart"));
                    evento.setDescriptionEvento(rs.getString("descriptionEvento"));
                    evento.setVacantesDisp(rs.getInt("vacantesDisp"));
                    evento.setLugarEvento(rs.getString("lugarEvento"));
                    evento.setFechaEventoStart(rs.getString("fechaEventoStart"));
                    evento.setFechaEventoEnd(rs.getString("fechaEventoEnd"));
                    evento.setHoraEventoStart(rs.getString("horaEventoStart"));
                    evento.setHoraEventoEnd(rs.getString("horaEventoEnd"));
                    evento.setMaterialesEvento(rs.getString("materialesEvento"));
                    evento.setLunesActive(rs.getBoolean("lunesActive"));
                    evento.setMartesActive(rs.getBoolean("martesActive"));
                    evento.setMiercolesActive(rs.getBoolean("miercolesActive"));
                    evento.setJuevesActive(rs.getBoolean("juevesActive"));
                    evento.setViernesActive(rs.getBoolean("viernesActive"));
                    evento.setSabadoActive(rs.getBoolean("sabadoActive"));
                    evento.setDomingoActive(rs.getBoolean("domingoActive"));
                    profesor.setIdProfesores(rs.getInt("Profesores_idProfesores"));
                    profesor.setNombreProfesor(rs.getString("p.nombreProfesor"));
                    profesor.setApellidoProfesor(rs.getString("p.apellidoProfesor"));
                    evento.setProfesor(profesor);

                    evento.setFotosEnd(rs.getBytes("fotosEnd"));
                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));
                    evento.setIdCoordinadora(rs.getInt("idCoordinadora"));
                    listaEventos.add(evento);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al buscar eventos por nombre y tipo filtrado", e);
        }

        return listaEventos;
    }

    public int contarEventos() {
        String sql = "SELECT COUNT(*) AS total FROM eventos WHERE EstadoEvento_idEstadoEvento = 1";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public void actualizarEntradas(int id, int inscritos) {
        Evento evento = searchEventobyId(id);
        int vacantes = evento.getVacantesDisp();
        if (vacantes > 0) {

            int nuevasVacantes = vacantes - inscritos;

            String sql = "UPDATE eventos SET vacantesDisp = ? WHERE idEventos = ?";

            try (Connection connection = getConection();
                 PreparedStatement stmt = connection.prepareStatement(sql)) {

                // Establecer los parámetros en la consulta preparada
                stmt.setInt(1, nuevasVacantes);
                stmt.setInt(2, id);
                stmt.executeUpdate();

            } catch (SQLException e) {
                // Manejo de excepciones de SQL
                e.printStackTrace();
            }
        }
    }

    private boolean esFechaHoraValida(String fechaEvento, String horaEvento) {
        // Convertir la fecha y hora actuales a objetos LocalDateTime
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime fechaHoraEvento = LocalDateTime.of(
                LocalDate.parse(fechaEvento),
                LocalTime.parse(horaEvento)
        );

        // Comparar la fecha y hora del evento con la fecha y hora actuales
        return fechaHoraEvento.isAfter(now);
    }

    public ArrayList<Evento> crearEventoAleatorio(int idTipoEvento, int id) {
        ArrayList<Evento> eventos = new ArrayList<>();
        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento " +
                "WHERE e.TipoEvento_idTipoEvento = ? " +
                "AND e.idEventos != ? " +  // Evitar seleccionar el mismo evento actual
                "ORDER BY RAND() " +
                "LIMIT 2";  // Limitar a 2 eventos aleatorios

        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idTipoEvento);
            pstmt.setInt(2, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                int i = 0;

                while (rs.next() && i < 2) {
                    Evento evento = new Evento();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFotosStart(rs.getBytes("fotosStart"));
                    evento.setDescriptionEvento(rs.getString("descriptionEvento"));

                    TipoEvento tipoEvento = new TipoEvento();
                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    // Validar si el evento tiene fecha y hora válida
                    if (esFechaHoraValida(rs.getString("fechaEventoStart"), rs.getString("horaEventoStart"))) {
                        eventos.add(evento);
                        i++;
                    }
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos aleatorios con fecha y hora válidas", e);
        }

        return eventos;
    }

}


