<%--
  Created by IntelliJ IDEA.
  User: Sergio
  Date: 15/06/2024
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:08 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>Dispatcher | Incidencias</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css"/>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />


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
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar  ">
    <div class="layout-container">


        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">


            <div class="app-brand demo ">
                <a href="serenazgo.html" class="app-brand-link">
                    <img class="img-fluid" width="33" src="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp"
                         alt="logo-sanmiguel">
                    <span class="app-brand-text demo menu-text fw-bold ms-4">SanMI</span>
                </a>
                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>


            <ul class="menu-inner py-1">

                <!-- Layouts -->

                <!-- Front Pages -->

                <!-- Apps & Pages -->
                <!--<li class="menu-header small text-uppercase">
                  <span class="menu-header-text" data-i18n="Inicio">Inicio</span>
                </li>-->




                <!-- e-commerce-app menu start -->
                <!-- e-commerce-app menu end -->
                <!-- Academy menu start -->
                <li class="menu-item">
                    <a href="serenazgo-dashboard.html" class="menu-link menu">
                        <i class="menu-icon tf-icons bx bx-home-alt"></i>
                        <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                    </a>
                </li>
                <!-- Academy menu end -->
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text" data-i18n="Incidencias">Incidencias</span>
                </li>

                <li class="menu-item active open">
                    <a href="javascript:void(0);" class="menu-link menu-toggle">
                        <i class="menu-icon tf-icons bx bx-bell"></i>
                        <div class="text-truncate" data-i18n="Incidencias">Incidencias</div>
                    </a>
                    <ul class="menu-sub">
                        <li class="menu-item active open">
                            <a href="serenazgo-incidencias.html" class="menu-link">
                                <div class="text-truncate" data-i18n="Reporte de Incidencias">Reporte de Incidencias</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="serenazgo-incidenciasfalsas.html" class="menu-link">
                                <div class="text-truncate" data-i18n="Incidencias Falsas">Incidencias Falsas</div>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- Components -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text"
                                                                   data-i18n="Ayuda">Ayuda</span></li>
                <!-- Cards -->
                <li class="menu-item">
                    <a href="serenazgo-ayuda.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-help-circle"></i>
                        <div class="text-truncate" data-i18n="Ayuda">Ayuda</div>
                    </a>
                </li>

                <!-- Extended components -->

                <!-- Icons -->

                <!-- Forms & Tables -->

                <!-- Forms -->

                <!-- Tables -->


                <!-- Misc -->
            </ul>


        </aside>
        <!-- / Menu -->
        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

            <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                 id="layout-navbar">

                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>


                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="150px" height="70px"
                         viewBox="50 -15 100 100" preserveAspectRatio="xMidYMid meet">
                        <g transform="translate(0.000000,70.000000) scale(0.100000,-0.100000)" fill="#287233"
                           stroke="none">
                            <path d="M2460 681 c0 -42 -54 -202 -100 -297 -53 -110 -134 -225 -226 -322 -33 -34 -54 -62 -48 -62 23 0 44 12 44 25 0 8 9 17 20 20 11 3 20 12 20 18 1 17 48 49 61 41 7 -4 9 0 5 12 -4 13 6 36 28 66 26 38 35 45 46 35 10 -10 12 -8 7 10 -3 16 0 24 14 28 11 4 17 11 13 16 -3 5 -11 7 -17 3 -7 -3 -1 4 12 15 13 12 19 21 15 21 -5 0 -1 5 8 11 11 6 15 16 11 26 -5 12 -3 14 7 8 8 -5 11 -4 6 3 -3 6 0 16 7 24 8 7 12 19 9 26 -2 6 4 15 13 18 13 5 14 8 3 15 -9 6 -6 9 12 9 19 0 21 3 11 9 -11 7 -12 15 -3 38 6 15 14 43 17 61 6 27 11 32 36 32 18 0 28 -4 24 -10 -3 -5 -1 -10 4 -10 6 0 11 7 11 15 0 10 -10 15 -30 15 -33 0 -37 12 -21 68 8 25 7 32 -5 32 -8 0 -14 -8 -14 -19z"/>
                            <path d="M2568 693 c7 -3 16 -2 19 1 4 3 -2 6 -13 5 -11 0 -14 -3 -6 -6z"/>
                            <path d="M2815 691 c-2 -3 5 -17 16 -30 l19 -23 0 29 c0 20 -5 30 -15 30 -9 0 -18 -3 -20 -6z"/>
                            <path d="M2908 675 c-3 -14 -1 -25 3 -25 5 0 9 11 9 25 0 14 -2 25 -4 25 -2 0 -6 -11 -8 -25z"/>
                            <path d="M2770 657 c0 -7 9 -13 20 -14 18 -2 18 0 6 13 -18 17 -26 18 -26 1z"/>
                            <path d="M2980 655 c0 -8 4 -15 10 -15 5 0 7 7 4 15 -4 8 -8 15 -10 15 -2 0 -4 -7 -4 -15z"/>
                            <path d="M272 645 c-76 -23 -182 -123 -182 -170 0 -42 66 -97 156 -128 l40 -15 -24 49 c-34 68 -24 119 33 177 49 48 91 61 56 16 -32 -41 -36 -87 -12 -136 25 -53 65 -78 124 -78 35 0 53 6 74 26 l28 25 -34 -17 c-73 -35 -150 -13 -177 51 -19 47 -18 63 12 119 14 26 21 45 16 42 -6 -3 -12 -1 -14 5 -5 16 -68 -14 -98 -46 -30 -32 -51 -113 -40 -158 7 -35 7 -35 -20 -25 -16 5 -45 24 -66 42 -31 27 -36 36 -30 59 11 46 117 135 169 145 73 12 125 13 165 1 90 -24 179 -110 201 -194 13 -46 5 -170 -13 -203 l-17 -33 -39 35 c-21 19 -48 40 -60 46 l-22 12 31 30 c17 17 31 37 31 44 0 8 -18 -4 -39 -25 -22 -22 -50 -41 -62 -43 -17 -2 -7 -11 46 -38 44 -22 78 -47 92 -68 l22 -33 27 53 c36 71 43 156 18 234 -25 81 -115 172 -193 197 -63 20 -139 21 -199 2z"/>
                            <path d="M2631 643 c0 -13 2 -14 6 -4 5 11 7 11 14 0 7 -11 9 -10 9 4 0 9 -7 17 -15 17 -8 0 -15 -8 -14 -17z"/>
                            <path d="M2940 649 c0 -5 5 -7 10 -4 6 3 10 8 10 11 0 2 -4 4 -10 4 -5 0 -10 -5 -10 -11z"/>
                            <path d="M855 623 c-69 -17 -57 -89 18 -107 15 -3 27 -11 27 -16 0 -15 -21 -23 -33 -11 -16 16 -57 14 -57 -3 0 -32 59 -53 101 -36 58 24 44 91 -22 105 -29 7 -37 19 -20 30 5 3 12 1 16 -5 9 -15 55 -12 55 4 0 26 -47 48 -85 39z"/>
                            <path d="M2860 618 c0 -7 5 -20 10 -28 8 -12 10 -11 10 7 0 12 -4 25 -10 28 -5 3 -10 0 -10 -7z"/>
                            <path d="M2730 606 c0 -9 5 -16 10 -16 6 0 10 4 10 9 0 6 -4 13 -10 16 -5 3 -10 -1 -10 -9z"/>
                            <path d="M2900 600 c0 -11 5 -20 11 -20 6 0 9 6 6 14 -3 8 -1 17 6 20 7 2 4 5 -5 5 -12 1 -18 -6 -18 -19z"/>
                            <path d="M2980 600 c0 -5 5 -10 10 -10 6 0 10 5 10 10 0 6 -4 10 -10 10 -5 0 -10 -4 -10 -10z"/>
                            <path d="M2583 585 c0 -8 4 -15 9 -15 4 0 8 7 8 15 0 8 -4 15 -8 15 -5 0 -9 -7 -9 -15z"/>
                            <path d="M2630 585 c0 -8 7 -15 15 -15 8 0 15 4 15 9 0 5 -7 11 -15 15 -9 3 -15 0 -15 -9z"/>
                            <path d="M2693 585 c-8 -9 -9 -16 -3 -20 6 -3 10 -2 10 4 0 6 8 8 18 5 10 -4 13 -2 7 3 -5 4 -12 11 -15 15 -3 3 -11 0 -17 -7z"/>
                            <path d="M1010 581 c-47 -12 -62 -90 -24 -122 8 -7 29 -11 47 -11 82 2 75 -4 79 67 l3 64 -31 -1 c-17 -1 -35 1 -40 4 -5 3 -20 2 -34 -1z m54 -54 c14 -21 -13 -51 -37 -41 -20 7 -22 35 -5 52 15 15 28 11 42 -11z"/>
                            <path d="M1216 583 c-3 -4 -22 -6 -41 -5 l-35 1 0 -64 c0 -62 1 -65 24 -65 23 0 25 5 28 48 2 34 7 47 18 47 11 0 16 -13 18 -47 3 -42 6 -48 25 -48 21 0 22 3 17 61 -4 52 -9 63 -27 70 -11 4 -24 5 -27 2z"/>
                            <path d="M2762 566 c7 -8 15 -12 17 -11 5 6 -10 25 -20 25 -5 0 -4 -6 3 -14z"/>
                            <path d="M2807 563 c-4 -3 -7 -11 -7 -17 0 -6 5 -5 12 2 6 6 9 14 7 17 -3 3 -9 2 -12 -2z"/>
                            <path d="M2620 556 c0 -2 9 -6 20 -9 11 -3 20 -1 20 4 0 5 -9 9 -20 9 -11 0 -20 -2 -20 -4z"/>
                            <path d="M2558 543 c6 -2 18 -2 25 0 6 3 1 5 -13 5 -14 0 -19 -2 -12 -5z"/>
                            <path d="M2655 489 c-10 -15 3 -25 16 -12 7 7 7 13 1 17 -6 3 -14 1 -17 -5z"/>
                            <path d="M67 429 c-12 -43 -7 -134 8 -180 9 -25 29 -62 46 -82 35 -43 41 -43 183 -1 122 37 198 30 259 -24 13 -12 20 -13 29 -4 9 9 6 18 -13 38 -36 39 -84 59 -198 83 -167 36 -263 89 -296 165 -12 28 -12 28 -18 5z m35 -67 c2 -5 26 -24 53 -43 50 -35 110 -57 215 -80 61 -14 62 -13 -60 -50 -99 -29 -153 -35 -167 -18 -6 8 -21 32 -33 53 -24 44 -40 146 -22 146 6 0 12 -4 14 -8z"/>
                            <path d="M1040 400 c0 -15 7 -20 25 -20 18 0 25 5 25 20 0 15 -7 20 -25 20 -18 0 -25 -5 -25 -20z"/>
                            <path d="M2664 404 c-18 -14 -18 -14 6 -3 31 14 36 19 24 19 -6 0 -19 -7 -30 -16z"/>
                            <path d="M2710 416 c0 -2 7 -6 15 -10 8 -3 15 -1 15 4 0 6 -7 10 -15 10 -8 0 -15 -2 -15 -4z"/>
                            <path d="M2796 411 c-3 -5 1 -11 9 -14 9 -4 12 -1 8 9 -6 16 -10 17 -17 5z"/>
                            <path d="M1600 320 c0 -89 0 -90 25 -90 25 0 25 1 25 90 0 89 0 90 -25 90 -25 0 -25 -1 -25 -90z"/>
                            <path d="M2462 390 c0 -14 2 -19 5 -12 2 6 2 18 0 25 -3 6 -5 1 -5 -13z"/>
                            <path d="M2841 394 c0 -11 3 -14 6 -6 3 7 2 16 -1 19 -3 4 -6 -2 -5 -13z"/>
                            <path d="M806 338 c-4 -35 -10 -73 -13 -85 -4 -19 -1 -23 21 -23 23 0 26 5 32 52 l7 51 21 -51 c12 -29 26 -52 31 -52 6 0 20 24 32 53 l21 52 7 -52 c7 -48 10 -53 32 -53 23 0 25 3 19 33 -3 17 -8 56 -12 85 -6 48 -8 52 -34 52 -23 0 -30 -7 -45 -47 l-19 -48 -19 48 c-17 40 -24 47 -47 47 -26 0 -28 -3 -34 -62z m55 15 c7 -10 9 -15 5 -11 -5 4 -15 3 -23 -3 -10 -9 -13 -7 -13 10 0 26 13 27 31 4z m119 -2 c0 -14 -5 -18 -20 -14 -16 4 -18 8 -9 19 16 20 29 17 29 -5z"/>
                            <path d="M2940 380 c8 -5 26 -10 39 -10 32 0 24 6 -19 14 -25 4 -31 3 -20 -4z"/>
                            <path d="M1133 350 c-23 -20 -30 -64 -15 -86 13 -20 52 -35 72 -29 11 4 20 2 20 -4 0 -19 -20 -22 -55 -10 -42 15 -55 6 -30 -21 22 -25 86 -27 109 -4 12 11 16 35 16 85 0 79 -1 85 -15 80 -12 -4 -23 -4 -55 4 -18 5 -32 0 -47 -15z m75 -48 c4 -28 -24 -40 -45 -19 -14 13 -14 19 -3 32 18 22 44 15 48 -13z"/>
                            <path d="M1303 362 c-20 -3 -23 -9 -23 -47 0 -69 48 -108 100 -82 21 11 26 21 30 69 5 53 4 57 -17 61 -21 4 -23 1 -23 -44 0 -42 -3 -49 -19 -49 -17 0 -20 8 -23 48 -3 42 -5 47 -25 44z"/>
                            <path d="M1463 355 c-68 -48 0 -159 75 -123 44 22 40 40 -8 36 -28 -2 -44 1 -47 10 -3 8 10 12 46 12 59 0 66 15 26 55 -27 28 -61 32 -92 10z m72 -35 c4 -6 -7 -10 -25 -10 -18 0 -29 4 -25 10 3 6 15 10 25 10 10 0 22 -4 25 -10z"/>
                            <path d="M1040 295 c0 -63 1 -65 25 -65 24 0 25 2 25 65 0 63 -1 65 -25 65 -24 0 -25 -2 -25 -65z"/>
                            <path d="M2607 353 c-4 -3 -7 -15 -7 -26 0 -11 -10 -29 -22 -40 l-23 -19 24 7 c22 7 23 5 19 -19 -3 -14 -1 -26 3 -26 5 0 9 27 9 59 0 54 2 60 23 64 20 4 20 4 1 6 -11 0 -24 -2 -27 -6z"/>
                            <path d="M2660 350 c0 -5 6 -10 14 -10 8 0 18 5 21 10 3 6 -3 10 -14 10 -12 0 -21 -4 -21 -10z"/>
                            <path d="M2770 350 l-45 -7 48 -1 c26 -1 47 3 47 8 0 6 -1 9 -2 8 -2 0 -23 -4 -48 -8z"/>
                            <path d="M2478 343 c7 -3 16 -2 19 1 4 3 -2 6 -13 5 -11 0 -14 -3 -6 -6z"/>
                            <path d="M2830 339 c0 -5 5 -7 10 -4 6 3 10 8 10 11 0 2 -4 4 -10 4 -5 0 -10 -5 -10 -11z"/>
                            <path d="M2860 340 c0 -5 5 -10 10 -10 6 0 10 5 10 10 0 6 -4 10 -10 10 -5 0 -10 -4 -10 -10z"/>
                            <path d="M2960 340 l-35 -7 38 -2 c20 0 37 4 37 9 0 6 -1 9 -2 9 -2 -1 -19 -5 -38 -9z"/>
                            <path d="M2707 333 c-10 -10 -8 -86 3 -103 7 -11 10 3 10 48 0 62 -1 67 -13 55z"/>
                            <path d="M2890 336 c0 -2 7 -7 16 -10 8 -3 12 -2 9 4 -6 10 -25 14 -25 6z"/>
                            <path d="M2631 316 c-9 -11 -5 -15 20 -20 36 -7 45 -3 34 14 -4 6 -14 9 -22 6 -8 -3 -11 -1 -8 4 9 15 -11 12 -24 -4z"/>
                            <path d="M2464 312 c3 -6 -1 -15 -10 -20 -11 -6 -13 -11 -5 -16 6 -4 16 -4 21 -1 14 8 13 32 -2 41 -6 4 -8 3 -4 -4z"/>
                            <path d="M2745 309 c-11 -17 1 -21 15 -4 8 9 8 15 2 15 -6 0 -14 -5 -17 -11z"/>
                            <path d="M2520 300 c0 -5 -7 -10 -15 -10 -8 0 -15 -4 -15 -10 0 -5 9 -10 20 -10 13 0 20 7 20 20 0 11 -2 20 -5 20 -3 0 -5 -4 -5 -10z"/>
                            <path d="M2827 298 c6 -7 13 -20 16 -28 3 -9 6 -3 6 13 1 19 -4 27 -15 27 -12 0 -14 -4 -7 -12z"/>
                            <path d="M2860 293 c0 -14 2 -15 9 -4 6 10 13 11 29 2 27 -14 29 -14 36 4 4 12 -3 15 -34 15 -32 0 -40 -4 -40 -17z"/>
                            <path d="M2968 285 c-3 -14 -1 -25 3 -25 5 0 9 9 9 19 0 11 6 22 13 24 7 4 6 6 -4 6 -10 1 -19 -9 -21 -24z"/>
                            <path d="M2393 255 c0 -11 4 -12 14 -4 7 6 13 13 13 15 0 2 -6 4 -13 4 -8 0 -14 -7 -14 -15z"/>
                            <path d="M2918 241 c-2 -16 1 -40 8 -53 10 -19 11 -16 7 27 -7 61 -9 65 -15 26z"/>
                            <path d="M2471 238 c1 -16 3 -18 6 -6 2 9 12 19 21 21 12 3 10 5 -5 6 -18 1 -23 -4 -22 -21z"/>
                            <path d="M2528 253 c6 -2 12 -21 13 -41 0 -28 2 -32 8 -18 11 29 1 66 -18 65 -10 0 -11 -2 -3 -6z"/>
                            <path d="M2836 235 c-3 -8 -1 -15 4 -15 6 0 10 7 10 15 0 8 -2 15 -4 15 -2 0 -6 -7 -10 -15z"/>
                            <path d="M2860 234 c0 -8 5 -12 10 -9 6 3 10 10 10 16 0 5 -4 9 -10 9 -5 0 -10 -7 -10 -16z"/>
                            <path d="M2345 230 c-7 -12 2 -30 16 -30 5 0 9 9 9 20 0 21 -15 27 -25 10z"/>
                            <path d="M2778 233 c7 -3 16 -2 19 1 4 3 -2 6 -13 5 -11 0 -14 -3 -6 -6z"/>
                            <path d="M2620 200 c0 -12 24 -12 60 0 21 7 19 8 -17 9 -24 1 -43 -3 -43 -9z"/>
                            <path d="M2584 185 c8 -8 20 -15 26 -15 7 0 6 6 -4 15 -8 8 -20 15 -26 15 -7 0 -6 -6 4 -15z"/>
                            <path d="M2952 190 c5 -26 38 -42 38 -18 0 6 -3 8 -7 5 -3 -4 -12 1 -20 11 -10 13 -13 14 -11 2z"/>
                            <path d="M345 146 c-33 -8 -73 -19 -88 -25 -16 -6 -40 -11 -55 -11 l-27 0 25 -20 c74 -56 213 -64 307 -17 28 15 54 30 57 35 8 13 -62 43 -113 47 -25 3 -73 -2 -106 -9z m159 -22 c9 -3 16 -10 16 -14 0 -9 -75 -37 -116 -43 -37 -6 -134 9 -147 22 -21 21 201 53 247 35z"/>
                            <path d="M2440 143 c0 -12 3 -14 8 -7 4 7 16 14 27 17 15 4 14 5 -7 6 -21 1 -28 -4 -28 -16z"/>
                            <path d="M2306 138 c3 -5 10 -6 15 -3 13 9 11 12 -6 12 -8 0 -12 -4 -9 -9z"/>
                            <path d="M673 129 c-14 -14 -6 -39 12 -39 8 0 17 -5 20 -10 4 -7 -3 -9 -22 -4 -27 6 -27 6 -10 -12 13 -14 21 -16 34 -8 26 16 27 35 4 41 -12 3 -21 10 -21 15 0 5 10 6 22 2 20 -6 21 -5 9 10 -16 19 -32 21 -48 5z"/>
                            <path d="M740 95 c0 -25 5 -45 10 -45 6 0 10 20 10 45 0 25 -4 45 -10 45 -5 0 -10 -20 -10 -45z"/>
                            <path d="M780 95 c0 -41 2 -45 25 -45 14 0 25 5 25 10 0 6 -7 10 -15 10 -21 0 -19 18 3 23 16 4 16 5 0 6 -22 1 -24 21 -3 21 8 0 15 5 15 10 0 6 -11 10 -25 10 -23 0 -25 -4 -25 -45z"/>
                            <path d="M850 111 c0 -16 -3 -36 -6 -45 -4 -11 -1 -16 10 -16 11 0 16 9 16 28 l1 27 13 -30 14 -30 13 30 13 30 4 -27 c2 -16 8 -28 14 -28 6 0 8 10 4 23 -3 12 -6 32 -6 45 0 30 -16 28 -33 -4 l-14 -27 -7 27 c-9 36 -36 34 -36 -3z"/>
                            <path d="M960 95 c0 -25 5 -45 10 -45 6 0 10 7 10 15 0 8 9 15 19 15 23 0 35 28 20 46 -6 8 -22 14 -35 14 -22 0 -24 -4 -24 -45z m41 12 c-1 -12 -15 -9 -19 4 -3 6 1 10 8 8 6 -3 11 -8 11 -12z"/>
                            <path d="M1040 95 c0 -25 5 -45 10 -45 6 0 10 8 10 18 1 16 1 16 14 0 7 -10 19 -18 26 -18 9 0 10 3 2 13 -6 7 -8 23 -5 36 6 25 -9 41 -39 41 -15 0 -18 -9 -18 -45z m40 16 c0 -6 -4 -13 -10 -16 -5 -3 -10 1 -10 9 0 9 5 16 10 16 6 0 10 -4 10 -9z"/>
                            <path d="M1120 95 c0 -41 2 -45 25 -45 14 0 25 5 25 10 0 6 -7 10 -15 10 -21 0 -19 18 3 23 16 4 16 5 0 6 -22 1 -24 21 -3 21 8 0 15 5 15 10 0 6 -11 10 -25 10 -23 0 -25 -4 -25 -45z"/>
                            <path d="M1216 118 c-13 -19 -14 -25 -2 -43 17 -25 49 -31 66 -10 16 20 5 32 -14 16 -17 -14 -36 -7 -36 14 0 21 19 28 36 14 19 -16 30 -4 14 16 -18 22 -46 19 -64 -7z"/>
                            <path d="M1312 128 c-27 -27 -7 -78 29 -78 21 0 49 26 49 45 0 35 -53 58 -78 33z m47 -22 c9 -10 8 -16 -4 -26 -19 -16 -41 1 -32 24 8 20 21 20 36 2z"/>
                            <path d="M1400 95 c0 -25 5 -45 10 -45 6 0 10 12 10 28 l1 27 17 -27 c24 -39 32 -35 32 17 0 45 -20 66 -21 23 l0 -23 -16 23 c-23 33 -33 27 -33 -23z"/>
                            <path d="M1480 130 c0 -5 7 -10 16 -10 13 0 15 -7 11 -35 -4 -26 -2 -35 9 -35 9 0 14 11 14 36 0 21 4 33 10 29 6 -3 10 1 10 9 0 12 -10 16 -35 16 -19 0 -35 -4 -35 -10z"/>
                            <path d="M1560 95 c0 -25 5 -45 10 -45 6 0 10 20 10 45 0 25 -4 45 -10 45 -5 0 -10 -20 -10 -45z"/>
                            <path d="M1610 126 c-28 -35 11 -93 48 -70 26 17 28 44 2 44 -16 0 -20 -4 -16 -16 4 -10 1 -14 -6 -12 -7 3 -13 13 -13 24 0 15 6 18 29 16 26 -3 28 -1 17 12 -17 20 -45 21 -61 2z"/>
                            <path d="M1706 124 c-30 -30 -13 -74 29 -74 44 0 63 60 26 80 -27 14 -37 13 -55 -6z m52 -27 c4 -20 -25 -34 -40 -19 -15 15 -1 44 19 40 10 -2 19 -11 21 -21z"/>
                            <path d="M2627 133 c-10 -10 -8 -23 4 -23 5 0 7 5 4 10 -3 6 -1 10 4 10 6 0 11 -5 11 -11 0 -5 5 -7 11 -3 8 4 7 9 -2 15 -17 11 -24 11 -32 2z"/>
                            <path d="M2925 130 c-16 -7 -17 -9 -3 -9 9 -1 20 4 23 9 7 11 7 11 -20 0z"/>
                            <path d="M2683 124 c7 -8 97 -7 105 1 3 3 -21 5 -53 5 -32 0 -56 -3 -52 -6z"/>
                            <path d="M2846 122 c-3 -5 8 -6 25 -4 16 2 29 6 29 8 0 8 -49 4 -54 -4z"/>
                            <path d="M2268 103 c7 -3 16 -2 19 1 4 3 -2 6 -13 5 -11 0 -14 -3 -6 -6z"/>
                            <path d="M2675 100 c3 -5 8 -10 11 -10 2 0 4 5 4 10 0 6 -5 10 -11 10 -5 0 -7 -4 -4 -10z"/>
                            <path d="M2965 100 c3 -5 8 -10 11 -10 2 0 4 5 4 10 0 6 -5 10 -11 10 -5 0 -7 -4 -4 -10z"/>
                            <path d="M2350 81 c-6 -12 -16 -21 -23 -20 -7 1 -21 1 -32 -1 -20 -1 -20 -1 0 -9 23 -10 61 5 70 27 9 24 -2 26 -15 3z"/>
                            <path d="M2745 90 c-4 -6 -2 -10 4 -10 5 0 11 -7 13 -15 2 -9 8 -11 15 -7 9 6 8 12 -7 25 -11 9 -22 12 -25 7z"/>
                            <path d="M2837 85 c-4 -8 -2 -17 3 -20 6 -4 10 3 10 14 0 25 -6 27 -13 6z"/>
                            <path d="M2566 75 c-9 -26 -7 -32 5 -12 6 10 9 21 6 23 -2 3 -7 -2 -11 -11z"/>
                            <path d="M2455 70 c-3 -5 -1 -10 4 -10 6 0 11 5 11 10 0 6 -2 10 -4 10 -3 0 -8 -4 -11 -10z"/>
                            <path d="M2606 64 c-5 -13 -3 -14 6 -7 7 6 20 13 28 16 10 4 8 6 -6 6 -12 1 -25 -6 -28 -15z"/>
                            <path d="M2686 49 c-8 -41 -8 -49 2 -49 4 0 8 18 10 40 3 48 -3 52 -12 9z"/>
                            <path d="M2880 71 c0 -6 5 -13 10 -16 6 -3 10 1 10 9 0 9 -4 16 -10 16 -5 0 -10 -4 -10 -9z"/>
                            <path d="M2727 63 c-10 -9 -9 -33 1 -33 4 0 8 9 8 20 0 23 0 22 -9 13z"/>
                            <path d="M2815 50 c-3 -5 -1 -10 4 -10 6 0 11 5 11 10 0 6 -2 10 -4 10 -3 0 -8 -4 -11 -10z"/>
                            <path d="M2775 40 c-16 -7 -17 -9 -3 -9 9 -1 20 4 23 9 7 11 7 11 -20 0z"/>
                            <path d="M2855 20 c3 -5 8 -10 11 -10 2 0 4 5 4 10 0 6 -5 10 -11 10 -5 0 -7 -4 -4 -10z"/>
                            <path d="M2900 20 c0 -5 5 -10 10 -10 6 0 10 5 10 10 0 6 -4 10 -10 10 -5 0 -10 -4 -10 -10z"/>
                            <path d="M2168 13 c6 -2 18 -2 25 0 6 3 1 5 -13 5 -14 0 -19 -2 -12 -5z"/>
                        </g>
                    </svg>
                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- Quick links -->


                        <!-- Style Switcher -->

                        <!-- / Style Switcher-->


                        <!-- Notification -->
                        <!--/ Notification -->
                        <!-- User -->
                        <!--/ User -->


                    </ul>
                </div>


                <!-- Search Small Screens -->
                <div class="navbar-search-wrapper search-input-wrapper  d-none">
                    <input type="text" class="form-control search-input container-xxl border-0" placeholder="Search..."
                           aria-label="Search...">
                    <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
                </div>


            </nav>

            <!-- / Navbar -->


            <!-- Content wrapper -->
            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <!-- DataTable with Buttons -->
                    <div class="card">
                        <div class="card-datatable table-responsive">
                            <div class="d-flex justify-content-between align-items-center">
                                <h3 class="m-4 fw-bold">Reporte de incidencias</h3>
                            </div>
                            <table id="serenazgo-table-incidencias" class="datatables-basic table border-top">
                                <thead>
                                <tr>
                                    <th>Incidencia</th>
                                    <th>Usuario</th>
                                    <th>Urbanizacion</th>
                                    <th>Estado</th>
                                    <th>Prioridad</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>


                                <!-- Editar Incd-->
                                <div class="modal fade" id="editUser" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                        <div class="modal-content p-3 p-md-5">
                                            <div class="modal-body">
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                <div class="text-center mb-4">
                                                    <h3>Editar Estado de la Incidencia</h3>
                                                    <p>Por favor colocar las medidas a tomar según la incidencia.</p>
                                                </div>
                                                <form id="editUserForm" class="row g-3" onsubmit="return false">

                                                    <div class="col-12">
                                                        <label class="form-label" >Escribir una breve respuesta de las medidas a tomar</label>
                                                        <textarea class="form-control" id="basic-default-bio" name="basic-default-bio" rows="3" required></textarea>
                                                    </div>

                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="modalEditUserStatus">Seleccione la ayuda a solicitar</label>
                                                        <select id="modalEditUserStatus" name="modalEditUserStatus" class="form-select" aria-label="Default select example">
                                                            <option selected>Seleccionar</option>
                                                            <option value="1">Ambulancia</option>
                                                            <option value="2">Bombero</option>
                                                            <option value="3">Policia</option>

                                                        </select>
                                                    </div>

                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="modalEditUserStatus">Editar Estado de Incidencia</label>
                                                        <select id="modalEditUserStatus1" name="modalEditUserStatus" class="form-select" aria-label="Default select example">
                                                            <option selected>Seleccionar</option>
                                                            <option value="1">En Proceso</option>
                                                            <option value="2">Cerrada</option>
                                                            <option value="3">Falsa Alarma</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="modalEditUserStatus">Seleccione la prioridad</label>
                                                        <select id="modalEditUserStatus2" name="modalEditUserStatus" class="form-select" aria-label="Default select example">
                                                            <option selected>Seleccionar</option>
                                                            <option value="1">Alta</option>
                                                            <option value="2">Media</option>
                                                            <option value="3">Baja</option>

                                                        </select>
                                                    </div>



                                                    <div style="margin-top: 20px" class="col-12 text-center" >
                                                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Actualizar Estado</button>
                                                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--/ Editar Incd -->






                                <!-- Modal -->

                                <div class="modal fade" id="modalScrollable1" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle1">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">

                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me dirijo a ustedes con preocupación para informar sobre un accidente que está ocurriendo en este momento en la Calle 3 de San Borja. Soy Ana Duran, una vecina consternada por lo que está sucediendo en nuestra comunidad. </p>

                                                <p>Atentamente,</p>

                                                <p>Ana Duran.
                                                    Vecina de la Calle 3 - San Borja</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/accidente.jpeg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 3- San Borja.</p>
                                                        <p class="card-text">Referencia: 2 cuadras de Modo.</p>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <div class="modal fade" id="modalScrollable3" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle3">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me comunico con ustedes con gran preocupación para informar sobre un robo que está ocurriendo en este momento en la Calle 5 de San Miguel. Soy Carlos Paredes, un vecino consternado por lo que está sucediendo en nuestra comunidad.</p>

                                                <p>En este momento, mientras redacto este reporte, puedo ver desde mi ventana cómo individuos sospechosos están forzando la entrada a una vivienda cercana. Han roto la puerta principal y están saqueando el interior de la propiedad.</p>

                                                <p>Atentamente,</p>

                                                <p>Carlos Paredes.
                                                    Vecino de la Calle 5 - San Miguel</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/robo2.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 5- San Miguel.</p>
                                                        <p class="card-text">Referencia: 3 cuadras de Plaza San Miguel.</p>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalScrollable2" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle2">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me comunico con ustedes con urgencia para informar sobre un robo que está ocurriendo en este momento en la Calle 2 de Ingeniería. Soy Andrés Rivero, un vecino consternado por la situación que estamos enfrentando en nuestra comunidad. </p>

                                                <p>Al momento de redactar este reporte, puedo observar desde mi ventana cómo individuos desconocidos están intentando ingresar a una vivienda cercana. Han forzado la cerradura y están tratando de entrar a la propiedad. </p>

                                                <p>Atentamente,</p>

                                                <p>Andrés Rivero.
                                                    Vecino de la Calle 2 - Ingeniería</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/robo1.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 2- Ingenieria.</p>
                                                        <p class="card-text">Referencia: frente al parque de las Leyendas.</p>

                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalScrollable4" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle4">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me dirijo a ustedes con gran preocupación para informar sobre un incendio que está ocurriendo en este momento en la Calle 4 de La Marina. Soy Dina Boluarte, una vecina consternada por la situación que estamos enfrentando.</p>

                                                <p>Atentamente,</p>

                                                <p>Dina Boluarte. Vecina de la Calle 4 - La Marina</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/incendio1.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 4- La Marina.</p>
                                                        <p class="card-text">Referencia: Frente al Casino.</p>

                                                    </div>
                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalScrollable5" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle5">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me dirijo a ustedes con gran urgencia para informar sobre un incendio que está ocurriendo en este momento en la Calle 1 de Villa del Mar. Soy Katiuska Quispe, una vecina preocupada por la seguridad de nuestra comunidad.</p>

                                                <p>Atentamente,</p>

                                                <p>Katiuska Quispe. Vecina de la Calle 1 - Villa del Mar</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/incendio2.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 3- San Miguel.</p>
                                                        <p class="card-text">Referencia: 2 cuadras de Modo.</p>

                                                    </div>
                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <tbody>
                                <tr>
                                    <td>Incendio en la calle 1</td>
                                    <td>Katiuska Quispe</td>
                                    <td>Villa del mar</td>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <td><span class="badge bg-danger">Alta</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable5"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                onclick="promptDeletion();" id="confirm-color"><i
                                                class='bx bx-trash'></i></button>

                                    </td>
                                </tr>
                                <tr>
                                    <td>Robo en la calle 2</td>
                                    <td>Andres Rivero</td>
                                    <td>Ingeniería</td>
                                    <td><span class="badge bg-success">Resuelto</span></td>
                                    <td><span class="badge bg-warning">Media</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable2"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Accidente en la calle 3</td>
                                    <td>Ana Durán</td>
                                    <td>San Borja</td>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <td><span class="badge bg-danger">Alta</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable1"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Incendio en la calle 4</td>
                                    <td>Dina Boluarte</td>
                                    <td>La Marina</td>
                                    <td><span class="badge bg-success">Resuelto</span></td>
                                    <td><span class="badge bg-warning">Media</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable4"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Robo en la calle 5</td>
                                    <td>Carlos Paredes</td>
                                    <td>San Miguel</td>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <td><span class="badge bg-danger">Alta</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable3"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
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
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
                <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
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

                <!-- Modals pa la pagina -->
                <script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>

                <script src="${pageContext.request.contextPath}/assets/js/ui-modals.js"></script>
                <!-- Page JS -->
                <script src="${pageContext.request.contextPath}/assets/js/init-datatables.js"></script>

                <script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
                <script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>


            </div>
        </div>
    </div>
</div>


<!-- Modal Eliminación -->
<div class="modal fade" id="deletionModal" tabindex="-1" aria-labelledby="deletionModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletionModalLabel">Confirmar Eliminación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de que deseas eliminar este elemento?</p>
                <div class="mb-3">
                    <label for="deleteReason" class="form-label">Motivo de la eliminación:</label>
                    <textarea type="text" class="form-control" id="deleteReason" required></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" onclick="submitDeletion()">Eliminar</button>
            </div>
        </div>
    </div>
</div>
<script>
    function closeModal() {
        const modal = document.getElementById('deletionModal');
        modal.style.display = 'none'; // Oculta el modal
    }
    function promptDeletion() {
        var myModal = new bootstrap.Modal(document.getElementById('deletionModal'));
        myModal.show(); // This is the correct way to show a mod
    }



    function submitDeletion() {
        const reason = document.getElementById('deleteReason').value;
        if (reason === '') {
            alert('Por favor, ingrese un motivo para la eliminación.');
            return;
        }

        if (confirm('¿Está seguro de que desea eliminar esta incidencia?')) {
            console.log('Motivo:', reason); // Aquí deberías enviar el motivo a la base de datos
            alert('La incidencia ha sido eliminada correctamente.');
            closeModal();
            // Aquí deberías implementar la lógica para eliminar la fila del servidor/base de datos
        }
    }

</script>


</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:09 GMT -->
</html>