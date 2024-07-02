<jsp:useBean id="evento" type="com.example.sanmi_telesoft.beans.Evento" scope="request"/>
<jsp:useBean id="evento1" type="com.example.sanmi_telesoft.beans.Evento" scope="request"/>
<jsp:useBean id="evento2" type="com.example.sanmi_telesoft.beans.Evento" scope="request"/>
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


    <title>SanMi | Entradas: <%= evento.getNombreEvento() %></title>


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
                            <li><a href="<%=request.getContextPath()%>/ServletVecino?action=inscribirEvento&id=<%= evento.getIdEventos() %> " style="color:black">Entradas</a></li>
                        </ul>
                    </nav>
                    <div class="card g-3 mt-5" >
                        <div class="card-body row g-3" >
                            <div class="col-lg-8">
                                <div class="d-flex justify-content-between align-items-center flex-wrap mb-2 gap-1">
                                    <div class="d-flex align-content-around">
                                        <h1><img style="height:70px;width: auto; margin-bottom: -20px; border-radius: 5px" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento1.jpg" alt="tutor image 1" /></h1>

                                    </div>
                                    <div class="me-10" style="flex:auto; margin-left:30px"  >

                                        <h5 style="font-size:30px;  color:#383737" class="mb-1" style="margin-bottom: 10px"><%= evento.getNombreEvento() %></h5>
                                        <h5 style="font-size:15px;  color:#535252; margin-right: 20px;margin-top: 15px"    class="mb-1"><i class="fas fa-calendar"style="margin-right:10px"></i><h7 style="margin-right: 10px"><%= evento.getFechaEventoEnTexto(evento.getFechaEventoStart())+ " -  " +evento.getFechaEventoEnTexto(evento.getFechaEventoEnd())%></h7>  <i class="fas fa-clock" style="margin-right: 10px"></i><%= evento.getHoraEventoEnTexto(evento.getHoraEventoStart())%> - <%=evento.getHoraEventoEnTexto(evento.getHoraEventoEnd()) %></h5>


                                    </div>

                                </div>
                                <div style="margin-top: 25px" class="card academy-content shadow-none border">
                                    <div class="card-body">
                                    <form method="post" action="<%= request.getContextPath() %>/ServletVecino?action=guardarInscripcion&id=<%= evento.getIdEventos() %> ">

                                            <h3 style="font-size: 30px; margin-bottom: 20px; font-weight: bold; color: #000000" class="mb-2">Entradas</h3>

                                        <hr class="my-4">
                                            <!-- Contenido de la tarjeta u otras secciones -->

                                            <h3 style="font-size: 22px; margin-top: 15px; color: rgb(34, 33, 33); font-weight: 500;" class="mb-0 pt-1">Cantidad:</h3>
                                            <div class="form-check form-check-inline mt-3">
                                                <input name="entradas" class="form-check-input" type="radio" value="1" id="defaultRadio1" checked/>
                                                <label style="font-size: 18px; margin-top: -3px; margin-right: 40px; margin-left: 10px;" class="form-check-label" for="defaultRadio1">
                                                    1 entrada
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline mt-3">
                                                <input name="entradas" class="form-check-input" type="radio" value="2" id="inlineRadio2" />
                                                <label style="font-size: 18px; margin-top: -3px; margin-right: 40px; margin-left: 10px;" class="form-check-label" for="inlineRadio2">
                                                    2 entradas
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline mt-3">
                                                <input name="entradas" class="form-check-input" type="radio" value="3" id="inlineRadio3" />
                                                <label style="font-size: 18px; margin-top: -3px; margin-right: 40px; margin-left: 10px;" class="form-check-label" for="inlineRadio3">
                                                    3 entradas
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline mt-3">
                                                <input name="entradas" class="form-check-input" type="radio" value="4" id="defaultRadio4" />
                                                <label style="font-size: 18px; margin-top: -3px; margin-left: 10px;" class="form-check-label" for="defaultRadio4">
                                                    4 entradas
                                                </label>
                                            </div>

                                            <!-- Botón para enviar el formulario -->
                                            <div class="form d-flex align-content-center mb-1" style="width: inherit;">
                                                <button type="submit" style="flex: auto; margin-top: 10px;" class="btn btn-primary">
                                                    Confirmar inscripción
                                                </button>
                                            </div>

                                    </form>


                                            <!-- Modal -->




                                        <h4 style="margin-top: 20px; color:rgb(34, 33, 33)"> Recuerda que:</h4>
                                        <h6 style="margin-top: 15px;margin-left: 15px" > El uso de entradas están bajo responsabilidad del usuario actual</h6>
                                        <h6 style="margin-top: 15px;margin-left: 15px">El máximo de entradas es 4, con el fin de mantener el orden</h6>
                                        <h6 style="margin-top: 15px;margin-left: 15px">El uso indebido de las entradas puede terminar en la suspensión de tu cuenta </h6>


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
                                            <button type="button" class="accordion-button bg-lighter rounded-0" data-bs-toggle="collapse" data-bs-target="#chapterOne" aria-expanded="true" aria-controls="chapterOne">
                                              <span class="d-flex flex-column">
                                        <% if (evento.getTipoEvento().getNameTipo().equals("Cultura")) { %>
                                        <span class="h5 mb-1">Más eventos de cultura</span>
                                        <% } %>
                                        <% if (evento.getTipoEvento().getNameTipo().equals("Deporte")) { %>
                                        <span class="h5 mb-1">Más eventos de deporte</span>
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
                                                                    <img style="height: 200px; width: fit-content; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento1.jpg" alt="Imagen del evento 1" />
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
                                                            <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento1.getIdEventos() %>" class="h5"><%= evento1.getNombreEvento() %></a>
                                                            <p class="mt-2"><%= evento1.getDescriptionEvento() %></p>
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
                                                                    <img style="height: 200px; width: fit-content; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento2.jpg" alt="Imagen del evento 2" />
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
                                                            <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento2.getIdEventos() %>" class="h5"><%= evento2.getNombreEvento() %></a>
                                                            <p class="mt-2"><%= evento2.getDescriptionEvento() %></p>
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

