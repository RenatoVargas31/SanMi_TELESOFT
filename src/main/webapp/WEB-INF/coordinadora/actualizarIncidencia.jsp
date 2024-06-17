<%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 16/06/2024
  Time: 18:05
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


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:08 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>DataTable | SanMI</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css"/>
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
            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header sticky-element bg-label-secondary d-flex justify-content-between align-items-center flex-column flex-sm-row">
                                    <!-- Botón Atrás al extremo izquierdo -->
                                    <button class="btn btn-label-primary btn-lg me-3 mb-2 mb-sm-0"
                                            onclick="window.location='mis-incidencias.html';">
                                        <span class="align-middle"> Atrás</span>
                                    </button>

                                    <div class="flex-grow-1 d-none d-sm-flex justify-content-center">
                                        <button class="btn btn-primary btn-lg" onclick="reportarIncidencia();">
                                            Actualizar
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-8 mx-auto">
                                            <!-- 1. Delivery Address -->
                                            <h5 class="mb-4"></h5>
                                            <div class="row g-3">
                                                <div class="col-12">
                                                    <label class="form-label" for="LugarExacto-actualizar">Lugar
                                                        Exacto</label>
                                                    <textarea name="address" class="form-control"
                                                              id="LugarExacto-actualizar" rows="2"
                                                              placeholder="Av, jr, calle."></textarea>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label" for="phone-actualizar">Teléfono</label>
                                                    <input type="text" id="phone-actualizar"
                                                           class="form-control phone-mask" placeholder="Opcional"
                                                           aria-label="658 799 8941"/>
                                                </div>

                                                <div class="col-12">
                                                    <label class="form-label"
                                                           for="Referencia-actualizar">Referencia</label>
                                                    <input type="text" id="Referencia-actualizar" class="form-control"
                                                           placeholder="Cerca a . . ."/>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value=""
                                                               id="ambulancia-actualizar" checked="">
                                                        <label class="form-check-label" for="ambulancia-actualizar"> Es
                                                            necesario una ambulancia</label>
                                                    </div>
                                                </div>

                                                <label class="form-check-label">La incidencia afecta a:</label>
                                                <div class="col mt-2">
                                                    <div class="form-check form-check-inline">
                                                        <input name="collapsible-address-type" class="form-check-input"
                                                               type="radio" value="" id="afectado-yo-actualizar"
                                                               checked=""/>
                                                        <label class="form-check-label" for="afectado-yo-actualizar">Mi
                                                            persona</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input name="collapsible-address-type" class="form-check-input"
                                                               type="radio" value="" id="afectado-otras-actualizar"/>
                                                        <label class="form-check-label" for="afectado-otras-actualizar">
                                                            Otras personas </label>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary" type="button"
                                                            id="inputGroupFileAddon03-actualizar">Subir foto
                                                    </button>
                                                    <input type="file" class="form-control"
                                                           id="inputGroupFile03-actualizar"
                                                           aria-describedby="inputGroupFileAddon03" aria-label="Upload">
                                                </div>
                                            </div>
                                            <hr>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Sticky Actions -->
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
    <script>
        // Verifica que todos los campos de texto estén llenos y que un archivo haya sido cargado
        function areFieldsFilled() {
            var LugarExactoactualizar = document.getElementById('LugarExacto-actualizar').value.trim();
            var referenciaactualizar = document.getElementById('Referencia-actualizar').value.trim();
            var fileInputactualizar = document.getElementById('inputGroupFile03-actualizar');

            return LugarExactoactualizar && referenciaactualizar && fileInputactualizar.files.length > 0;
        }

        // Maneja la lógica para cuando el usuario intenta volver atrás
        function checkFieldsAndGoBack() {
            if (areFieldsFilled()) {
                var confirmLeave = confirm('Todavía no ha actualizado su incidencia. ¿Desea regresar de todas formas o actualizar la incidencia ahora? OK para regresar, Cancelar para seguir escribiendo.');
                if (confirmLeave) {
                    window.location.href = 'vecino-misIncidencias.html';
                } else {

                }
            } else {
                var confirmLeaveNoReport = confirm('No se ha actualizado su incidencia. ¿Está seguro que quiere volver? Aceptar: Volver . Cancelar: Seguir llenando los campos');
                if (confirmLeaveNoReport) {
                    window.location.href = 'vecino-misIncidencias.html';
                } else {

                }
            }
        }

        // Maneja la lógica de reporte de incidencias
        function reportarIncidencia() {
            if (areFieldsFilled()) {
                alert('Se ha actualizado correctamente la incidencia.');

                window.location.href = 'vecino-misIncidencias.html';

            } else {
                alert('No se puede actualizar la incidencia sin llenar todos los campos.');
            }
        }
    </script>

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


    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/assets/js/init-datatables.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:09 GMT -->
</html>
