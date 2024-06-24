package com.example.sanmi_telesoft.filters;

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
public class AuthFilter implements Filter {

    public void init(FilterConfig fConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String loginURI = req.getContextPath() + "/ServletLoguin";
        String sistemaURI = req.getContextPath() + "/ServletSistema";

        boolean loggedIn = session != null && session.getAttribute("usuario") != null;
        boolean loginRequest = req.getRequestURI().equals(loginURI);
        boolean sistemaRequest = req.getRequestURI().startsWith(sistemaURI);
        boolean staticResource = req.getRequestURI().startsWith(req.getContextPath() + "/assets");

        if (loggedIn || loginRequest || sistemaRequest || staticResource) {
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            res.setHeader("Pragma", "no-cache");
            res.setDateHeader("Expires", 0);

            chain.doFilter(request, response);
        } else {
            res.sendRedirect(loginURI);
        }
    }

    public void destroy() {
    }
}