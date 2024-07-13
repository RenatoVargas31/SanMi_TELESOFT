<%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 16/06/2024
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.sanmi_telesoft.beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="incidencias" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.Incidencia>" scope="request"/>
<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi : Tabla de Incidencias</title>

    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp"/>
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/theme-semi-dark.css"
          class="template-customizer-theme-css"/>
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
        /* Personalización adicional del modal */
        .modal-content {
            border-radius: 15px;
            padding: 20px;
            background: linear-gradient(145deg, #f0f0f0, #cacaca);
        }
        .modal-header {
            background-color: #1A4D8F;
            color: white;
            border-bottom: 1px solid #dee2e6;
            border-radius: 15px 15px 0 0;
        }
        .modal-footer {
            border-top: 1px solid #dee2e6;
            border-radius: 0 0 15px 15px;
        }
        .modal-title {
            color: white;
        }
        .modal-body {
            font-size: 1.1rem;
            text-align: center;
        }
        .btn-close {
            background-color: white;
            border-radius: 50%;
        }
        .btn-secondary, .btn-danger {
            margin: 0 10px;
        }
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>

<body>

<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0"
            style="display: none; visibility: hidden"></iframe>
</noscript>

<div class="layout-wrapper layout-content-navbar  ">
    <div class="layout-container">
        <jsp:include page="sideBar.jsp"/>
        <div class="layout-page">
            <jsp:include page="navBar.jsp"/>

            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">


                    <div class="card">
                        <div class="card-datatable table-responsive">
                            <div class="d-flex justify-content-between align-items-center">
                                <h3 class="m-4 fw-bold">Reporte de Incidencia</h3>

                            </div>
                            <table id="table-misincidencias" class="datatables-basic table border-top">
                                <thead>
                                <tr>
                                    <th>Incidencia</th>
                                    <th>Usuario</th>
                                    <th>Lugar</th>
                                    <th>Estado</th>
                                    <th>Prioridad</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>

                                <tbody>
                                <%
                                    int i = 1;
                                    for (Incidencia incidencia : incidencias) {
                                        String modalId = "modalScrollable" + i;

                                %>
                                <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle<%= i %>">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <% if(incidencia.getDescripcionSolucion() == null) { %>
                                                <p>Me dirijo a ustedes con preocupación para informar sobre un incidente  que está ocurriendo en este momento en <%=incidencia.getLugarIncidencia()%> de San Miguel.</p>
                                                <% } else { %>
                                                <p><%= incidencia.getDescripcionSolucion() %></p>
                                                <% } %>

                                                <p>Atentamente,</p>
                                                <p><%= incidencia.getNameUsuario() %></p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/incendio1.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: <%= incidencia.getLugarIncidencia() %></p>
                                                        <p class="card-text">Referencia: <%= incidencia.getReferenciaIncidencia() %></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <tr>
                                    <td><%= incidencia.getNombreIncidencia() %></td>
                                    <td><%= incidencia.getNameUsuario()%></td>
                                    <td><%= incidencia.getLugarIncidencia() %></td>
                                    <% if(incidencia.getEstado() == 1) { %>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <% } else if(incidencia.getEstado() == 2) { %>
                                    <td><span class="badge bg-warning">Procesando</span></td>
                                    <% } else if(incidencia.getEstado() == 3) { %>
                                    <td><span class="badge bg-success">Resuelta</span></td>
                                    <% } %>
                                    <% if(incidencia.getCriticidad() == 1) { %>
                                    <td><span class="badge bg-primary">Baja</span></td>
                                    <% } else if(incidencia.getCriticidad() == 2) { %>
                                    <td><span class="badge bg-warning">Media</span></td>
                                    <% } else if(incidencia.getCriticidad() == 3) { %>
                                    <td><span class="badge bg-danger">Alta</span></td>
                                    <% } else { %>
                                    <td><span class="badge bg-secondary">No asignado</span></td>
                                    <% } %>
                                    <td>
                                        <a type="button"
                                            class="btn btn-icon btn-icon-only btn-outline-primary btn-sm"
                                            href="<%= request.getContextPath()%>/ServletSerenazgo?action=verDetallePersonal&id=<%=incidencia.getIdIncidencias()%>">
                                        <i class='bx bx-show'></i></a>

                                        <a type="button"
                                           class="btn btn-icon btn-icon-only btn-outline-primary btn-sm"
                                           href="<%= request.getContextPath()%>/ServletSerenazgo?action=mostrarActualizarIncidencia&id=<%=incidencia.getIdIncidencias()%>"
                                        ><i class='bx bx-edit'></i></a>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-outline-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion(<%=incidencia.getIdIncidencias()%>)" data-bs-target="#"><i
                                                class='bx bx-x'></i></button>


                                    </td>
                                </tr>
                                <%
                                        i++;
                                    }
                                %>
                                </tbody>

                            </table>
                        </div>
                    </div>

                </div>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
                <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
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
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear())

                            </script>
                            , made by <a href="https://themeselection.com/" target="_blank"
                                         class="footer-link fw-medium">Telesoft</a>
                        </div>

                    </div>
                </footer>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deletionModal" tabindex="-1" aria-labelledby="deletionModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletionModalLabel">¿Estás seguro de que quieres calificar como falsa esta incidencia?</h5>
            </div>
            <div class="modal-body">
                <p>Esta acción no se puede deshacer.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" id="confirmDeletionBtn">Reportar</button>
            </div>
        </div>
    </div>
</div>

<script>
    function promptDeletion(incidenciaId) {
        var myModal = new bootstrap.Modal(document.getElementById('deletionModal'));
        myModal.show(); // This is the correct way to show a modal
        const confirmDeletionBtn = document.getElementById('confirmDeletionBtn');
        confirmDeletionBtn.onclick = function() {
            submitDeletion(incidenciaId);
        };
    }

    function submitDeletion(incidenciaId) {
        alert('La incidencia ha sido reportada correctamente.');
        // Hide the modal first
        const modal = bootstrap.Modal.getInstance(document.getElementById('deletionModal'));
        modal.hide();

        // Redirect to the servlet with the id of the incidencia
        window.location.href = '<%= request.getContextPath() %>/ServletSerenazgo?action=falsearIncidencia&id=' + incidenciaId;
    }
</script>

</body>

</html>
