<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.sanmi_telesoft.beans.Profesor" %>
<%@ page import="com.example.sanmi_telesoft.beans.Evento" %><%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 11/06/2024
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" type="com.example.sanmi_telesoft.beans.Usuario" scope="session" class="com.example.sanmi_telesoft.beans.Usuario"/>
<%
    ArrayList<Evento> lista=(ArrayList<Evento>) request.getAttribute("listarEventos");
    ArrayList<Evento> listaMisEventos=(ArrayList<Evento>) request.getAttribute("listaMisEventos");
 int coordiActivos=(int) request.getAttribute("coordiActivos");

%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/ui-carousel.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:31 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi | Bienvenida Coordinadora </title>


    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <script>(function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
            'gtm.start':
                new Date().getTime(), event: 'gtm.js'
        });
        var f = d.getElementsByTagName(s)[0],
            j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src =
            '${pageContext.request.contextPath}/${pageContext.request.contextPath}/www.googletagmanager.com/gtm5445.html?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-5DDHKGP');</script>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/swiper/swiper.css"/>

    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/ui-carousel.css"/>

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


            <!-- Navbar -->
            <jsp:include page="navBar.jsp"/>
            <!-- / Navbar -->


            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">





                    <div class="row justify-content-center">
                        <div class="col-lg-11 col-md-11 col-sm-11 ">
                            <div id="carouselExampleDark" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>

                                </div>
                                <div class="carousel-inner" >
                                    <div class="carousel-item active">
                                        <img class="d-block w-100 "  style=" height: 32vw;" src="${pageContext.request.contextPath}/assets/img/backgrounds/ga1.jpg" alt="First slide" />

                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" style=" height: 32vw;" src="${pageContext.request.contextPath}/assets/img/backgrounds/ga2.png" alt="Second slide" />

                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"  style=" height: 32vw;"  src="${pageContext.request.contextPath}/assets/img/backgrounds/ga5.jpg" alt="Third slide" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100 " style=" height: 32vw;"  src="${pageContext.request.contextPath}/assets/img/backgrounds/ga3.jpg" alt="Third slide" />
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleDark" role="button" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleDark" role="button" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-transparent shadow-none border-0 my-4">
                        <div class="card-body row p-0 pb-3">
                <h1 class="text-center ">¡Bienvenido <%=usuario.getNombreUsuario()+" "+usuario.getApellidoUsuario()%>! 👋 </h1>
                <%  // Etiqueta de script JSP para inserción de código Java
                    if (usuario.getIdTipoCoordinadora() == 1) {  // Verifica si el tipo de coordinadora es 1
                %>
                <h3 class="text-center">Coordinadora de Cultura</h3>
                <%  } else if (usuario.getIdTipoCoordinadora() == 2) {  // Verifica si el tipo de coordinadora es 2
                %>
                <h3 class="text-center"> Coordinadora de Deporte</h3>

                <%  }  // Fin del bloque de código Java dentro de la etiqueta de script JSP
                %>
                            <hr class="my-4">
                            <p>Tu actividad es importante para mejorar el bienestar de todos los vecinos del
                                distrito,
                                tu participación en los eventos y tus reportes de incidencias nos permite
                                trabajar juntos. </p>

                            <div class="d-flex justify-content-between flex-wrap gap-3 me-5">
                                <div class="d-flex align-items-center gap-3 me-4 me-sm-0">
          <span class=" bg-label-primary p-2 rounded">
            <i class='bx bx-user bx-sm'></i>
          </span>
                                    <div class="content-right">
                                        <p class="mb-0">Coordinadores activos</p>
                                        <h4 class="text-primary mb-0"><%=coordiActivos%></h4>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-3">
          <span class="bg-label-info p-2 rounded">
            <i class='bx bx-time bx-sm'></i>
          </span>
                                    <div class="content-right">
                                        <p class="mb-0">Eventos de <%
                                            if (usuario.getIdTipoCoordinadora() == 1) {
                                        %>
                                            Cultura
                                            <%
                                            } else if (usuario.getIdTipoCoordinadora() == 2) {
                                            %>
                                            Deporte
                                            <%
                                                }
                                            %>en curso</p>
                                        <h4 class="text-info mb-0"><%=lista.size()%></h4>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-3">
          <span class="bg-label-warning p-2 rounded">
            <i class='bx bx-check-circle bx-sm'></i>
          </span>
                                    <div class="content-right">
                                        <p class="mb-0">Eventos creados activos </p>
                                        <h4 class="text-warning mb-0"><%=listaMisEventos.size()%></h4>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                            <hr class="my-4">
                            <h3 class="mb-1 fw-bold fs-3" style="color: black;">
                                Eventos de
                                <%
                                    if (usuario.getIdTipoCoordinadora() == 1) {
                                %>
                                Cultura
                                <%
                                } else if (usuario.getIdTipoCoordinadora() == 2) {
                                %>
                                Deporte
                                <%
                                    }
                                %>
                            </h3>
                    <hr class="my-4 opacity-0">
                            <% int i = 0; %>

                            <div class="row gy-4 mb-4">
                                <% for (Evento evento : lista) { %>
                                <% if (i >= 3) break; %> <!-- Condición para mostrar solo 3 eventos -->

                                <div class="col-sm-6 col-lg-4">
                                    <div class="card p-2 h-100 shadow-none border" data-value="<%= evento.getTipoEvento() %>">
                                        <div class="rounded-2 text-center mb-3">
                                            <a href="<%=request.getContextPath()%>/ServletCoordinadora?action=viewEvento&id=<%= evento.getIdEventos() %>">
                                                <% if (evento.getIdEventos() > 12) { %>
                                                <img style="height: 200px; width: 390px; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/ServletCoordinadora?action=servirImagenEvento&id=<%= evento.getIdEventos() %>" alt="Foto del reporte">
                                                <% } else {%>
                                                <img style="height: 200px; width: 390px; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento<%= evento.getIdEventos() %>.jpg" alt="Imagen del evento">
                                                <% }%>
                                            </a>
                                        </div>
                                        <div class="card-body p-3 pt-2 d-flex flex-column">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <% if (evento.getTipoEvento().getNameTipo().equals("Deporte")) { %>
                                                <span class="badge bg-label-hover-success">Deporte</span>
                                                <% } %>
                                                <% if (evento.getTipoEvento().getNameTipo().equals("Cultura")) { %>
                                                <span class="badge bg-label-warning">Cultura</span>
                                                <% } %>
                                            </div>
                                            <a href="<%=request.getContextPath()%>/ServletCoordinadora?action=viewEvento&id=<%= evento.getIdEventos() %>" class="h5 fw-bold" style="color:black"><%= evento.getNombreEvento() %></a>
                                            <p class="mt-2" style="color:rgb(55,55,55)"><%= evento.getDescriptionEvento() %></p>

                                            <!-- Div que debe estar al final del card-body -->
                                            <div class="mt-auto d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">
                                                <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center" href="<%=request.getContextPath()%>/ServletCoordinadora?action=viewEvento&id=<%= evento.getIdEventos() %>">
                                                    <span class="me-2">Inscríbete aquí</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <% i++; %>
                                <% } %>
                            </div>
                            <div class="form d-flex justify-content-center mb-3" style="margin-top: 50px;">
                                <a href="<%=request.getContextPath()%>/ServletCoordinadora?action=listarEventos"
                                   class="btn btn-primary w-auto">Descubre más eventos</a>
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
                        , made by <a target="_blank"
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
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

<!-- endbuild -->

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/swiper/swiper.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/ui-carousel.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/ui-carousel.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:36 GMT -->
</html>

<!-- beautify ignore:end -->






