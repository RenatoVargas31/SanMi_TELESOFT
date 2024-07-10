<jsp:useBean id="evento" type="com.example.sanmi_telesoft.beans.Evento" scope="request"/>
<jsp:useBean id="evento1" type="com.example.sanmi_telesoft.beans.Evento" scope="request"/>
<jsp:useBean id="evento2" type="com.example.sanmi_telesoft.beans.Evento" scope="request"/>
<jsp:useBean id="usuario" type="com.example.sanmi_telesoft.beans.Usuario" scope="session" class="com.example.sanmi_telesoft.beans.Usuario"/>
<%@ page import="com.example.sanmi_telesoft.daos.UsuarioDAO" %>
<%@ page import="com.example.sanmi_telesoft.beans.Evento" %>
<%
    UsuarioDAO usuarioDAO = new UsuarioDAO();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-academy-course.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:14:25 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
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


    <title>SanMi | Inscripcion: <%= evento.getNombreEvento() %></title>


    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        '../../../../www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-5DDHKGP');</script>
    <!-- End Google Tag Manager -->

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/plyr/plyr.css" />

    <!-- Page CSS -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/app-academy.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>


<body>


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
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
                            <li><a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento.getIdEventos() %>"> <%= evento.getNombreEvento() %></a></li>
                            <li><a href="<%=request.getContextPath()%>/ServletVecino?action=inscribirEvento&id=<%= evento.getIdEventos() %> " style="color:black">Inscripción</a></li>
                        </ul>
                    </nav>
                    <div class="card g-3 mt-5" >
                        <div class="card-body row g-3" >
                            <div class="col-lg-8">
                                <div class="d-flex justify-content-between align-items-center flex-wrap mb-2 gap-1">

                                    <div class="flex-grow-1 ms-3">
                                        <div class="row">
                                        <div class="col-lg-3">
                                            <% if (evento.getIdEventos() > 12) { %>
                                            <img style="border-radius: 5px" class="img-fluid" src="${pageContext.request.contextPath}/ServletVecino?action=servirImagenEvento&id=<%= evento.getIdEventos() %>" alt="Foto del reporte">
                                            <% } else {%>
                                            <img style="border-radius: 5px" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento<%= evento.getIdEventos() %>.jpg" alt="Imagen del evento">
                                            <% }%>
                                       </div>
                                            <div class="col-lg-9 mt-lg-0 mt-4">
                                        <h5 style="font-size:30px; font-weight:700;  color:#000000" class="mb-1"><%= evento.getNombreEvento() %></h5>
                                        <p style="font-size:15px; color: rgb(55,55,55); margin-top: 15px" class="mb-1">
                                            <i class="fas fa-calendar" style="margin-right:10px"></i>
                                            <span><%= evento.getFechaEventoEnTexto(evento.getFechaEventoStart()) %> - <%= evento.getFechaEventoEnTexto(evento.getFechaEventoEnd()) %></span>
                                            <br>
                                            <i class="fas fa-clock" style="margin-right: 10px"></i>
                                            <span><%= evento.getHoraEventoEnTexto(evento.getHoraEventoStart()) %> - <%= evento.getHoraEventoEnTexto(evento.getHoraEventoEnd()) %></span>
                                        </p>
                                    </div>
                                        </div>
                                    </div>
                                </div>

                                <div style="margin-top: 25px" class="card academy-content shadow-none border">
                                    <div class="card-body">
                                        <h3 style="font-size: 35px; margin-bottom: 20px; font-weight: bold; color: #000000" class="mb-2">Inscripción</h3>
                                        <hr class="my-4">
                                        <div class="row lh-lg ">
                                                    <h3 style=" color: rgb(0,0,0); margin-bottom:40px; font-weight: 650;;line-height: 1.5" class="mb-0 pt-1">Recuerda que:</h3>
                                                    </div>
                                        <div class ="row lh-lg pr-3 "  style="padding-right: 30px">
                                        <h5 style="color: rgb(55,55,55);margin-top:20px;margin-left: 15px;line-height: 1.5 ;text-align: justify" >- El uso de entradas están bajo responsabilidad del usuario actual</h5></div>
                                        <div class ="row lh-lg pr-3" style="padding-right: 30px" ><h5 style="color: rgb(55,55,55);margin-left: 15px;line-height: 1.5;text-align: justify">- El máximo de entradas es 4, con el fin de mantener el orden</h5></div>
                                            <div class ="row lh-lg " style="padding-right: 30px"><h5 style="color: rgb(55,55,55);margin-left: 15px;line-height: 1.5;text-align: justify">- El uso indebido de las entradas puede terminar en la suspensión de tu cuenta </h5></div>

                                        <form method="post" action="<%= request.getContextPath() %>/ServletVecino?action=guardarInscripcion&id=<%= evento.getIdEventos() %> ">





                                            <div class="container mt-4">
                                                <div class="row">
                                                    <div class="col-12">
                                                                <div class="row justify-content-center">
                                                                    <div class="col-10">
                                                                <button style="width: 100%;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addNewCCModal"> Confirmar inscripción </button></div></div>
                                                            <!-- Add New Credit Card Modal-->
                                                            <div class="modal fade" id="addNewCCModal" tabindex="-1" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
                                                                    <div class="modal-content p-3 p-md-5">
                                                                        <div class="modal-body">
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            <div class="text-center mb-4">
                                                                                <h3 style=" color: rgb(0,0,0); margin-bottom:40px; font-weight: 650;;line-height: 1.5" class="mb-0 pt-1">Confirmación de inscripción</h3>
                                                                                <hr class="my-4">
                                                                                <h5>¿Estás seguro de inscribirte en el evento <%= evento.getNombreEvento()%>?</h5>
                                                                                <p>No podrás eliminar esta inscripción a futuro</p>
                                                                            </div>
                                                                                <div class="col-12 text-center">
                                                                                    <button type="submit" class="btn btn-primary me-sm-3 me-1 mt-3">
                                                                                        Confirmar inscripción
                                                                                    </button>
                                                                                    <button type="reset" class="btn btn-label-secondary btn-reset mt-3" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                                                </div>

                                                                        </div>

                                                                </div>
                                                            </div>



                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                        </form>

                                        <hr class="my-4">
                                        <div class="row">
                                            <% if (evento.getProfesor() != null) { %>
                                            <div class="col-md-6">
                                                <h5 style="color: rgb(0,0,0); font-weight: 600">Organizado por:</h5>
                                                <div class="d-flex justify-content-start align-items-start user-name">
                                                    <div class="d-flex flex-column" >
                                                        <div class="avatar avatar-lg me-4">
                                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/11.png" alt="Avatar" class="rounded-circle img-fluid">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex flex-column">
                                                        <% int idCoordi = evento.getIdCoordinadora(); %>
                                                        <span class="fs-6"  style="color: rgb(0,0,0);font-weight: 650">
                    <%= usuarioDAO.obtenerDatosporId(idCoordi).getNombreUsuario() + " " + usuarioDAO.obtenerDatosporId(idCoordi).getApellidoUsuario() %>
                </span>
                                                        <span class="fs-6 fw-medium"  style="color: rgb(55,55,55)">Coordinador de eventos</span>
                                                        <span class="fs-6 fw-medium"  style="color: rgb(55,55,55)">Contacto: <%= usuarioDAO.obtenerDatosporId(idCoordi).getCorreoUsuario() %></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>
                                            <div class="col-md-1 d-flex justify-content-center align-items-center">
                                                <div style="border-left: 1px solid rgba(83,82,82,0.6); height: 100%;"></div>
                                            </div>
                                            <div class="col-md-5 mt-lg-0 mt-3">
                                                <h5 style="color: rgb(0,0,0);font-weight: 600" >Profesor:</h5>
                                                <div class="d-flex justify-content-start align-items-start user-name">
                                                    <div class="d-flex flex-column" >
                                                        <div class="avatar avatar-lg me-4">
                                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/11.png" alt="Avatar" class="rounded-circle img-fluid">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex flex-column">
                                                        <span class="fs-6"  style="color: rgb(0,0,0);font-weight: 650">
                                                            <%= evento.getProfesor().getNombreProfesor() + " " + evento.getProfesor().getApellidoProfesor() %>
                                                        </span>
                                                        <span class="fs-6 fw-medium"  style="color: rgb(55,55,55)"> Profesor de <%= evento.getTipoEvento().getNameTipo() %> </span>
                                                            <span class="fs-6  fw-medium"  style="color: rgb(55,55,55)">  Especialista en <%= evento.getProfesor().getCursoProfesor() %> </span>
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
                                            <button type="button" class="accordion-button bg-lighter rounded-0" data-bs-toggle="collapse" data-bs-target="#chapterOne" aria-expanded="true" aria-controls="chapterOne">
                                              <span class="d-flex flex-column">
                                        <% if (evento.getTipoEvento().getNameTipo().equals("Cultura")) { %>
                                          <span class="h5 mb-1 fw-bold fs-4" style="color:rgb(55,55,55)">Más eventos de cultura</span>
                                        <% } %>
                                        <% if (evento.getTipoEvento().getNameTipo().equals("Deporte")) { %>
                                         <span class="h5 mb-1 fw-bolder fs-4" style="color:rgb(55,55,55)">Más eventos de deporte</span>
                                        <% } %>
                                                </span>
                                            </button>
                                        </div>

                                        <div style="cursor: default" id="chapterOne" class="accordion-collapse collapse show" data-bs-parent="#courseContent">
                                            <div class="accordion-body py-3 border-top">
                                                <div class="form d-flex align-items-center mb-3">
                                                    <div class="card p-1 h-100 shadow-none border">
                                                        <!-- Primer evento -->
                                                        <div class="card-body p-3 pt-2">
                                                            <div class="rounded-2 text-center mb-3">
                                                                <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento1.getIdEventos() %>">
                                                                    <% if (evento1.getIdEventos() > 12) { %>
                                                                    <img style="height: 175px; width: 390px; border-radius: 10px;"  class="img-fluid" src="${pageContext.request.contextPath}/ServletVecino?action=servirImagenEvento&id=<%= evento1.getIdEventos() %>" alt="Foto del reporte">
                                                                    <% } else {%>
                                                                    <img style="height: 175px; width: 390px; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento<%= evento1.getIdEventos() %>.jpg" alt="Imagen del evento">
                                                                    <% }%>
                                                                </a>
                                                            </div>
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <% if (evento1.getTipoEvento().getNameTipo().equals("Cultura")) { %>
                                                                <span class="badge bg-label-warning">Cultura</span>
                                                                <% } %>
                                                                <% if (evento1.getTipoEvento().getNameTipo().equals("Deporte")) { %>
                                                                <span class="badge bg-label-hover-success">Deporte</span>
                                                                <% } %>
                                                            </div>
                                                            <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento1.getIdEventos() %>" class="h5 fw-bold" style="color:black"> <%= evento1.getNombreEvento() %></a>
                                                            <p class="mt-2" style="color:rgb(55,55,55)"><%= evento1.getDescriptionEvento() %></p>
                                                            <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">
                                                                <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center" href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento1.getIdEventos() %>">
                                                                    <span class="me-2">Ver descripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>
                                                            </div>
                                                        </div>

                                                        <!-- Segundo evento -->
                                                        <div class="card-body p-3 pt-2">
                                                            <div class="rounded-2 text-center mb-3">
                                                                <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento2.getIdEventos() %>">
                                                                    <% if (evento2.getIdEventos() > 12) { %>
                                                                    <img style="height: 175px; width: 390px; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/ServletVecino?action=servirImagenEvento&id=<%= evento2.getIdEventos() %>" alt="Foto del reporte">
                                                                    <% } else {%>
                                                                    <img style="height: 175px; width: 390px; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento<%= evento2.getIdEventos() %>.jpg" alt="Imagen del evento">
                                                                    <% }%>
                                                                </a>
                                                            </div>
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <% if (evento2.getTipoEvento().getNameTipo().equals("Cultura")) { %>
                                                                <span class="badge bg-label-warning">Cultura</span>
                                                                <% } %>
                                                                <% if (evento2.getTipoEvento().getNameTipo().equals("Deporte")) { %>
                                                                <span class="badge bg-label-hover-success">Deporte</span>
                                                                <% } %>
                                                            </div>
                                                            <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento2.getIdEventos() %>" class="h5 fw-bold" style="color:black"><%= evento2.getNombreEvento() %></a>
                                                            <p class="mt-2" style="color:rgb(55,55,55)"><%= evento2.getDescriptionEvento() %></p>
                                                            <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">
                                                                <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center" href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento2.getIdEventos() %>">
                                                                    <span class="me-2">Ver descripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>
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
                                    <div class="accordion-item shadow-none border border-bottom-0 mb-0">
                                    </div>


                                </div>
                            </div>
                        </div>
                </div>

            </div>




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

