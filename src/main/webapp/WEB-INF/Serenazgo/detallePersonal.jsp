<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 10/07/2024
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="incidencia" class="com.example.sanmi_telesoft.beans.Incidencia" scope="request"/>
<jsp:useBean id="tipoIncidencia" type="com.example.sanmi_telesoft.beans.TipoIncidencia" scope="request"/>
<jsp:useBean id="urbanizacion" type="com.example.sanmi_telesoft.beans.Urbanizacion" scope="request"/>
<%@ page import="java.util.ArrayList, com.example.sanmi_telesoft.beans.TipoIncidencia, com.example.sanmi_telesoft.beans.Urbanizacion, com.example.sanmi_telesoft.beans.Incidencia" %>
<%
    String pageName = "incidenciasGenerales";
    request.setAttribute("pageName", pageName);
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/ServletLoguin");
        return;
    }
    String nombreCompletoUsuario = (String) request.getAttribute("nombreCompletoUsuario");
%>
<jsp:include page="head.jsp"/>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
<jsp:include page="sideBar.jsp"/>
    <div class="layout-page">
<jsp:include page="navBar.jsp"/>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="card">
                    <div class="card-header" style="background-color: #33CCFF; color: white; text-align: center;">
                        <h5 class="card-title text-white mb-0">Detalles de la Incidencia</h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Nombre de la incidencia</label>
                                <input type="text" class="form-control" value="<%= incidencia.getNombreIncidencia() == null ? "" : incidencia.getNombreIncidencia()%>" placeholder="Nombre de la incidencia" readonly/>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Reportado por</label>
                                <input type="text" class="form-control" value="<%= nombreCompletoUsuario %>" placeholder="Nombre del usuario" readonly/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label" for="fechaRegistro">Fecha de Registro</label>
                                <input type="text" class="form-control" name="fechaRegistro" id="fechaRegistro" value="<%= incidencia.getFechaRegistro() != null ? incidencia.getFechaRegistro().toString() : "" %>" readonly/>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Lugar Exacto</label>
                                <input type="text" class="form-control" value="<%= incidencia.getLugarIncidencia() == null ? "" : incidencia.getLugarIncidencia()%>" placeholder="Av, jr, calle." readonly/>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Referencia</label>
                                <input type="text" class="form-control" value="<%= incidencia.getReferenciaIncidencia() == null ? "" : incidencia.getReferenciaIncidencia()%>" placeholder="Cerca a . . ." readonly/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Tipo de Incidencia</label>
                                <input type="text" class="form-control" value="${tipoIncidencia != null ? tipoIncidencia.name : ''}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Urbanización</label>
                                <input type="text" class="form-control" value="${urbanizacion != null ? urbanizacion.name : ''}" readonly>
                            </div>

                            <div class="col-12">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" value="" id="ambulancia" name="ambulancia" <% if(incidencia.isRequiereAmbulancia()) { %> checked="" <%}%> disabled>
                                    <label class="form-check-label" for="ambulancia">Es necesario una ambulancia</label>
                                </div>
                            </div>

                            <div class="col-12 mt-3 text-center">
                                <label class="form-label">Imagen actual:</label>
                                <% if (incidencia.getFotoIncidencia() != null) { %>
                                <div>
                                    <img src="<%=request.getContextPath()%>/ServletSerenazgo?action=servirImagenIncidencia&id=<%= incidencia.getIdIncidencias() %>" alt="Imagen actual" style="max-width: 400px;"/>
                                </div>
                                <% } else { %>
                                <div class="alert alert-warning" role="alert">
                                    No hay foto adjunta para este reporte.
                                </div>
                                <% } %>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <a type="button" class="btn btn-label-primary" href="<%=request.getContextPath()%>/ServletSerenazgo?action=${activeMenu == 'MisReportes' ? 'mostrarMisIncidencias' : 'mostrarReportesIncidencias'}">Atrás</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="styles.jsp"/>
</body>
</html>

