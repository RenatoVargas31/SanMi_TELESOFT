<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.sanmi_telesoft.beans.Usuario" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>

<%
    HttpSession session1 = request.getSession(false);
    Usuario usuario = (Usuario) session1.getAttribute("usuario");
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi | Perfil Vecino</title>

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
    <!-- Template customizer & Theme config files -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <!-- Config file -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

    <style>

        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .user-profile-header-banner img {
            width: 100%;
            height: 100px;
        }

        .user-profile-header {
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .user-profile-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
        }

        @media (min-width: 400px) {
            .user-profile-header {
                flex-direction: row;
                text-align: left;
            }

            .user-profile-img {
                margin-right: 1rem;
            }
        }
    </style>

    <script async defer src="https://buttons.github.io/buttons.js"></script>
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
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
                    <h3 class="address-title fw-bold">Perfil Vecino</h3>
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="user-profile-header-banner">
                                    <img src="${pageContext.request.contextPath}/assets/img/pages/profile-banner.png" alt="Banner image" class="rounded-top">
                                </div>
                                <div class="user-profile-header d-flex flex-column flex-sm-row text-sm-start text-center mb-4">
                                    <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                        <% if (usuario.getFotoPerfil() != null) { %>
                                        <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(usuario.getFotoPerfil()) %>" alt="user image" class="d-block h-auto ms-0 ms-sm-4 rounded user-profile-img">
                                        </div>
                                        <% } else { %>
                                        <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/<%= (usuario.getGenero() == 1) ? "male.png" : (usuario.getGenero() == 2) ? "female.png" : "default-avatar.png" %>" alt="user image" class="d-block h-auto ms-0 ms-sm-4 rounded user-profile-img">
                                        </div>
                                        <% } %>
                                        <div class="flex-grow-1 mt-3 mt-sm-5">
                                            <div class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-4 flex-md-row flex-column gap-4">
                                                <div class="user-profile-info">
                                                    <h4><%= usuario.getNombreUsuario() %> <%= usuario.getApellidoUsuario() %></h4>
                                                    <ul class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-2">
                                                        <li class="list-inline-item fw-medium">
                                                            <i class='bx bx-pen'></i> Vecino Sanmiguelino
                                                        </li>
                                                        <li class="list-inline-item fw-medium">
                                                            <i class='bx bx-map'></i> <%= usuario.getDireccionUsuario() %>
                                                        </li>
                                                        <li class="list-inline-item fw-medium">
                                                            <i class='bx bx-calendar-alt'></i> <%= usuario.getNacimientoDate() %>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card mb-4">
                                <h5 class="card-header">Detalles de Perfil</h5>
                                <!-- Account -->
                                <hr class="my-0">
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/ServletCord" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="action" value="updateProfile1">
                                        <input type="hidden" name="resetPhoto" id="resetPhoto" value="false">
                                        <div class="d-flex align-items-start align-items-sm-center gap-4">
                                            <% if (usuario.getFotoPerfil() != null) { %>
                                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(usuario.getFotoPerfil()) %>" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
                                            <% } else { %>
                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/<%= (usuario.getGenero() == 1) ? "male.png" : (usuario.getGenero() == 2) ? "female.png" : "default-avatar.png" %>" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
                                            <% } %>
                                            <div class="button-wrapper">
                                                <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                                    <span class="d-none d-sm-block">Subir Foto Nueva</span>
                                                    <i class="bx bx-upload d-block d-sm-none"></i>
                                                    <input type="file" id="upload" class="account-file-input" hidden accept="image/png, image/jpeg" name="profilePhoto" onchange="previewImage(event)">
                                                </label>
                                                <button type="button" class="btn btn-label-secondary mb-4" onclick="resetToDefault()">Resetear a Predeterminado</button>
                                                <p class="text-muted mb-0">Solo Formatos Permitidos JPG o PNG.</p>
                                            </div>
                                        </div>
                                        <hr class="my-0">
                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <label for="firstName" class="form-label">Nombres</label>
                                                <p class="form-control-plaintext" id="firstName"><%= usuario.getNombreUsuario() %></p>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="lastName" class="form-label">Apellidos</label>
                                                <p class="form-control-plaintext" id="lastName"><%= usuario.getApellidoUsuario() %></p>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="email" class="form-label">Correo Electrónico</label>
                                                <p class="form-control-plaintext" id="email"><%= usuario.getCorreoUsuario() %></p>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="phoneNumber" class="form-label">Teléfono</label>
                                                <input class="form-control" type="text" id="phoneNumber" name="phoneNumber" value="<%= usuario.getTelefonoUsuario() %>" required>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="direccion" class="form-label">Dirección</label>
                                                <input class="form-control" type="text" id="direccion" name="direccion" value="<%= usuario.getDireccionUsuario() %>" required>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="birthday" class="form-label">Fecha de Nacimiento</label>
                                                <p class="form-control-plaintext" id="birthday"><%= usuario.getNacimientoDate() %></p>
                                            </div>
                                        </div>
                                        <div class="mt-2">
                                            <button type="submit" class="btn btn-primary me-2">Guardar cambios</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /Account -->
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="card mb-4">
                                <h5 class="card-header">Cambiar Contraseña</h5>
                                <hr class="my-0">
                                <div class="card-body">
                                    <form action="ServletCord" method="post">
                                        <input type="hidden" name="action" value="changePassword">
                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <label for="currentPassword" class="form-label">Contraseña Actual</label>
                                                <input class="form-control" type="password" id="currentPassword" name="currentPassword" required>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="newPassword" class="form-label">Nueva Contraseña</label>
                                                <input class="form-control" type="password" id="newPassword" name="newPassword" required>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="confirmNewPassword" class="form-label">Confirmar Nueva Contraseña</label>
                                                <input class="form-control" type="password" id="confirmNewPassword" name="confirmNewPassword" required>
                                            </div>
                                        </div>
                                        <div class="mt-2">
                                            <button type="submit" class="btn btn-primary me-2">Cambiar Contraseña</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Mensajes de éxito y error -->
                    <% if (errorMessage != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                    <% } %>
                    <% if (successMessage != null) { %>
                    <div class="alert alert-success" role="alert">
                        <%= successMessage %>
                    </div>
                    <% } %>

                    <!-- / Content -->
                </div>
            </div>
            <!-- / Content wrapper -->
        </div>
        <!-- / Layout container -->
    </div>
</div>
<!-- / Layout wrapper -->

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var output = document.getElementById('uploadedAvatar');
            output.src = reader.result;
            document.getElementById('resetPhoto').value = "false";
        }
        reader.readAsDataURL(event.target.files[0]);
    }

    function resetToDefault() {
        document.getElementById('resetPhoto').value = "true";
        var output = document.getElementById('uploadedAvatar');
        <% if (usuario.getGenero() == 1) { %>
        output.src = "${pageContext.request.contextPath}/assets/img/avatars/male.png";
        <% } else if (usuario.getGenero() == 2) { %>
        output.src = "${pageContext.request.contextPath}/assets/img/avatars/female.png";
        <% } else { %>
        output.src = "${pageContext.request.contextPath}/assets/img/avatars/default-avatar.png";
        <% } %>
    }
</script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
</body>
</html>