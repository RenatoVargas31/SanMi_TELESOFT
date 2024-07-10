<%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 11/06/2024
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
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


<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/pages-faq.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:02 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi : Ayuda</title>


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


    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css"/>

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

    <style>
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>

</head>

<body>


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


                    <div class="faq-header d-flex flex-column justify-content-center align-items-center h-px-300 position-relative">
                        <img src="${pageContext.request.contextPath}/assets/img/pages/header.png" class="scaleX-n1-rtl faq-banner-img"
                             alt="background image"/>
                        <h1 class="text-center, text-muted fw-black"> Hola ¿Cómo podemos ayudarte? </h1>

                        <p class="text-center mb-0 px-3, text-muted fw-black">Aqui te mostramos las preguntas frecuentes
                            acerca del rol de Coodinadora</p>
                    </div>

                    <div class="row mt-4">
                        <!-- Navigation -->
                        <div class="col-lg-3 col-md-4 col-12 mb-md-0 mb-3">
                            <div class="d-flex justify-content-between flex-column mb-2 mb-md-0">
                                <ul class="nav nav-align-left nav-pills flex-column">

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#product">
                                            <i class='bx bx-cog faq-nav-icon me-1'></i>
                                            <span class="align-middle">Preguntas frecuentes</span>
                                        </button>
                                    </li>
                                </ul>
                                <div class="d-none d-md-block">
                                    <div class="mt-5">
                                        <img src="${pageContext.request.contextPath}/assets/img/illustrations/sitting-girl-with-laptop-light.png"
                                             class="img-fluid w-px-200" alt="FAQ Image"
                                             data-app-light-img="illustrations/sitting-girl-with-laptop-light.png"
                                             data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.html">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Navigation -->

                        <!-- FAQ's -->
                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="tab-content py-0">
                                <div class="tab-pane fade show active" id="payment" role="tabpanel">
                                    <div class="d-flex mb-3 gap-3">
                                        <div>
            <span class="badge bg-label-primary rounded-2">
              <i class="bx bx-box bx-md"></i>
            </span>
                                        </div>
                                        <div>
                                            <h2 class="mb-0">
                                                <span class="align-middle">Preguntas acerca del funcionamiento y rol de Coordinadora</span>
                                            </h2>
                                            <span>Selecciona la pregunta que desea averiguar</span>
                                        </div>
                                    </div>
                                    <div id="accordionPayment" class="accordion">
                                        <div class="card accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                        aria-expanded="true" data-bs-target="#accordionPayment-1"
                                                        aria-controls="accordionPayment-1">
                                                    ¿Cómo funciona el rol de Coordinadora en la página?
                                                </button>
                                            </h2>

                                            <div id="accordionPayment-1" class="accordion-collapse collapse">
                                                <div class="accordion-body">
                                                    El rol de Coordinadora en nuestra página es fundamental para garantizar
                                                    la seguridad y el bienestar de los residentes y visitantes de San
                                                    Miguel. Aquí explicamos cómo funciona su función en la página:
                                                </div>

                                            </div>
                                            <div class="card accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#accordionPayment-2"
                                                            aria-controls="accordionPayment-2">
                                                        ¿Cómo puedo convertirme en coordinadora?
                                                    </button>
                                                </h2>
                                                <div id="accordionPayment-2" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        Para convertirte en coordinadora, debes enviar una solicitud al administrador. Una vez contratada por la municipalidad de San Miguel, el administrador cambiará tu rol y te enviará una contraseña a través de un correo distinto al de un vecino sanmiguelino.
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="card accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#accordionPayment-3"
                                                            aria-controls="accordionPayment-3">
                                                        Qué diferencia hay entre el rol de un vecino sanmiguelino y el de una coordinadora en cuanto a eventos?
                                                    </button>
                                                </h2>
                                                <div id="accordionPayment-3" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        Aunque las coordinadoras tienen un flujo similar al de un vecino sanmiguelino, tienen la capacidad de crear, gestionar y modificar eventos en la municipalidad, así como realizar tareas específicas como registrar la asistencia y subir fotos de los eventos.
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#accordionPayment-5"
                                                            aria-controls="accordionPayment-5">
                                                        ¿Qué información debo proporcionar al crear un evento como coordinadora?
                                                    </button>
                                                </h2>
                                                <div id="accordionPayment-5" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        Al crear un evento, debes incluir detalles como el nombre del evento, foto inicial, vacantes disponibles, lugar, fecha, hora, si es repetitivo o no, profesor, materiales necesarios y una descripción del evento.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /FAQ's -->
                        </div>

                        <!-- Contact -->
                        <div class="row mt-5">
                            <div class="col-12 text-center mb-4">
                                <div class="badge bg-label-primary">¿Preguntas?</div>
                                <h4 class="my-2">¿Sigues teniendo dudas?</h4>
                                <p>Si sigues teniendo dudas respecto al rol o funcionamiento, contáctanos al siguiente
                                    número. ¡Responderemos lo antes!</p>
                            </div>
                        </div>
                        <div class="row text-center justify-content-center gap-sm-0 gap-3">
                            <div class="col-sm-6">
                                <div class=" py-3 rounded bg-faq-section text-center">
      <span class="badge bg-label-primary rounded-2 my-3">
        <i class="bx bx-phone bx-sm"></i>
      </span>
                                    <h4 class="mb-2"><a class="h4" href="tel:(01) 5115110">(01) 5115110</a></h4>
                                    <p>¡Siempre listos para ayudar!</p>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class=" py-3 rounded bg-faq-section text-center">
      <span class="badge bg-label-primary rounded-2 my-3">
        <i class="bx bx-envelope bx-sm"></i>
      </span>
                                    <h4 class="mb-2"><a class="h4" href="mailto:alcaldia@munisanmiguel.gob.pe">alcaldia@munisanmiguel.gob.pe</a>
                                    </h4>
                                    <p>La mejor forma para obtener respuestas rápidas</p>
                                </div>
                            </div>
                        </div>
                        <!-- /Contact -->

                    </div>
                    <!-- / Content -->


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


    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


    <!-- Page JS -->

</div>
</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/pages-faq.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:03 GMT -->
</html>

<!-- beautify ignore:end -->

