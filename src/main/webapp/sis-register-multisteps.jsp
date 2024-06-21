<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-wide  customizer-hide" dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/auth-register-multisteps.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:08 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Registro de Usuario | SanMI</title>


    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

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
    <!-- Vendor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bs-stepper/bs-stepper.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />

    <!-- Page CSS -->

    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-auth.css">

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

<!-- Content -->

<div class="authentication-wrapper authentication-cover">
    <div class="authentication-inner row m-0">

        <!-- Left Text -->
        <div class="d-none d-lg-flex col-lg-4 align-items-center justify-content-end p-5 pe-0">
            <div class="w-px-400">
                <img src="${pageContext.request.contextPath}/assets/img/illustrations/img_register.png" class="img-fluid" alt="multi-steps" width="600" >
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
                                    <!--<div class="col-md-12">
                                      <label class="form-label" for="multiStepsURL">Profile Link</label>
                                      <input type="text" name="multiStepsURL" id="multiStepsURL" class="form-control" placeholder="johndoe/profile" aria-label="johndoe" />
                                    </div>-->
                                    <div class="col-12 d-flex justify-content-between">
                                        <button class="btn btn-label-secondary btn-prev" disabled> <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                            <span class="align-middle d-sm-inline-block d-none">Previous</span>
                                        </button>
                                        <button class="btn btn-primary btn-next"> <span class="align-middle d-sm-inline-block d-none me-sm-1 me-0">Next</span> <i class="bx bx-chevron-right bx-sm me-sm-n2"></i></button>
                                    </div>
                                </div>
                            </div>
                            <!-- Personal Info -->
                            <div id="personalInfoValidation" class="content">
                                <div class="content-header mb-3">
                                    <h3 class="mb-1">Información personal</h3>
                                    <span>Ingresa tu información personal</span>
                                </div>
                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsFirstName">Nombres</label>
                                        <input type="text" id="multiStepsFirstName" name="multiStepsFirstName" class="form-control" placeholder="Ingrese sus nombres" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsLastName">Apellidos</label>
                                        <input type="text" id="multiStepsLastName" name="multiStepsLastName" class="form-control" placeholder="Ingrese sus apellidos" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsMobile">N° de celular</label>
                                        <div class="input-group input-group-merge">
                                            <span class="input-group-text">PE (+51)</span>
                                            <input type="text" id="multiStepsMobile" name="multiStepsMobile" class="form-control multi-steps-mobile" placeholder="999 999 999" maxlength="11"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsPincode">DNI</label>
                                        <input type="text" id="multiStepsPincode" name="multiStepsPincode" class="form-control multi-steps-pincode" placeholder="Ingrese su número de DNI" maxlength="8" />
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label" for="multiStepsAddress">Domicilio</label>
                                        <input type="text" id="multiStepsAddress" name="multiStepsAddress" class="form-control" placeholder="Ingrese su domicilio" />
                                    </div>
                                    <!--<div class="col-md-12">
                                      <label class="form-label" for="multiStepsArea">Landmark</label>
                                      <input type="text" id="multiStepsArea" name="multiStepsArea" class="form-control" placeholder="Area/Landmark" />
                                    </div>-->
                                    <!--Preguntar si se hará un dropdown para los distritos, se supone que solo se registran vecinos de San Miguel-->
                                    <!--<div class="col-sm-6">
                                      <label class="form-label" for="multiStepsCity">City</label>
                                      <input type="text" id="multiStepsCity" class="form-control" placeholder="Jackson" />
                                    </div>-->
                                    <div class="col-sm-12">
                                        <label class="form-label" for="multiStepsState">Urbanización</label>
                                        <select id="multiStepsState" class="select2 form-select" data-allow-clear="true">
                                            <option value="">Select</option>
                                            <option value="AU">Aurora</option>
                                            <option value="BV">Bellavista</option>
                                            <option value="CA">Camacho</option>
                                            <option value="CO">Corpac</option>
                                            <option value="IN">Ingeniería</option>
                                            <option value="JP">Javier Prado</option>
                                            <option value="LM">La Marina</option>
                                            <option value="LE">Lescano</option>
                                            <option value="MA">Maranga</option>
                                            <option value="MO">Monterrico</option>
                                            <option value="OR">Orbea</option>
                                            <option value="RM">Roma</option>
                                            <option value="SA">San Antonio</option>
                                            <option value="SB">San Borja</option>
                                            <option value="SE">San Eduardo</option>
                                            <option value="SG">San Gabriel</option>
                                            <option value="SM">San Miguel</option>
                                            <option value="SI">Santa Isabel</option>
                                            <option value="SMG">Santa Margarita</option>
                                            <option value="SM">San Martín</option>
                                            <option value="MD">Venecia</option>
                                            <option value="MA">Villa del mar</option>
                                        </select>
                                    </div>
                                    <div class="col-12 d-flex justify-content-between">
                                        <button class="btn btn-primary btn-prev"> <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                            <span class="align-middle d-sm-inline-block d-none">Previous</span>
                                        </button>
                                        <button onclick="window.location.href='sistema-verifyEmail.html'" type="submit" class="btn btn-success btn-next btn-submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                            <!-- Billing Links -->
                            <div id="billingLinksValidation" class="content">
                                <div class="content-header mb-3">
                                    <h3 class="mb-1">Select Plan</h3>
                                    <span>Select plan as per your requirement</span>
                                </div>
                                <!-- Custom plan options -->
                                <div class="row gap-md-0 gap-3 mb-4">
                                    <div class="col-md">
                                        <div class="form-check custom-option custom-option-icon">
                                            <label class="form-check-label custom-option-content" for="basicOption">
                        <span class="custom-option-body">
                          <span class="mb-2 h4 d-block">Basic</span>
                          <span class="mb-2 d-block">A simple start for start ups & Students</span>
                          <span class="d-flex justify-content-center">
                            <sup class="text-primary fs-big lh-1 mt-3">$</sup>
                            <span class="display-5 text-primary">0</span>
                            <sub class="lh-1 fs-big mt-auto mb-2 text-muted">/month</sub>
                          </span>
                        </span>
                                                <input name="customRadioIcon" class="form-check-input" type="radio" value="" id="basicOption" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-check custom-option custom-option-icon">
                                            <label class="form-check-label custom-option-content" for="standardOption">
                        <span class="custom-option-body">
                          <span class="mb-2 h4 d-block">Standard</span>
                          <span class="mb-2 d-block">For small to medium businesses</span>
                          <span class="d-flex justify-content-center">
                            <sup class="text-primary fs-big lh-1 mt-3">$</sup>
                            <span class="display-5 text-primary">99</span>
                            <sub class="lh-1 fs-big mt-auto mb-2 text-muted">/month</sub>
                          </span>
                        </span>
                                                <input name="customRadioIcon" class="form-check-input" type="radio" value="" id="standardOption" checked />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-check custom-option custom-option-icon">
                                            <label class="form-check-label custom-option-content" for="enterpriseOption">
                        <span class="custom-option-body">
                          <span class="mb-2 h4 d-block">Enterprise</span>
                          <span class="mb-2 d-block">Solution for enterprise & organizations</span>
                          <span class="d-flex justify-content-center">
                            <sup class="text-primary fs-big lh-1 mt-3">$</sup>
                            <span class="display-5 text-primary">499</span>
                            <sub class="lh-1 fs-big mt-auto mb-2 text-muted">/year</sub>
                          </span>
                        </span>
                                                <input name="customRadioIcon" class="form-check-input" type="radio" value="" id="enterpriseOption" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Custom plan options -->
                                <div class="content-header mb-3">
                                    <h3 class="mb-1">Payment Information</h3>
                                    <span>Enter your card information</span>
                                </div>
                                <!-- Credit Card Details -->
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <label class="form-label w-100" for="multiStepsCard">Card Number</label>
                                        <div class="input-group input-group-merge">
                                            <input id="multiStepsCard" class="form-control multi-steps-card" name="multiStepsCard" type="text" placeholder="1356 3215 6548 7898" aria-describedby="multiStepsCardImg" />
                                            <span class="input-group-text cursor-pointer" id="multiStepsCardImg"><span class="card-type"></span></span>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <label class="form-label" for="multiStepsName">Name On Card</label>
                                        <input type="text" id="multiStepsName" class="form-control" name="multiStepsName" placeholder="John Doe" />
                                    </div>
                                    <div class="col-6 col-md-4">
                                        <label class="form-label" for="multiStepsExDate">Expiry Date</label>
                                        <input type="text" id="multiStepsExDate" class="form-control multi-steps-exp-date" name="multiStepsExDate" placeholder="MM/YY" />
                                    </div>
                                    <div class="col-6 col-md-3">
                                        <label class="form-label" for="multiStepsCvv">CVV Code</label>
                                        <div class="input-group input-group-merge">
                                            <input type="text" id="multiStepsCvv" class="form-control multi-steps-cvv" name="multiStepsCvv" maxlength="3" placeholder="654" />
                                            <span class="input-group-text cursor-pointer" id="multiStepsCvvHelp"><i class="bx bx-help-circle text-muted" data-bs-toggle="tooltip" data-bs-placement="top" title="Card Verification Value"></i></span>
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex justify-content-between">
                                        <button class="btn btn-primary btn-prev"> <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                            <span class="align-middle d-sm-inline-block d-none">Previous</span>
                                        </button>

                                    </div>
                                </div>
                                <!--/ Credit Card Details -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- / Multi Steps Registration -->
    </div>
</div>

<script>
    // Check selected custom option
    window.Helpers.initCustomOptionCheck();

</script>

<!-- / Content -->

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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bs-stepper/bs-stepper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/auto-focus.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/pages-auth-multisteps.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/auth-register-multisteps.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:10 GMT -->
</html>

