<%@ page import="com.example.sanmi_telesoft.daos.UsuarioDAO" %>
<%@ page import="com.example.sanmi_telesoft.beans.Evento" %>
<%
    UsuarioDAO usuarioDAO = new UsuarioDAO();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="evento" type="com.example.sanmi_telesoft.beans.Evento" scope="request"/>

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


<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-academy-course.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:14:25 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>Eventos | <%=evento.getNombreEvento() %></title>


    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <!-- End Google Tag Manager -->

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/plyr/plyr.css"/>

    <!-- Page CSS -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/app-academy.css"/>

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    <style>
        .breadcrumb {
            display: flex;
            list-style: none;
            padding: 0;
            color: gray;

        }
        .breadcrumb li {
            font-size: 20px;
        }
        .breadcrumb li:not(:last-child)::after {
            content: "/";
            margin: 0 10px;
        }
        .breadcrumb a {
            color: gray;

        }
    </style>

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

            <!-- Navbar -->

            <jsp:include page="navBar.jsp"/>

            <!-- / Navbar -->


            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <nav>
                        <ul class="breadcrumb" style="margin-bottom: -30px" >
                            <li><a href="<%=request.getContextPath()%>/ServletVecino?action=listaEventos">Todos los eventos</a></li>
                            <li><a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento.getIdEventos() %>" style="color:black"><%= evento.getNombreEvento() %></a></li>
                        </ul>
                    </nav>



                    <div class="card g-3 mt-5">
                        <div class="card-body row g-3">
                            <div class="col-lg-8">
                                <div class="d-flex justify-content-between align-items-center flex-wrap mb-2 gap-1">
                                    <div class="me-1">
                                        <h5 style="font-size:30px; color:#000000; font-weight: bold" class="mb-1"><%= evento.getNombreEvento() %></h5>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <% if (evento.getTipoEvento().getNameTipo().equals("Cultura")) { %>
                                        <span class="badge bg-label-warning">Cultura</span>
                                        <% } %>
                                        <% if (evento.getTipoEvento().getNameTipo().equals("Deporte")) { %>
                                        <span class="badge bg-label-hover-success">Deporte</span>
                                        <% } %>
                                    </div>
                                </div>
                                <div style="margin-top: 25px" class="card academy-content shadow-none border">
                                    <div class="p-2">
                                        <div class="rounded-2 text-center mb-3">
                                            <a><img style="height:auto;width: 800px; border-radius: 10px; margin-bottom: -20px"
                                                    class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento1.jpg"
                                                    alt="tutor image 1" /></a>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <h5 style="font-size: 25px; color: #595858" class="mb-2">Descripción</h5>
                                        <p class="mb-0 pt-1"><%= evento.getDescriptionEvento() %></p>

                                        <hr class="my-4">

                                        <div class="row">
                                            <% if (evento.getProfesor() != null) { %>
                                            <div class="col-md-5">
                                                <h5>Organizado por:</h5>
                                                <div class="d-flex justify-content-start align-items-center user-name">
                                                    <div class="avatar-wrapper">
                                                        <div class="avatar avatar-sm me-2">
                                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/11.png" alt="Avatar" class="rounded-circle">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex flex-column">
                                                        <% int idCoordi = evento.getIdCoordinadora(); %>
                                                        <span class="fw-medium">
                    <%= usuarioDAO.obtenerDatosporId(idCoordi).getNombreUsuario() + " " + usuarioDAO.obtenerDatosporId(idCoordi).getApellidoUsuario() %>
                </span>
                                                        <small class="text-muted">Coordinador de eventos</small>
                                                        <small class="text-muted">Contacto: <%= usuarioDAO.obtenerDatosporId(idCoordi).getCorreoUsuario() %></small>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>
                                            <div class="col-md-1 d-flex justify-content-center align-items-center">
                                                <div style="border-left: 1px solid rgba(83,82,82,0.6); height: 100%;"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <h5>Profesor:</h5>
                                                <div class="d-flex justify-content-start align-items-center user-name">
                                                    <div class="avatar-wrapper">
                                                        <div class="avatar avatar-sm me-2">
                                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/11.png" alt="Avatar" class="rounded-circle">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex flex-column">
                                                        <span class="fw-medium">
                                                            <%= evento.getProfesor().getNombreProfesor() + " " + evento.getProfesor().getApellidoProfesor() %>
                                                        </span>
                                                        <small class="text-muted">Profesor de <%= evento.getTipoEvento().getNameTipo() %></small>
                                                        <small class="text-muted">Especialista en <%= evento.getProfesor().getCursoProfesor() %></small>

                                                        <!--<small class="text-muted">Contacto: <%= evento.getProfesor().getDniProfesor() %></small>  Aquí puedes añadir más detalles si es necesario -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                        <div class="col-lg-4">
                                            <div class="accordion stick-top accordion-bordered" id="courseContent">
                                                <div class="accordion-item shadow-none border border-bottom-0 active mb-0">
                                                    <div class="accordion-header" id="headingOne">
                                                        <button type="button" class="accordion-button bg-lighter rounded-0"
                                                                data-bs-toggle="collapse" data-bs-target="#chapterOne"
                                                                aria-expanded="true" aria-controls="chapterOne">
                            <span class="d-flex flex-column">
                                <span class="h5 mb-1">Descripción</span>
                            </span>
                                                        </button>
                                                    </div>

                                                    <div style="cursor:default" id="chapterOne" class="accordion-collapse collapse show" data-bs-parent="#courseContent">
                                                        <div style="cursor:default" class="accordion-body py-3 border-top">
                                                            <div style="cursor:default" class="form d-flex align-items-center mb-3">
                                                                <label class="form-check-label ms-3" style="cursor:auto">
                                                                    <a class="h5">Fecha: </a>
                                                                    <p class="mt-2"><%= evento.getFechaEventoStart() %></p>
                                                                </label>
                                                            </div>

                                                            <div class="form d-flex align-items-center mb-3">
                                                                <label class="form-check-label ms-3" style="cursor:auto">
                                                                    <a class="h5">Hora de inicio: </a>
                                                                    <p class="mt-2"><%= evento.getHoraEventoStart() %></p>
                                                                </label>
                                                            </div>
                                                            <div class="form d-flex align-items-center mb-3">
                                                                <label class="form-check-label ms-3" style="cursor:auto">
                                                                    <a class="h5">Hora de fin: </a>
                                                                    <p class="mt-2"><%= evento.getHoraEventoEnd() %></p>
                                                                </label>
                                                            </div>

                                                            <div class="form d-flex align-items-center mb-3">
                                                                <label class="form-check-label ms-3" style="cursor:auto">
                                                                    <a class="h5">Vacantes disponibles: </a>
                                                                    <p class="mt-2"><%= evento.getVacantesDisp() %></p>
                                                                </label>
                                                            </div>
                                                            <div class="form d-flex align-items-center mb-3">
                                                                <label class="form-check-label ms-3" style="cursor:auto">
                                                                    <a class="h5">Ubicación: </a>
                                                                    <p class="mt-2"><%= evento.getLugarEvento() %></p>
                                                                </label>
                                                            </div>
                                                            <div class="form d-flex align-content-center mb-3" style="margin-top: 30px;">
                                                                <a href="<%=request.getContextPath()%>/ServletVecino?action=inscribirEvento&id=<%= evento.getIdEventos() %>"
                                                                   class="btn btn-primary" style="flex: auto;">Inscríbete aquí</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="accordion-item shadow-none border border-bottom-0 mb-0">
                                                </div>

                                            </div>
                                        </div>
                        </div>
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
                                            <a>Telesoft</a>
                                        </div>

                                    </div>
                                </footer>
                                <!-- / Footer -->


                                <div class="content-backdrop fade"></div>

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
                    <script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
                    <script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
                    <script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
                    <script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
                    <script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
                    <script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

                    <!-- endbuild -->

                    <!-- Vendors JS -->
                    <script src="${pageContext.request.contextPath}/assets/vendor/libs/plyr/plyr.js"></script>

                    <!-- Main JS -->
                    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


                    <!-- Page JS -->
                    <script src="${pageContext.request.contextPath}/assets/js/app-academy-course-details.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-academy-course-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:14:36 GMT -->
</html>

<!-- beautify ignore:end -->