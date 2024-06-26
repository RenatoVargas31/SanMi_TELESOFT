package com.example.sanmi_telesoft.filters;

import com.example.sanmi_telesoft.beans.Usuario;

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

        // Definir permisos para cada rol y servlet
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

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Limpieza si es necesaria
    }
}

