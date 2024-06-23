<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi : Crear Evento</title>

    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

    <!-- Google Tag Manager -->
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
            'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bs-stepper/bs-stepper.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/form-validation.css"/>

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>

<body>

<!-- Google Tag Manager (noscript) -->
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

                    <h4 class="py-3 mb-4">
                        <span class="text-muted fw-light">Crear Eventos: Ingresar Datos </span>
                    </h4>

                    <!-- Create Deal Wizard -->
                    <div id="wizard-create-deal" class="bs-stepper vertical mt-2">
                        <div class="bs-stepper-header">
                            <div class="step" data-target="#deal-type">
                                <button type="button" class="step-trigger">
                                    <span class="bs-stepper-circle">
                                        <i class='bx bx-purchase-tag'></i>
                                    </span>
                                    <span class="bs-stepper-label">
                                        <span class="bs-stepper-title">Datos Generales</span>
                                        <span class="bs-stepper-subtitle">Subir imagen</span>
                                    </span>
                                </button>
                            </div>
                            <div class="line"></div>
                            <div class="step" data-target="#deal-details">
                                <button type="button" class="step-trigger">
                                    <span class="bs-stepper-circle">
                                        <i class='bx bx-detail'></i>
                                    </span>
                                    <span class="bs-stepper-label">
                                        <span class="bs-stepper-title">Detalles del evento</span>
                                        <span class="bs-stepper-subtitle"> Información del evento </span>
                                    </span>
                                </button>
                            </div>
                            <div class="line"></div>
                            <div class="step" data-target="#deal-usage">
                                <button type="button" class="step-trigger">
                                    <span class="bs-stepper-circle">
                                        <i class='bx bx-credit-card'></i>
                                    </span>
                                    <span class="bs-stepper-label">
                                        <span class="bs-stepper-title">Inscripciones</span>
                                        <span class="bs-stepper-subtitle">Vacantes disponibles</span>
                                    </span>
                                </button>
                            </div>
                            <div class="line"></div>
                            <div class="step" data-target="#review-complete">
                                <button type="button" class="step-trigger">
                                    <span class="bs-stepper-circle">
                                        <i class='bx bx-rocket'></i>
                                    </span>
                                    <span class="bs-stepper-label">
                                        <span class="bs-stepper-title">Resumen</span>
                                        <span class="bs-stepper-subtitle">Revisar datos y finalizar</span>
                                    </span>
                                </button>
                            </div>
                        </div>
                        <div class="bs-stepper-content">
                            <form id="wizard-create-deal-form" onSubmit="return false">
                                <!-- Deal Type -->
                                <div id="deal-type" class="content">
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-md mb-md-0 mb-2 columna">
                                                    <div class="form-check custom-option custom-option-icon">
                                                        <input class="form-check-input" type="radio" name="customRadio" id="customRadioPercentage" hidden>
                                                        <label class="form-check-label custom-option-content" for="customRadioPercentage">
                                                            <span class="custom-option-body">
                                                                <img src="" alt="Custom Icon" id="custom-icon" class="custom-icon">
                                                            </span>
                                                        </label>
                                                    </div>
                                                    <button class="btn btn-primary" id="upload-button">Subir imagen</button>
                                                    <input class="form-control" type="file" id="file-input" accept="image/*" style="display: none;">
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-12 d-flex justify-content-between">
                                            <button class="btn btn-label-secondary btn-prev" disabled>
                                                <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                <span class="align-middle d-sm-inline-block d-none">Previous</span>
                                            </button>
                                            <button class="btn btn-primary btn-next">
                                                <span class="align-middle d-sm-inline-block d-none me-sm-1">Next</span>
                                                <i class="bx bx-chevron-right bx-sm me-sm-n2"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Deal Details -->
                                <div id="deal-details" class="content">
                                    <div class="row g-3">
                                        <div class="col-12 col-lg-6">
                                            <label class="form-label" for="deal-title">Título del evento</label>
                                            <input type="text" id="deal-title" name="deal-title" class="form-control"
                                                   placeholder="Ingresar título del evento"/>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <label class="form-label" for="deal-category">Categoría</label>
                                            <input type="text" id="deal-category" name="deal-category"
                                                   class="form-control" placeholder="Ingresar categoría"/>
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label" for="deal-description">Descripción</label>
                                            <textarea id="deal-description" name="deal-description" class="form-control"
                                                      placeholder="Ingresar descripción"></textarea>
                                        </div>

                                        <div class="col-12 d-flex justify-content-between">
                                            <button class="btn btn-label-secondary btn-prev">
                                                <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                <span class="align-middle d-sm-inline-block d-none">Previous</span>
                                            </button>
                                            <button class="btn btn-primary btn-next">
                                                <span class="align-middle d-sm-inline-block d-none me-sm-1">Next</span>
                                                <i class="bx bx-chevron-right bx-sm me-sm-n2"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Deal Usage -->
                                <div id="deal-usage" class="content">
                                    <div class="row g-3">
                                        <div class="col-12 col-lg-6">
                                            <label class="form-label" for="deal-discount">Inscripciones Disponibles</label>
                                            <input type="number" id="deal-discount" name="deal-discount" class="form-control"
                                                   placeholder="Ingresar cantidad de inscripciones"/>
                                        </div>

                                        <div class="col-12 d-flex justify-content-between">
                                            <button class="btn btn-label-secondary btn-prev">
                                                <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                <span class="align-middle d-sm-inline-block d-none">Previous</span>
                                            </button>
                                            <button class="btn btn-primary btn-next">
                                                <span class="align-middle d-sm-inline-block d-none me-sm-1">Next</span>
                                                <i class="bx bx-chevron-right bx-sm me-sm-n2"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Review Complete -->
                                <div id="review-complete" class="content">
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <h6>Resumen</h6>
                                            <p>Revisar los datos ingresados y finalizar el registro del evento.</p>
                                        </div>

                                        <div class="col-12 d-flex justify-content-between">
                                            <button class="btn btn-label-secondary btn-prev">
                                                <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                <span class="align-middle d-sm-inline-block d-none">Previous</span>
                                            </button>
                                            <button class="btn btn-success">
                                                <span class="align-middle d-sm-inline-block d-none me-sm-1">Finalizar</span>
                                                <i class="bx bx-check-circle bx-sm me-sm-n2"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- / Create Deal Wizard -->

                </div>
                <!-- / Content -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- / Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>
</div>
<!-- / Layout wrapper -->

<!-- Core JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bs-stepper/bs-stepper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/form-validation/dist/umd/FormValidation.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/form-validation/dist/umd/plugins/Bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/form-validation/dist/umd/plugins/AutoFocus.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/form-wizard-create-deal.js"></script>

<script>
    $(document).ready(function () {
        $('#upload-button').on('click', function (e) {
            e.preventDefault();
            $('#file-input').click();
        });

        $('#file-input').on('change', function () {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#custom-icon').attr('src', e.target.result);
            };
            reader.readAsDataURL(this.files[0]);
        });
    });
</script>

</body>

</html>
