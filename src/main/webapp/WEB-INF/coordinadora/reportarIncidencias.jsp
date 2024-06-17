<%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 16/06/2024
  Time: 16:41
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


<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:08 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>DataTable | SanMI</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css" />
    <!-- Row Group CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
    <!-- Form Validation -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />

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
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-8">
                            <div class="card">
                                <div class="card-header" style="background-color: #33CCFF; color: white; text-align: center;">
                                    <h5 class="card-title text-white mb-0">Reportar Incidencia</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label class="form-label" for="fullname">Nombre de la incidencia</label>
                                            <input type="text" id="fullname" class="form-control" placeholder="" />
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" for="phone">Teléfono</label>
                                            <input type="text" id="phone" class="form-control phone-mask" placeholder="Opcional" aria-label="658 799 8941" />
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label" for="LugarExacto">Lugar Exacto</label>
                                            <textarea name="address" class="form-control" id="LugarExacto" rows="2" placeholder="Av, jr, calle."></textarea>
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label" for="Referencia">Referencia</label>
                                            <input type="text" id="Referencia" class="form-control" placeholder="Cerca a . . ." />
                                        </div>

                                        <div class="col-12">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="ambulancia" checked="">
                                                <label class="form-check-label" for="ambulancia">Es necesario una ambulancia</label>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label class="form-check-label">La incidencia afecta a:</label>
                                            <div class="form-check form-check-inline">
                                                <input name="collapsible-address-type" class="form-check-input" type="radio" value="" id="afectado-yo" checked="" />
                                                <label class="form-check-label" for="afectado-yo">Mi persona</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input name="collapsible-address-type" class="form-check-input" type="radio" value="" id="afectado-otras" />
                                                <label class="form-check-label" for="afectado-otras">Otras personas</label>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-group">
                                                <button class="btn btn-outline-primary" type="button" id="inputGroupFileAddon03">Subir foto</button>
                                                <input type="file" class="form-control" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03" aria-label="Upload" accept="image/jpeg, image/png">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mt-4">
                                        <button class="btn btn-label-primary"  onclick="checkFieldsAndGoBack();">Atrás</button>
                                        <div class="flex-grow-1 d-flex justify-content-center">
                                            <button class="btn btn-primary" style="background-color: #33CCFF; color: white; text-align: center;" onclick="reportarIncidencia() ;">Reportar</button>
                                        </div>
                                        <div style="width: 86px;"> <!-- This empty div serves as a spacer to maintain balance -->
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- / Layout page -->
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
            var fullname = document.getElementById('fullname').value.trim();
            var LugarExacto = document.getElementById('LugarExacto').value.trim();
            var referencia = document.getElementById('Referencia').value.trim();
            var fileInput = document.getElementById('inputGroupFile03');

            return fullname && LugarExacto && referencia && fileInput.files.length > 0;
        }

        // Maneja la lógica para cuando el usuario intenta volver atrás
        function checkFieldsAndGoBack() {
            if (areFieldsFilled()) {
                var confirmLeave = confirm('Todavía no ha reportado su incidencia. ¿Desea regresar de todas formas o reportar la incidencia ahora? OK para regresar, Cancelar para seguir escribiendo.');
                if (confirmLeave) {
                    window.location.href = 'mis-incidencias.html';
                } else {

                }
            } else {
                var confirmLeaveNoReport = confirm('No ha registrado los datos necesarios, ¿Está seguro que quiere volver? No se registrará su incidencia. Aceptar: Volver a lista general de incidencias. Cancelar: Seguir llenando los campos');
                if (confirmLeaveNoReport) {
                    window.location.href = 'mis-incidencias.html';
                } else {

                }
            }
        }

        // Maneja la lógica de reporte de incidencias
        function reportarIncidencia() {
            if (areFieldsFilled()) {
                alert('Se ha reportado correctamente la incidencia.');
                var ask = confirm("¿Desea reportar otra incidencia o volver a la lista general de incidencias? OK para Reportar otra incidencia, Cancelar para volver.");
                if (ask) {
                    window.location.href = 'reportar-incidenciias.html'; // Verifica si el nombre de este archivo es correcto
                } else {
                    window.location.href = 'mis-incidencias.html';
                }
            } else {
                alert('No se puede reportar la incidencia sin llenar todos los campos.');
            }
        }
    </script>

    <script>
        document.getElementById('inputGroupFile03').addEventListener('change', function(event) {
            const file = event.target.files[0];
            const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

            if (!allowedExtensions.exec(file.name)) {
                alert('Solo puedes subir imágenes !(archivos con terminación jpg o png)');
                event.target.value = '';
            } else {
                var reader = new FileReader();
                reader.onload = function(e) {
                    var imagePreview = document.createElement('img');
                    imagePreview.src = e.target.result;
                    imagePreview.style.maxWidth = '200px';
                    document.body.appendChild(imagePreview);
                };
                reader.readAsDataURL(file);
            }
        });
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

</div>
</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:09 GMT -->
</html>
