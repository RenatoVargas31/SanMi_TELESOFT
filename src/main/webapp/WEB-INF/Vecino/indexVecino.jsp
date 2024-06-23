<%--
  Created by IntelliJ IDEA.
  User: Sergio
  Date: 20/06/2024
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-academy-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:13:40 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi : Bienvenido Vecino</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apex-charts.css"/>

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


            <!-- Navbar -->

            <jsp:include page="navBar.jsp"/>

            <!-- / Navbar -->


            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">


                    <!-- Hour chart  -->
                    <div class="card bg-transparent shadow-none border-0 my-4">
                        <div class="card-body row p-0 pb-3">
                            <div class="col-12 col-md-8 card-separator">
                                <h1 class="py-3 mb-4">
                                    <span class="text fw-black">¡Bienvenido Vecino! 👋 </span>
                                </h1>
                                <div class="col-12 col-lg-8">
                                    <p>Tu actividad es importante para mejorar el bienestar de todos los vecinos del
                                        distrito,
                                        tu participación en los eventos y tus reportes de incidencias nos permite
                                        trabajar juntos. </p>
                                </div>
                                <div class="d-flex justify-content-between flex-wrap gap-3 me-5">
                                    <div class="d-flex align-items-center gap-3 me-4 me-sm-0">
          <span class=" bg-label-primary p-2 rounded">
            <i class='bx bx-laptop bx-sm'></i>
          </span>
                                        <div class="content-right">
                                            <p class="mb-0">Eventos de la semana</p>
                                            <h4 class="text-primary mb-0">2</h4>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center gap-3">
          <span class="bg-label-info p-2 rounded">
            <i class='bx bx-bulb bx-sm'></i>
          </span>
                                        <div class="content-right">
                                            <p class="mb-0">Eventos en curso</p>
                                            <h4 class="text-info mb-0">15</h4>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center gap-3">
          <span class="bg-label-warning p-2 rounded">
            <i class='bx bx-check-circle bx-sm'></i>
          </span>
                                        <div class="content-right">
                                            <p class="mb-0">Eventos inscritos </p>
                                            <h4 class="text-warning mb-0">5</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hour chart End  -->

                    <!-- Topic and Instructors -->
                    <div class="row mb-4 g-4">
                        <div class="col-12 col-xl-8">
                            <div class="card h-100">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <h5 class="card-title m-0 me-2">Eventos más populares</h5>
                                </div>
                                <div class="card-body row g-3">
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="app-academy-course-details.html"><img class="img-fluid"
                                                                                               src="${pageContext.request.contextPath}/assets/img/events/evento1.jpg"
                                                                                               alt="tutor image 1"></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-primary">Web</span>
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                        4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span
                                                            class="text-muted">(8)</span>
                                                    </h6>
                                                </div>
                                                <a href="app-academy-course-details.html" class="h5">Festival de música peruana</a>
                                                <p class="mt-2">Celebra la diversidad cultural de nuestro país</p>
                                                <div class="row mb-3 g-3">
                                                    <div class="col-6">
                                                        <div class="d-flex">
                                                            <div class="avatar flex-shrink-0 me-2">
                                                                <span class="avatar-initial rounded bg-label-primary"><i
                                                                        class="bx bx-calendar-exclamation bx-sm"></i></span>
                                                            </div>
                                                            <div>
                                                                <h6 class="mb-0 text-nowrap">10 mayo</h6>
                                                                <small>Fecha</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="app-academy-course-details.html" class="btn btn-primary w-100">Entrar al evento</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="app-academy-course-details.html"><img class="img-fluid"
                                                                                               src="${pageContext.request.contextPath}/assets/img/events/evento2.jpg"
                                                                                               alt="tutor image 1"></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-primary">Web</span>
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                        4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span
                                                            class="text-muted">(12)</span>
                                                    </h6>
                                                </div>
                                                <a href="app-academy-course-details2.html" class="h5">Olimpiadas Escolares</a>
                                                <p class="mt-2">Venga a disfrutar los eventos deportivos con los niños de nuestro distrito</p>
                                                <div class="row mb-3 g-3">
                                                    <div class="col-6">
                                                        <div class="d-flex">
                                                            <div class="avatar flex-shrink-0 me-2">
                                                                <span class="avatar-initial rounded bg-label-primary"><i
                                                                        class="bx bx-calendar-exclamation bx-sm"></i></span>
                                                            </div>
                                                            <div>
                                                                <h6 class="mb-0 text-nowrap">11 mayo</h6>
                                                                <small>Fecha</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="app-academy-course-details2.html" class="btn btn-primary w-100">Entrar al evento</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="app-academy-course-details.html"><img class="img-fluid"
                                                                                               src="${pageContext.request.contextPath}/assets/img/events/evento3.jpg"
                                                                                               alt="tutor image 1"></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-primary">Web</span>
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                        4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span
                                                            class="text-muted">(14)</span>
                                                    </h6>
                                                </div>
                                                <a href="app-academy-course-details3.html" class="h5">Teatro en San Miguel</a>
                                                <p class="mt-2">Obtenga un espacio para apreciar el entretenimiento sano</p>
                                                <div class="row mb-3 g-3">
                                                    <div class="col-6">
                                                        <div class="d-flex">
                                                            <div class="avatar flex-shrink-0 me-2">
                                                                <span class="avatar-initial rounded bg-label-primary"><i
                                                                        class="bx bx-calendar-exclamation bx-sm"></i></span>
                                                            </div>
                                                            <div>
                                                                <h6 class="mb-0 text-nowrap">10 Julio</h6>
                                                                <small>Fecha</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="app-academy-course-details3.html" class="btn btn-primary w-100">Entrar al evento</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>








                    </div>
                    <!--  Topic and Instructors  End-->

                    <!-- Course datatable -->

                    <!-- Course datatable End -->


                </div>
                <!-- / Content -->


                <!-- Footer -->
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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-academy-dashboard.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-academy-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:13:45 GMT -->
</html>
