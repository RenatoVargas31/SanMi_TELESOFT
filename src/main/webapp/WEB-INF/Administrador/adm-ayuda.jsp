<%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 12/06/2024
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/pages-faq.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:02 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi | Ayuda</title>


    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">

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
                            acerca del rol de Administrador</p>
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
                                                <span class="align-middle">Preguntas acerca del funcionamiento y rol de Administrador</span>
                                            </h2>
                                            <span>Selecciona la pregunta que desea averiguar</span>
                                        </div>
                                    </div>
                                    <div id="accordionPayment" class="accordion">
                                        <div class="card accordion-item active">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                        aria-expanded="true" data-bs-target="#accordionPayment-1"
                                                        aria-controls="accordionPayment-1">
                                                    ¿Cómo funciona el rol de Administrador en la página?
                                                </button>
                                            </h2>

                                            <div id="accordionPayment-1" class="accordion-collapse collapse show">
                                                <div class="accordion-body">
                                                    El rol de Administrador en nuestra página es fundamental para garantizar
                                                    la seguridad y el bienestar de los residentes y visitantes de San
                                                    Miguel. Aquí explicamos cómo funciona su función en la página:
                                                </div>
                                                <div class="accordion-body">
                                                    Reporte de incidencias: Una de las funciones principales del
                                                    Administrador en la página es facilitar el reporte de incidencias por
                                                    parte de los usuarios. Proporcionamos un formulario en línea donde
                                                    los usuarios pueden informar sobre cualquier situación de
                                                    emergencia, delito o problema de seguridad que requiera atención.
                                                </div>
                                                <div class="accordion-body">
                                                    Actualización de incidencias: Una vez que se ha recibido un reporte
                                                    de incidencia, el equipo de Administrador se encarga de actualizar el
                                                    estado de la misma en nuestra página. Esto incluye clasificar la
                                                    incidencia según su gravedad y prioridad, así como proporcionar
                                                    información actualizada sobre el progreso de la respuesta.
                                                </div>
                                                <div class="accordion-body">
                                                    Comunicación con la comunidad: El Administrador utiliza la página como
                                                    plataforma para comunicarse con la comunidad de San Miguel.
                                                    Proporcionamos información relevante sobre medidas de seguridad,
                                                    consejos de prevención del delito y cualquier otra información
                                                    importante para mantener a los usuarios informados y seguros.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#accordionPayment-2"
                                                        aria-controls="accordionPayment-2">
                                                    ¿Qué hacer con los usuarios que hacen falsas alarmas reiteradas
                                                    veces?
                                                </button>
                                            </h2>
                                            <div id="accordionPayment-2" class="accordion-collapse collapse">
                                                <div class="accordion-body">
                                                    Para abordar el problema de los usuarios que hacen falsas alarmas
                                                    reiteradas veces, implementamos las siguientes medidas:
                                                </div>
                                                <div class="accordion-body">
                                                    Aviso y advertencia: En primer lugar, cuando un usuario realiza una
                                                    falsa alarma, se le notifica sobre la gravedad de su acción y se le
                                                    advierte sobre las consecuencias de realizar reportes falsos de
                                                    manera reiterada.
                                                </div>
                                                <div class="accordion-body">
                                                    Registro y seguimiento: Mantenemos un registro de todas las alarmas
                                                    reportadas por cada usuario. Si un usuario ha realizado más de 5
                                                    falsas alarmas, esto queda registrado en su historial.
                                                </div>
                                                <div class="accordion-body">
                                                    Baneo temporal: En caso de que un usuario continúe haciendo falsas
                                                    alarmas después de recibir advertencias, se le aplica un baneo
                                                    temporal. Durante este período, el usuario no podrá acceder a la
                                                    plataforma de reporte de incidencias.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#accordionPayment-3"
                                                        aria-controls="accordionPayment-3">
                                                    ¿Cómo atender correctamente las incidencias?
                                                </button>
                                            </h2>
                                            <div id="accordionPayment-3" class="accordion-collapse collapse">
                                                <div class="accordion-body">
                                                    Evaluar la situación: Antes de actuar, es crucial evaluar la
                                                    gravedad y urgencia de la incidencia. Determina si se trata de una
                                                    emergencia que requiere atención inmediata o si puede ser manejada
                                                    de manera diferida.
                                                </div>
                                                <div class="accordion-body">
                                                    Clasificar la incidencia: Utiliza nuestra herramienta de
                                                    actualización de incidencias en la página web para clasificarla
                                                    según su prioridad. Puedes seleccionar entre las siguientes
                                                    opciones: urgente, medio, bajo o falsa alarma. Esta clasificación
                                                    nos ayudará a priorizar la respuesta y asignar los recursos de
                                                    manera adecuada.
                                                </div>
                                                <div class="accordion-body">
                                                    Comunicar la incidencia: Una vez que hayas clasificado la
                                                    incidencia, comunica la situación de manera clara y precisa a las
                                                    autoridades correspondientes, ya sea a través de una llamada
                                                    telefónica al Administrador, a los bomberos o a una ambulancia, según
                                                    sea necesario. Proporciona toda la información relevante, como la
                                                    ubicación exacta y una descripción detallada de lo que está
                                                    ocurriendo.
                                                </div>
                                                <div class="accordion-body">
                                                    Cooperar con las autoridades: Colabora con las autoridades y sigue
                                                    sus instrucciones. Proporciona cualquier información adicional que
                                                    te sea solicitada y coopera en todo momento para facilitar la
                                                    resolución de la incidencia de manera segura y eficiente.
                                                </div>
                                                <div class="accordion-body">
                                                    Seguir el progreso: Una vez que se haya reportado la incidencia,
                                                    puedes seguir su progreso a través de nuestra herramienta de
                                                    actualización de incidencias en la página web. Esto te permitirá
                                                    estar al tanto de cualquier desarrollo y saber cuándo se ha resuelto
                                                    la situación.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#accordionPayment-4"
                                                        aria-controls="accordionPayment-4">
                                                    ¿Cómo contactar con bomberos y ambulancia en caso la incidencia lo
                                                    requiera?
                                                </button>
                                            </h2>
                                            <div id="accordionPayment-4" class="accordion-collapse collapse">
                                                <div class="accordion-body">
                                                    Si necesitas contactar con los bomberos o una ambulancia en caso de
                                                    una incidencia que lo requiera, hay varias opciones disponibles:
                                                </div>
                                                <div class="accordion-body">
                                                    Llamada telefónica: Puedes contactar directamente con los bomberos
                                                    marcando el número (01) 4613029. Para solicitar una ambulancia,
                                                    llama al número 715-9700.
                                                </div>
                                                <div class="accordion-body">
                                                    Sitio web: También puedes acceder a nuestro sitio web, donde hemos
                                                    facilitado la opción de llamar directamente a los bomberos o a una
                                                    ambulancia con solo hacer clic en el botón correspondiente.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#accordionPayment-5"
                                                        aria-controls="accordionPayment-5">
                                                    ¿Qué objetivo tenemos como Administrador en San Miguel?
                                                </button>
                                            </h2>
                                            <div id="accordionPayment-5" class="accordion-collapse collapse">
                                                <div class="accordion-body">Como Administrador en San Miguel, nuestros
                                                    objetivos principales son garantizar la seguridad y el bienestar de
                                                    todos los residentes y visitantes del distrito.
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


</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/pages-faq.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:03 GMT -->
</html>
