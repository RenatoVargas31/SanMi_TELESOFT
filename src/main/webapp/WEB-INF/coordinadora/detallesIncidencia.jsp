<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 15/07/2024
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.sanmi_telesoft.beans.Incidencia" %>
<%@ page import="com.example.sanmi_telesoft.beans.TipoIncidencia" %>
<%@ page import="com.example.sanmi_telesoft.beans.Urbanizacion" %>
<jsp:useBean id="incidencia" class="com.example.sanmi_telesoft.beans.Incidencia" scope="request"/>
<jsp:useBean id="tipoIncidencia" type="com.example.sanmi_telesoft.beans.TipoIncidencia" scope="request"/>
<jsp:useBean id="urbanizacion" type="com.example.sanmi_telesoft.beans.Urbanizacion" scope="request"/>

<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <title>SanMi | Detalles de la Incidencia</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css"/>

    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    <style>
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>

<body>

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <jsp:include page="sideBar.jsp"/>
        <div class="layout-page">
            <jsp:include page="navBar.jsp"/>

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
                                            <label class="form-label">Teléfono</label>
                                            <input type="text" class="form-control" value="<%= incidencia.getTelefono()%>" placeholder="" readonly/>
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
                                                <img src="<%=request.getContextPath()%>/ServletCoordinadora?action=servirImagenIncidencia&id=<%= incidencia.getIdIncidencias() %>" alt="Imagen actual" style="max-width: 400px;"/>
                                            </div>
                                            <% } else { %>
                                            <div class="alert alert-warning" role="alert">
                                                No hay foto adjunta para este reporte.
                                            </div>
                                            <% } %>
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mt-4">
                                            <button class="btn btn-label-primary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/ServletCoordinadora?action=listarMisIncidencias';">Atrás</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/auto-focus.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/init-datatables.js"></script>

</body>
</html>
