<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-wide customizer-hide" dir="ltr" data-theme="theme-semi-dark" data-assets-path="<%=request.getContextPath()%>/assets/" data-template="vertical-menu-template-semi-dark">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
  <title>Registro de Usuario | SanMI</title>
  <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
  <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
  <!-- Canonical SEO -->
  <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">
  <!-- Google Tag Manager -->
  <script>
    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
              new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!=='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-5DDHKGP');
  </script>
  <!-- End Google Tag Manager -->
  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/img/illustrations/logo-San-Miguel-1.webp" />
  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com/">
  <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <!-- Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/boxicons.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/fontawesome.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/flag-icons.css" />
  <!-- Core CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/demo.css" />
  <!-- Vendors CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/bs-stepper/bs-stepper.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/select2/select2.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/@form-validation/form-validation.css" />
  <!-- Page CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/pages/page-auth.css">
  <!-- Helpers -->
  <script src="<%=request.getContextPath()%>/assets/vendor/js/helpers.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/js/template-customizer.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/config.js"></script>
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript>
  <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
<!-- Content -->
<div class="authentication-wrapper authentication-cover">
  <div class="authentication-inner row m-0">
    <!-- Left Text -->
    <div class="d-none d-lg-flex col-lg-4 align-items-center justify-content-end p-5 pe-0">
      <div class="w-px-400">
        <img src="<%=request.getContextPath()%>/assets/img/illustrations/img_register.png" class="img-fluid" alt="multi-steps" width="400" >
      </div>
    </div>
    <!-- /Left Text -->
    <!--  Multi Steps Registration -->
    <div class="d-flex col-lg-8 align-items-center justify-content-center authentication-bg p-sm-5 p-3">
      <div class="w-px-700">
        <div id="multiStepsValidation" class="bs-stepper shadow-none">
          <div class="bs-stepper-header border-bottom-0">
            <div class="step" data-target="#accountDetailsValidation">
              <button type="button" class="step-trigger">
                <span class="bs-stepper-circle"><i class="bx bx-home-alt"></i></span>
                <span class="bs-stepper-label mt-1">
                  <span class="bs-stepper-title">Cuenta</span>
                  <span class="bs-stepper-subtitle">Detalles de la cuenta</span>
                </span>
              </button>
            </div>
            <div class="line">
              <i class="bx bx-chevron-right"></i>
            </div>
            <div class="step" data-target="#personalInfoValidation">
              <button type="button" class="step-trigger">
                <span class="bs-stepper-circle"><i class="bx bx-user"></i></span>
                <span class="bs-stepper-label mt-1">
                  <span class="bs-stepper-title">Personal</span>
                  <span class="bs-stepper-subtitle">Información personal</span>
                </span>
              </button>
            </div>
          </div>
          <div class="bs-stepper-content">
            <form id="multiStepsForm" onSubmit="return false">
              <!-- Account Details -->
              <div id="accountDetailsValidation" class="content">
                <div class="content-header mb-3">
                  <h3 class="mb-1">Información de la cuenta</h3>
                  <span>Ingresa los detalles de la cuenta</span>
                </div>
                <div class="row g-3">
                  <div class="col-sm-6">
                    <label class="form-label" for="multiStepsUsername">Nombre de usuario</label>
                    <input type="text" name="multiStepsUsername" id="multiStepsUsername" class="form-control" placeholder="Ingrese su nombre de usuario" />
                  </div>
                  <div class="col-sm-6">
                    <label class="form-label" for="multiStepsEmail">Correo electrónico (gmail)</label>
                    <input type="email" name="multiStepsEmail" id="multiStepsEmail" class="form-control" placeholder="Ingrese su correo gmail" />
                  </div>
                  <div class="col-sm-6 form-password-toggle">
                    <label class="form-label" for="multiStepsPass">Contraseña</label>
                    <div class="input-group input-group-merge">
                      <input type="password" id="multiStepsPass" name="multiStepsPass" class="form-control" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="multiStepsPass2" />
                      <span class="input-group-text cursor-pointer" id="multiStepsPass2"><i class="bx bx-hide"></i></span>
                    </div>
                  </div>
                  <div class="col-sm-6 form-password-toggle">
                    <label class="form-label" for="multiStepsConfirmPass">Confirmar contraseña</label>
                    <div class="input-group input-group-merge">
                      <input type="password" id="multiStepsConfirmPass" name="multiStepsConfirmPass" class="form-control" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="multiStepsConfirmPass2" />
                      <span class="input-group-text cursor-pointer" id="multiStepsConfirmPass2"><i class="bx bx-hide"></i></span>
                    </div>
                  </div>
                  <div class="col-12 d-flex justify-content-between">
                    <button class="btn btn-outline-secondary btn-prev" disabled>
                      <i class="bx bx-chevron-left scaleX-n1-rtl"></i>
                      <span class="d-sm-inline-block d-none">Anterior</span>
                    </button>
                    <button class="btn btn-primary btn-next">
                      <span class="d-sm-inline-block d-none">Siguiente</span>
                      <i class="bx bx-chevron-right scaleX-n1-rtl"></i>
                    </button>
                  </div>
                </div>
              </div>
              <!-- Personal Info -->
              <div id="personalInfoValidation" class="content">
                <div class="content-header mb-3">
                  <h3 class="mb-1">Información Personal</h3>
                  <span>Ingresa tu información personal</span>
                </div>
                <div class="row g-3">
                  <div class="col-sm-6">
                    <label class="form-label" for="multiStepsFirstName">Nombre</label>
                    <input type="text" id="multiStepsFirstName" name="multiStepsFirstName" class="form-control" placeholder="Ingrese su nombre" />
                  </div>
                  <div class="col-sm-6">
                    <label class="form-label" for="multiStepsLastName">Apellido</label>
                    <input type="text" id="multiStepsLastName" name="multiStepsLastName" class="form-control" placeholder="Ingrese su apellido" />
                  </div>
                  <div class="col-sm-6">
                    <label class="form-label" for="multiStepsDOB">Fecha de Nacimiento</label>
                    <input type="text" id="multiStepsDOB" name="multiStepsDOB" class="form-control dob-picker" placeholder="DD / MM / YYYY" />
                  </div>
                  <div class="col-sm-6">
                    <label class="form-label" for="multiStepsCountry">País</label>
                    <select class="select2" id="multiStepsCountry">
                      <option label="Seleccione su país"></option>
                      <option>Argentina</option>
                      <option>Brasil</option>
                      <option>Colombia</option>
                      <option>España</option>
                      <option>México</option>
                    </select>
                  </div>
                  <div class="col-12 d-flex justify-content-between">
                    <button class="btn btn-outline-secondary btn-prev">
                      <i class="bx bx-chevron-left scaleX-n1-rtl"></i>
                      <span class="d-sm-inline-block d-none">Anterior</span>
                    </button>
                    <button class="btn btn-primary btn-next">
                      <span class="d-sm-inline-block d-none">Siguiente</span>
                      <i class="bx bx-chevron-right scaleX-n1-rtl"></i>
                    </button>
                  </div>
                </div>
              </div>
              <!-- Social Links -->
              <div id="socialLinksValidation" class="content">
                <div class="content-header mb-3">
                  <h3 class="mb-1">Detalles de la clase</h3>
                  <span>Ingresa detalles de tu clase</span>
                </div>
                <div class="row g-3">
                  <div class="col-12">
                    <label class="form-label" for="multiStepsBio">Biografía</label>
                    <textarea name="multiStepsBio" id="multiStepsBio" rows="4" class="form-control" placeholder="Biografía corta"></textarea>
                  </div>
                  <div class="col-12 d-flex justify-content-between">
                    <button class="btn btn-outline-secondary btn-prev">
                      <i class="bx bx-chevron-left scaleX-n1-rtl"></i>
                      <span class="d-sm-inline-block d-none">Anterior</span>
                    </button>
                    <button class="btn btn-primary btn-next">
                      <span class="d-sm-inline-block d-none">Siguiente</span>
                      <i class="bx bx-chevron-right scaleX-n1-rtl"></i>
                    </button>
                  </div>
                </div>
              </div>
              <!-- Photos -->
              <div id="photosValidation" class="content">
                <div class="content-header mb-3">
                  <h3 class="mb-1">Fotos</h3>
                  <span>Sube fotos de tu clase</span>
                </div>
                <div class="row g-3">
                  <div class="col-12">
                    <label class="form-label" for="multiStepsPhotos">Fotos</label>
                    <input type="file" name="multiStepsPhotos" id="multiStepsPhotos" class="form-control" />
                  </div>
                  <div class="col-12 d-flex justify-content-between">
                    <button class="btn btn-outline-secondary btn-prev">
                      <i class="bx bx-chevron-left scaleX-n1-rtl"></i>
                      <span class="d-sm-inline-block d-none">Anterior</span>
                    </button>
                    <button class="btn btn-success btn-submit">
                      <span class="d-sm-inline-block d-none">Enviar</span>
                      <i class="bx bx-send scaleX-n1-rtl"></i>
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- / Multi Steps Registration -->
  </div>
</div>

<!-- / Content -->
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="<%=request.getContextPath()%>/assets/vendor/libs/jquery/jquery.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/popper/popper.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/hammer/hammer.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/i18n/i18n.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/menu.js"></script>
<!-- endbuild -->
<!-- Vendors JS -->
<script src="<%=request.getContextPath()%>/assets/vendor/libs/bs-stepper/bs-stepper.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/select2/select2.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/cleavejs/cleave.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
<!-- Main JS -->
<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
<!-- Page JS -->
<script src="<%=request.getContextPath()%>/assets/js/pages-auth-multisteps.js"></script>
</body>
</html>