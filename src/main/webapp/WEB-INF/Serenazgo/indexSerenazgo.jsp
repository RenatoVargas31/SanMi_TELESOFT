<%--
  Created by IntelliJ IDEA.
  User: Sergio
  Date: 15/06/2024
  Time: 00:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-logistics-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:13:40 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi: Bienvenido Serenazgo</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apex-charts.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css"/>

    <!-- Page CSS -->

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

<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0"
            style="display: none; visibility: hidden"></iframe>
</noscript>



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
                        <span class="text fw-black">¡Bienvenido Serenazgo! 👋 </span>
                    </h1>
                    <div class="card bg-transparent shadow-none border-0 my-4">
                        <div class="card-body row p-0 pb-3">
                            <div class="col-12 col-md-8 card-separator">
                                <div class="col-12 col-lg-8">
                                    <p>Tu actividad es importante para mantener la seguridad de todos los vecinos del distrito,
                                        tu correcta evaluación y toma decisiones frente a las incidencias puede salvar vidas. </p>
                                </div>
                                <div class="d-flex justify-content-between flex-wrap gap-3 me-5">
                                    <div class="d-flex align-items-center gap-3 me-4 me-sm-0">
          <span class=" bg-label-primary p-2 rounded">
            <i class='bx bx-news bx-sm'></i>
          </span>
                                        <div class="content-right">
                                            <p class="mb-0">Incidencias nuevas</p>
                                            <h4 class="text-primary mb-0">2</h4>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center gap-3">
          <span class="bg-label-info p-2 rounded">
            <i class='bx bx-timer bx-sm'></i>
          </span>
                                        <div class="content-right">
                                            <p class="mb-0">Incidencias en proqreso</p>
                                            <h4 class="text-info mb-0">15</h4>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center gap-3">
          <span class="bg-label-warning p-2 rounded">
            <i class='bx bx-check-circle bx-sm'></i>
          </span>
                                        <div class="content-right">
                                            <p class="mb-0">Incidencias cerradas </p>
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
                    <!-- Card Border Shadow -->

                    <!--/ Card Border Shadow -->
                    <div class="row">
                        <!-- Vehicles overview -->

                        <div class="ol-xxl-6 mb-4 order-5 order-xxl-4">
                            <div class="card h-100">
                                <div class="card-header">
                                    <div class="card-title mb-0">
                                        <h5 class="m-0">Incidencias por criticidad</h5>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="d-none d-lg-flex vehicles-progress-labels mb-3">
                                        <div class="vehicles-progress-label on-the-way-text" style="width: 20%;">
                                            Urgente
                                        </div>
                                        <div class="vehicles-progress-label unloading-text" style="width: 30%;">
                                            Medio
                                        </div>
                                        <div class="vehicles-progress-label loading-text" style="width: 50%;">Baja
                                        </div>
                                    </div>
                                    <div class="vehicles-overview-progress progress rounded-2 mb-3"
                                         style="height: 46px;">
                                        <div class="progress-bar fs-big fw-medium text-start bg-lighter text-body px-1 px-lg-3 rounded-start shadow-none"
                                             role="progressbar" style="width: 20%" aria-valuenow="20"
                                             aria-valuemin="0" aria-valuemax="100">20%
                                        </div>
                                        <div class="progress-bar fs-big fw-medium text-start bg-primary px-1 px-lg-3 shadow-none"
                                             role="progressbar" style="width: 30%" aria-valuenow="30"
                                             aria-valuemin="0" aria-valuemax="100">30%
                                        </div>
                                        <div class="progress-bar fs-big fw-medium text-start text-bg-info px-1 px-lg-3 rounded-end shadow-none"
                                             role="progressbar" style="width: 50%" aria-valuenow="50"
                                             aria-valuemin="0" aria-valuemax="100">50%
                                        </div>

                                    </div>
                                    <div class="table-responsive">
                                        <table class="table card-table">
                                            <tbody class="table-border-bottom-0">
                                            <tr>
                                                <td class="w-50 ps-0">
                                                    <div class="d-flex justify-content-start align-items-center">
                                                        <div class="me-2">
                                                            <i class="bx bxs-bell-ring"></i>
                                                        </div>
                                                        <h6 class="mb-0 fw-normal">Urgente</h6>
                                                    </div>
                                                </td>
                                                <td class="text-end pe-0 text-nowrap">
                                                    <h6 class="mb-0">20 casos</h6>
                                                </td>
                                                <td class="text-end pe-0">
                                                    <span class="fw-medium">20%</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="w-50 ps-0">
                                                    <div class="d-flex justify-content-start align-items-center">
                                                        <div class="me-2">
                                                            <i class='bx bxs-bell'></i>
                                                        </div>
                                                        <h6 class="mb-0 fw-normal">Medio</h6>
                                                    </div>
                                                </td>
                                                <td class="text-end pe-0 text-nowrap">
                                                    <h6 class="mb-0">30 casos</h6>
                                                </td>
                                                <td class="text-end pe-0">
                                                    <span class="fw-medium">30%</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="w-50 ps-0">
                                                    <div class="d-flex justify-content-start align-items-center">
                                                        <div class="me-2">
                                                            <i class='bx bx-bell'></i>
                                                        </div>

                                                        <h6 class="mb-0 fw-normal">Baja</h6>
                                                    </div>
                                                </td>
                                                <td class="text-end pe-0 text-nowrap">
                                                    <h6 class="mb-0">50 casos</h6>
                                                </td>
                                                <td class="text-end pe-0">
                                                    <span class="fw-medium">50%</span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Vehicles overview -->
                        <!-- Shipment statistics-->
                        <div class="col-md-6 col-xxl-6 mb-4 order-0 order-xxl-0">
                            <div class="card h-100">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <div class="card-title mb-0">
                                        <h5 class="m-0 me-2">Número de incidencias en el mes</h5>
                                        <small class="text-muted">numero total de incidencias: 238</small>
                                    </div>
                                    <select class="select2 form-select form-select me-2 w-25 select2-hidden-accessible" data-allow-clear="true" data-select2-id="select2Basic" tabindex="-1" aria-hidden="true">
                                        <option >Enero</option>
                                        <option >Febrero</option>
                                        <option >Marzo</option>
                                        <option >Abril</option>
                                        <option >Mayo</option>
                                        <option >Junio</option>
                                        <option >Julio</option>
                                        <option >Agosto</option>
                                        <option >Setiembre</option>
                                        <option >Octubre</option>
                                        <option >Nomviembre</option>
                                        <option >Diciembre</option>
                                    </select>
                                    <select class="select2 form-select form-select me-2 w-25 select2-hidden-accessible" data-allow-clear="true" data-select2-id="select2Basic" tabindex="-1" aria-hidden="true">
                                        <option >Semana 1</option>
                                        <option >Semana 2</option>
                                        <option >Semana 3</option>
                                        <option >Semana 4</option>
                                        <option >Semana 5</option>
                                    </select>
                                </div>
                                <div class="card-body">
                                    <div id="shipmentStatisticsChart"></div>
                                </div>
                            </div>
                        </div>
                        <!--/ Shipment statistics -->

                        <!-- Reasons for delivery exceptions -->
                        <div class="col-md-6 col-xxl-6 mb-4 order-1 order-xxl-3">
                            <div class="card h-100">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <div class="card-title mb-0">
                                        <h5 class="m-0 me-2">Incidencias por zonas</h5>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn p-0" type="button" id="deliveryExceptions"
                                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end"
                                             aria-labelledby="deliveryExceptions">
                                            <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div id="deliveryExceptionsChart"></div>
                                </div>
                            </div>
                        </div>
                        <!--/ Reasons for delivery exceptions -->
                        <!-- Orders by Countries -->

                        <!--/ Orders by Countries -->
                        <!-- On route vehicles Table -->

                    </div>
                    <!--/ On route vehicles Table -->


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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-logistics-dashboard.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/chart-1_SereDashboard.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-logistics-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:13:42 GMT -->
</html>
