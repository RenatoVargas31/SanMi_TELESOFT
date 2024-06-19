<%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 15/06/2024
  Time: 4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.sanmi_telesoft.beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="listaIncidencias" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.Incidencia>" scope="request"/>

<!DOCTYPE html>
<!-- =========================================================
* Sneat - Bootstrap Dashboard PRO | v1.0.0
==============================================================

* Product Page: https://themeselection.com/item/sneat-dashboard-pro-bootstrap/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->


<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:08 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>DataTable | SanMI</title>


    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap"
          rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/theme-semi-dark.css"
          class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css"/>
    <!-- Row Group CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
    <!-- Form Validation -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css"/>

    <!-- Page CSS -->


    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>

<body>


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0"
            style="display: none; visibility: hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar  ">
    <div class="layout-container">


        <!-- Menu -->

        <jsp:include page="sideBar.jsp"/>
        <!-- / Menu -->
        <!-- Layout container -->
        <div class="layout-page">
            <jsp:include page="navBar.jsp"/>

            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <!-- DataTable with Buttons -->
                    <div class="card">
                        <div class="card-datatable table-responsive">
                            <table id="table-incidenciasGenerales" class="datatables-basic table border-top">
                                <h3 class="m-4 fw-bold">Incidencias Generales</h3>
                                <thead>
                                <tr>
                                    <th>Incidencia</th>
                                    <th>Lugar</th>
                                    <th>Estado</th>
                                    <th>Prioridad</th>
                                    <th>Usuario</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    int i = 1;
                                    for (Incidencia incidencia : listaIncidencias) {
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
                                                <p>Me dirijo a ustedes con preocupación para informar sobre un incidente sobre <%=incidencia.getIdTipoIncidencia()%> que está ocurriendo en este momento en <%=incidencia.getLugarIncidencia()%> de San Miguel.</p>
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
                                    <td><%= incidencia.getLugarIncidencia() %></td>
                                    <% if(incidencia.getEstado() == 1) { %>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <% } else if(incidencia.getEstado() == 2) { %>
                                    <td><span class="badge bg-warning">En proceso</span></td>
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
                                    <td><%= incidencia.getNameUsuario() %></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-outline-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#<%= modalId %>">
                                            <i class='bx bx-show'></i>
                                        </button>
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
                    <!-- Modal to add new record -->
                    <div class="offcanvas offcanvas-end" id="add-new-record">
                        <div class="offcanvas-header border-bottom">
                            <h5 class="offcanvas-title" id="exampleModalLabel">New Record</h5>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                    aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body flex-grow-1">
                            <form class="add-new-record pt-0 row g-2" id="form-add-new-record" onsubmit="return false">
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicFullname">Full Name</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicFullname2" class="input-group-text"><i
                                                class="bx bx-user"></i></span>
                                        <input type="text" id="basicFullname" class="form-control dt-full-name"
                                               name="basicFullname" placeholder="John Doe" aria-label="John Doe"
                                               aria-describedby="basicFullname2"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicPost">Post</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicPost2" class="input-group-text"><i class='bx bxs-briefcase'></i></span>
                                        <input type="text" id="basicPost" name="basicPost" class="form-control dt-post"
                                               placeholder="Web Developer" aria-label="Web Developer"
                                               aria-describedby="basicPost2"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicEmail">Email</label>
                                    <div class="input-group input-group-merge">
                                        <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                                        <input type="text" id="basicEmail" name="basicEmail"
                                               class="form-control dt-email" placeholder="john.doe@example.com"
                                               aria-label="john.doe@example.com"/>
                                    </div>
                                    <div class="form-text">
                                        You can use letters, numbers & periods
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicDate">Joining Date</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicDate2" class="input-group-text"><i
                                                class='bx bx-calendar'></i></span>
                                        <input type="text" class="form-control dt-date" id="basicDate" name="basicDate"
                                               aria-describedby="basicDate2" placeholder="MM/DD/YYYY"
                                               aria-label="MM/DD/YYYY"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicSalary">Salary</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicSalary2" class="input-group-text"><i
                                                class='bx bx-dollar'></i></span>
                                        <input type="number" id="basicSalary" name="basicSalary"
                                               class="form-control dt-salary" placeholder="12000" aria-label="12000"
                                               aria-describedby="basicSalary2"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary data-submit me-sm-3 me-1">Submit
                                    </button>
                                    <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="offcanvas">
                                        Cancel
                                    </button>
                                </div>
                            </form>

                        </div>
                    </div>
                    <!--/ DataTable with Buttons -->

                    <hr class="my-5">

                </div>
                <!-- / Content -->


                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear())

                            </script>
                            , made with ❤️ by <a href="https://themeselection.com/" target="_blank"
                                                 class="footer-link fw-medium">Telesoft</a>
                        </div>

                    </div>
                </footer>
                <!-- / Footer -->


                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>


    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>


    <!-- Drag Target Area To SlideIn Menu On Small Screens -->
    <div class="drag-target"></div>

</div>
<!-- / Layout wrapper -->
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->

<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

<!-- endbuild -->

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<!-- Flat Picker -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Form Validation -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/auto-focus.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/init-datatables.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:09 GMT -->
</html>

<!-- beautify ignore:end -->


