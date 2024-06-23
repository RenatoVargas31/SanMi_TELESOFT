<%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 12/06/2024
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.sanmi_telesoft.beans.Usuario" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi | Bienvenido Administrador</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apex-charts.css"/>

    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/app-logistics-dashboard.css"/>
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


                    <h1 class="py-3 mb-4">
                        <span class="text fw-black">¡Bienvenido Administrador! 👋 </span>
                    </h1>

                    <div class="card bg-transparent shadow-none border-0 my-4">
                        <div class="card-body row p-0 pb-3">
                            <div class="col-12 col-md-8 card-separator">
                                <div class="col-12 col-lg-8">
                                    <p>Gracias por acceder al panel de administración de nuestra página web.
                                        Aquí podrás gestionar y actualizar fácilmente el contenido, administrar usuarios y mucho más. </p>
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
                            <div class="col-12 col-md-4 ps-md-3 ps-lg-5 pt-3 pt-md-0">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div>
                                            <h5 class="mb-2">Incidencias por tipo</h5>
                                            <p class="mb-4">Reporte semanal</p>
                                        </div>
                                        <div class="time-spending-chart">
                                            <h3 class="mb-2">120<span class="text-muted"> incidencias</span></h3>
                                            <span class="badge bg-label-warning">+1% que la semana anterior</span>
                                        </div>
                                    </div>
                                    <div id="leadsReportChart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Chart 2 -->
                        <div class="col-xl-12 col-12 mb-4">
                            <div class="card">
                                <div class="card-header header-elements">
                                    <div class="d-flex flex-column">
                                        <h5 class="card-title mb-0">Asistencia de Eventos Semanal</h5>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="horizontalBarChart" class="chartjs" data-height="400" height="800" width="966" style="display: block; box-sizing: border-box; height: 400px; width: 483px;"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- Chart 3 -->
                        <div class="col-lg-4 col-12 mb-4">
                            <div class="card">
                                <h5 class="card-header">Usuarios por Rol</h5>
                                <div class="card-body">
                                    <canvas id="doughnutChart" class="chartjs mb-4" data-height="350"></canvas>
                                    <ul class="doughnut-legend d-flex justify-content-around ps-0 mb-2 pt-1">
                                        <li class="ct-series-0 d-flex flex-column">
                                            <h5 class="mb-0">Vecino</h5>
                                            <span class="badge badge-dot my-2 cursor-pointer rounded-pill" style="background-color: #277da1;width:35px; height:6px;"></span>
                                            <div class="text-muted">85 %</div>
                                        </li>
                                        <li class="ct-series-1 d-flex flex-column">
                                            <h5 class="mb-0">Coordinador</h5>
                                            <span class="badge badge-dot my-2 cursor-pointer rounded-pill" style="background-color: #f8961e;width:35px; height:6px;"></span>
                                            <div class="text-muted">10 %</div>
                                        </li>
                                        <li class="ct-series-2 d-flex flex-column">
                                            <h5 class="mb-0">S.Dispatcher</h5>
                                            <span class="badge badge-dot my-2 cursor-pointer rounded-pill" style="background-color: #287233;width:35px; height:6px;"></span>
                                            <div class="text-muted">5 %</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Chart 4 -->
                        <div class="col-lg-8 col-12 mb-4">
                            <div class="card">
                                <div class="card-header header-elements">
                                    <h5 class="card-title mb-0">Serenazgos por tipo</h5>
                                    <div class="card-header-elements ms-auto py-0 dropdown">
                                        <button type="button" class="btn dropdown-toggle hide-arrow p-0" id="heat-chart-dd" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-dots-vertical-rounded"></i></button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="heat-chart-dd">
                                            <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="polarChart" class="chartjs" data-height="337"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>


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
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/chartjs/chartjs.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>

        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


        <!-- Page JS -->
        <script src="${pageContext.request.contextPath}/assets/js/app-logistics-dashboard.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/chart-1_AdminDashboard.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/chart-2.3.4_AdminDashboard.js"></script>
    </div>
</div>
</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/pages-faq.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:03 GMT -->
</html>
