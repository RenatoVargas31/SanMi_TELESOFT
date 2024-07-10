package com.example.sanmi_telesoft.filters;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.DaoEvento;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebFilter("/*")
public class SecurityFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización si es necesaria
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        Usuario usuario = (session != null) ? (Usuario) session.getAttribute("usuario") : null;
        DaoEvento daoEvento = new DaoEvento();
        // Verificar permisos basados en roles
        if (path.startsWith("/ServletAdministrador")) {
            if (usuario == null || usuario.getIdRoles() != 1) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/accessDenied.jsp");
                return;
            }
        } else if (path.startsWith("/ServletCoordinadora")) {
            if (usuario == null || usuario.getIdRoles() != 3) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/accessDenied.jsp");
                return;
            }
        } else if (path.startsWith("/ServletSerenazgo")) {
            if (usuario == null || usuario.getIdRoles() != 2) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/accessDenied.jsp");
                return;
            }
        } else if (path.startsWith("/ServletVecino")) {
            if (usuario == null || usuario.getIdRoles() != 4) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/accessDenied.jsp");
                return;
            }
        }

        // Verificar inscripción a eventos
        if (path.startsWith("/ServletVecino") && "inscribirEvento".equals(httpRequest.getParameter("action"))) {
            String idEvento = httpRequest.getParameter("id");

            if (usuario != null && idEvento != null) {
                Evento eventoactual = daoEvento.searchEventobyId(Integer.parseInt(idEvento));
                try {
                    ArrayList<Integer> eventosInscritos = daoEvento.eventosInscritosporUsuario(usuario.getIdUsuarios());
                    int eventoTraslapado = 0;
                    boolean traslapado = false;

                    for (Integer integer : eventosInscritos) {
                        if (integer == (Integer.parseInt(idEvento))) {
                            continue; // Saltar el evento actual si es el mismo que estamos evaluando
                        }

                        Evento evento2 = daoEvento.searchEventobyId(integer);

                        if (daoEvento.hayTraslapeEventos(eventoactual, evento2)) {
                            eventoTraslapado = integer;
                            traslapado = true;
                            break;
                        }
                    }

                    if (eventosInscritos.contains(Integer.parseInt(idEvento))|| traslapado) {
                        // El usuario ya está inscrito en el evento
                        httpResponse.sendRedirect(httpRequest.getContextPath() + "/error404.jsp");
                        return;
                    }
                } catch (SQLException e) {
                    throw new ServletException("Error al verificar la inscripción del evento", e);
                }
            }

        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Limpieza si es necesaria
    }

    // Método para obtener la conexión a la base de datos
    private Connection getConnection() throws SQLException {
        // Implementa aquí tu lógica para obtener una conexión a la base de datos
        // Por ejemplo, usando un pool de conexiones
        return null;
    }
}
