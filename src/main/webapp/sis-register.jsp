<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">
<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/auth-register-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:15:08 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>SanMi : Registro de Usuario</title>
    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">
    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!=='dataLayer'?'&l='+l:'';j.async=true;j.src=
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
    <!-- Vendor -->
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
    <!-- Custom CSS -->
    <style>
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/fondo.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<!-- Content -->
<div class="container-xxl">
    <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
            <!-- Register Card -->
            <div class="card">
                <div class="card-body">
                    <!-- Logo -->
                    <div class="app-brand justify-content-center">
                        <a href="index.jsp" class="app-brand-link gap-2">
                            <img class="img-fluid w-20" src="${pageContext.request.contextPath}/assets/img/illustrations/logo-sanmiguel-retocado.jpg" alt="logo-sanmiguel">
                            <span class="app-brand-text demo text-body fw-bold">SanMI</span>
                        </a>
                    </div>
                    <!-- /Logo -->
                    <h4 class="mb-2">Registro de Usuario 📝</h4>
                    <p class="mb-4">Por favor, ingresa la información necesaria para el registro de usuario</p>



                    <form id="formAuthentication" class="mb-3" action="${pageContext.request.contextPath}/ServletSistema?action=insertarUsuario" method="POST">
                        <div class="content-header mb-3">
                            <h5 class="mb-1">Información de Ingreso</h5>
                            <span>Ingresa tus credenciales de ingreso</span>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Correo (Gmail)</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Ingresa tu correo" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
                        </div>
                        <div class="content-header mb-3">
                            <h5 class="mb-1">Información personal</h5>
                            <span>Ingresa tu información personal</span>
                        </div>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label class="form-label" for="Nombre">Nombres</label>
                                <input type="text" id="Nombre" name="Nombre" class="form-control" placeholder="Ingrese sus nombres" value="<%= request.getParameter("Nombre") != null ? request.getParameter("Nombre") : "" %>" required />
                            </div>
                            <div class="col-md-12">
                                <label class="form-label" for="Apellido">Apellidos</label>
                                <input type="text" id="Apellido" name="Apellido" class="form-control" placeholder="Ingrese sus apellidos" value="<%= request.getParameter("Apellido") != null ? request.getParameter("Apellido") : "" %>" required />
                            </div>
                            <div class="col-md-12">
                                <label class="form-label" for="Genero">Género</label>
                                <select id="Genero" name="Genero" class="select2 form-select" data-allow-clear="true" required>
                                    <option value="">Select</option>
                                    <option value="1">Masculino</option>
                                    <option value="2">Femenino</option>
                                    <option value="3">Otro</option>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label" for="Telefono">N° de celular</label>
                                <div class="input-group input-group-merge">
                                    <span class="input-group-text">PE (+51)</span>
                                    <input type="text" id="Telefono" name="Telefono" class="form-control multi-steps-mobile" placeholder="999 999 999" maxlength="9" value="<%= request.getParameter("Telefono") != null ? request.getParameter("Telefono") : "" %>" required />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label" for="DNI">DNI</label>
                                <input type="text" id="DNI" name="DNI" class="form-control multi-steps-pincode" placeholder="Ingrese su número de DNI" maxlength="8" value="<%= request.getParameter("DNI") != null ? request.getParameter("DNI") : "" %>" required />
                            </div>
                            <div class="col-md-12">
                                <label class="form-label" for="Direccion">Dirección</label>
                                <input type="text" id="Direccion" name="Direccion" class="form-control" placeholder="Ingrese su domicilio" value="<%= request.getParameter("Direccion") != null ? request.getParameter("Direccion") : "" %>" required />
                            </div>
                            <div class="col-sm-12">
                                <label class="form-label" for="IDUrbanizacion">Urbanización</label>
                                <select id="IDUrbanizacion" name="IDUrbanizacion" class="select2 form-select" data-allow-clear="true" required>
                                    <option value="">Select</option>
                                    <option value="1">Maranga</option>
                                    <option value="2">Pando</option>
                                    <option value="3">Miramar</option>
                                    <option value="4">San Miguelito</option>
                                    <option value="5">Elio</option>
                                    <option value="6">Bertolotto</option>
                                    <option value="7">La Perla</option>
                                    <option value="8">San Antonio</option>
                                    <option value="9">Santa Patricia</option>
                                    <option value="10">Residencial San Felipe</option>
                                    <option value="11">Cueva</option>
                                    <option value="12">Las Brisas</option>
                                    <option value="13">Las Leyendas</option>
                                    <option value="14">Parque de las Leyendas</option>
                                    <option value="15">San José</option>
                                    <option value="16">Los Cipreses</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-primary d-grid w-100">
                            Registrar
                        </button>
                    </form>
                    <!-- Mensaje de error -->
                    <% if (request.getAttribute("errorMsg") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMsg") %>
                    </div>
                    <% } %>
                    <p class="text-center">
                        <span>¿Tienes una cuenta ya creada?</span>
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            <span>Ingresar</span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/auto-focus.js"></script>
<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/pages-auth.js"></script>
</body>
</html>