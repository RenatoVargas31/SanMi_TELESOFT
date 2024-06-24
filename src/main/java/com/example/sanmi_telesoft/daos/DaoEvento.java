package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.*;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Random;

public class DaoEvento extends BaseDao {

    public ArrayList<Evento> listaEventos() {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN tipoevento t ON e.TipoEvento_idTipoEvento = t.idTipoEvento";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

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

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos con fecha y hora válidas", e);
        }

        return listaEventos;
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
        FrecuenciaEvento frecuenciaEvento = new FrecuenciaEvento();
        TipoEvento tipoEvento = new TipoEvento();

        String sql = "SELECT * FROM eventos e " +
                "LEFT JOIN profesores p ON e.Profesores_idProfesores = p.idProfesores " +
                "LEFT JOIN tipoevento t ON e.Tipoevento_idTipoEvento = t.idTipoEvento " +
                "LEFT JOIN frecuenciaevento f ON e.FrecuenciaEvento_idFrecuenciaEvento = f.idFrecuenciaEvento " +
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
                    evento.setProfesor(profesor);

                    evento.setFotosEnd(rs.getBytes("fotosEnd"));

                    tipoEvento.setIdTipoEvento(rs.getInt("TipoEvento_idTipoEvento"));
                    tipoEvento.setNameTipo(rs.getString("t.nameTipo"));
                    evento.setTipoEvento(tipoEvento);

                    frecuenciaEvento.setIdFrecuenciaEvento(rs.getInt("FrecuenciaEvento_idFrecuenciaEvento"));
                    frecuenciaEvento.setFrecuenciaTipo(rs.getString("f.frecuenciaTipo"));
                    evento.setFrecuenciaEvento(frecuenciaEvento);

                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));


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
                "LEFT JOIN frecuenciaevento f ON e.FrecuenciaEvento_idFrecuenciaEvento = f.idFrecuenciaEvento " +
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
                    FrecuenciaEvento frecuenciaEvento = new FrecuenciaEvento();
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

                    frecuenciaEvento.setIdFrecuenciaEvento(rs.getInt("FrecuenciaEvento_idFrecuenciaEvento"));
                    frecuenciaEvento.setFrecuenciaTipo(rs.getString("f.frecuenciaTipo"));
                    evento.setFrecuenciaEvento(frecuenciaEvento);

                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));

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
                "LEFT JOIN frecuenciaevento f ON e.FrecuenciaEvento_idFrecuenciaEvento = f.idFrecuenciaEvento " +
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
                    FrecuenciaEvento frecuenciaEvento = new FrecuenciaEvento();
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

                    frecuenciaEvento.setIdFrecuenciaEvento(rs.getInt("FrecuenciaEvento_idFrecuenciaEvento"));
                    frecuenciaEvento.setFrecuenciaTipo(rs.getString("f.frecuenciaTipo"));
                    evento.setFrecuenciaEvento(frecuenciaEvento);

                    estadoEvento.setIdEstadoEvento(rs.getInt("EstadoEvento_idEstadoEvento"));
                    estadoEvento.setNameEstado(rs.getString("ee.nameEstado"));
                    evento.setEstadoEvento(estadoEvento);

                    evento.setAsistenciaCoordi(rs.getBoolean("asistenciaCoordi"));
                    evento.setAsistenciaLlegada(rs.getString("asistenciaLlegada"));
                    evento.setAsistenciaSalida(rs.getString("asistenciaSalida"));

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

    private ArrayList<Integer> listarIdsvalidas() {
        ArrayList<Integer> ids = new ArrayList<>();
        String sql = "SELECT idEvento, fechaEventoStart, horaEventoStart FROM eventos"; // Asegúrate de que la tabla y las columnas sean correctas

        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int idEvento = rs.getInt("idEvento");
                String fechaEvento = rs.getString("fechaEventoStart");
                String horaEvento = rs.getString("horaEventoStart");

                // Validar si la fecha y hora del evento son posteriores a la fecha y hora actuales
                if (esFechaHoraValida(fechaEvento, horaEvento)) {
                    ids.add(idEvento);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar IDs válidas de eventos con fecha y hora válidas", e);
        }

        return ids;
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


