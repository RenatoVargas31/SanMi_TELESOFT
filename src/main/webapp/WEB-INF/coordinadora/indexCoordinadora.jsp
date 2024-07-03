<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.sanmi_telesoft.beans.Profesor" %><%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 11/06/2024
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" type="com.example.sanmi_telesoft.beans.Usuario" scope="session" class="com.example.sanmi_telesoft.beans.Usuario"/>

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





                    <div class="row h-auto"><!-- Gallery effect-->
                        <div class="col-12">

                            <div id="swiper-gallery">
                                <div class="swiper gallery-top">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide"
                                             style="background-image:url(${pageContext.request.contextPath}/assets/img/backgrounds/ga1.jpg)">
                                        </div>
                                        <div class="swiper-slide"
                                             style="background-image:url(${pageContext.request.contextPath}/assets/img/backgrounds/ga2.png)">
                                        </div>
                                        <div class="swiper-slide"
                                             style="background-image:url(${pageContext.request.contextPath}/assets/img/backgrounds/ga3.jpg)">
                                        </div>
                                        <div class="swiper-slide"
                                             style="background-image:url(${pageContext.request.contextPath}/assets/img/backgrounds/ga5.jpg)">
                                        </div>
                                    </div>
                                    <!-- Add Arrows -->
                                    <div class="swiper-button-next swiper-button-white"></div>
                                    <div class="swiper-button-prev swiper-button-white"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

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

                <div class="row mt-4">
                        <!-- Navigation -->
                        <div class="col-lg-4 col-md-4 col-12 mb-md-0 mb-3">
                            <div class="d-flex justify-content-between flex-column mb-2 mb-md-0">
                                <ul class="nav nav-align-left nav-pills flex-column">
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <div class="bg-label-primary rounded-3 text-center mb-3 pt-4">
                                                <img class="img-fluid w-60" src="${pageContext.request.contextPath}/assets/img/events/evento1.jpg"
                                                     alt="Card girl image"/>
                                            </div>
                                            <h4 class="mb-2 pb-1">Evento Reciente</h4>
                                            <p class="small">El próximo festival de música en nuestra ciudad.</p>
                                            <div class="row mb-3 g-3">
                                                <div class="col-6">
                                                    <div class="d-flex">
                                                        <div class="avatar flex-shrink-0 me-2">
                                                            <span class="avatar-initial rounded bg-label-primary"><i
                                                                    class="bx bx-calendar-exclamation bx-sm"></i></span>
                                                        </div>
                                                        <div>
                                                            <h6 class="mb-0 text-nowrap">17 Nov 23</h6>
                                                            <small>Fecha</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="d-flex">
                                                        <div class="avatar flex-shrink-0 me-2">
                                                            <span class="avatar-initial rounded bg-label-primary"><i
                                                                    class="bx bx-time-five bx-sm"></i></span>
                                                        </div>
                                                        <div>
                                                            <h6 class="mb-0 text-nowrap">32 minutos</h6>
                                                            <small>Duración</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 text-center">
                                                <a href="details.html" class="btn btn-primary w-100 d-grid">Entrar al Evento</a>
                                            </div>
                                        </div>
                                    </div>


                                </ul>

                            </div>
                        </div>
                        <!-- /Navigation -->

                        <!-- FAQ's -->
                        <div class="col-lg-8 col-md-8 col-12">
                            <div class="tab-content py-0">
                                <div class="tab-pane fade show active" id="payment" role="tabpanel">
                                    <div class="d-flex mb-3 gap-3">
                                        <div>
                                            <br>
                                            <span class="badge bg-label-primary rounded-2">

            </span>
                                        </div>
                                        <div>
                                            <h4 class="mb-0">
                                                <br>

                                            </h4>

                                        </div>
                                    </div>
                                    <div id="accordionPayment" class="accordion">
                                        <div class="card accordion-item active">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                        aria-expanded="true" data-bs-target="#accordionPayment-1"
                                                        aria-controls="accordionPayment-1">
                                                    información
                                                </button>
                                            </h2>

                                            <div id="accordionPayment-1" class="accordion-collapse collapse show">
                                                <div class="accordion-body">
                                                    ¡Ey, bienvenido! Como coordinador de deportes tendrás la posibilidad
                                                    de crear,
                                                    administrar y editar eventos relacionados a deportes. El principal
                                                    objetivo es promover el bienestar físico, la participación activa y
                                                    el espíritu deportivo entre nuestra comunidad sanmiguelina. Además
                                                    buscamos fomentar la competencia saludable y el trabajo en equipo,
                                                    brindando oportunidades para que todos los miembros encuentren una
                                                    actividad deportiva que se adapte a sus interese y habilidades.
                                                    !Estamos emocionados por verte contribuir en esta gran comunidad!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="tab-pane fade" id="product" role="tabpanel">
                                <div class="d-flex mb-3 gap-3">
                                    <div>
            <span class="badge bg-label-primary rounded-2">
              <i class="bx bx-camera bx-md"></i>
            </span>
                                    </div>
                                    <div>
                                        <h4 class="mb-0">
                                            <span class="align-middle">Product & Services</span>
                                        </h4>
                                        <span>Get help with product & services</span>
                                    </div>
                                </div>
                                <div id="accordionProduct" class="accordion">
                                    <div class="card accordion-item active">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    aria-expanded="true" data-bs-target="#accordionProduct-1"
                                                    aria-controls="accordionProduct-1">
                                                Will I be notified once my order has shipped?
                                            </button>
                                        </h2>

                                        <div id="accordionProduct-1" class="accordion-collapse collapse show">
                                            <div class="accordion-body">
                                                Yes, We will send you an email once your order has been shipped.
                                                This email will contain tracking and order information.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#accordionProduct-2"
                                                    aria-controls="accordionProduct-2">
                                                Where can I find warranty information?
                                            </button>
                                        </h2>
                                        <div id="accordionProduct-2" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                We are committed to quality products. For information on
                                                warranty period and warranty services, visit our Warranty
                                                section <a href="javascript:void(0);">here</a>.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#accordionProduct-3"
                                                    aria-controls="accordionProduct-3">
                                                How can I purchase additional warranty coverage?
                                            </button>
                                        </h2>
                                        <div id="accordionProduct-3" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                For the peace of your mind, we offer extended warranty plans
                                                that add additional year(s) of protection to the standard
                                                manufacturer’s warranty provided by us. To purchase or find out
                                                more about the extended warranty program, visit Extended
                                                Warranty section <a href="javascript:void(0);">here</a>.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /FAQ's -->
            </div>


            <!-- Footer -->
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






