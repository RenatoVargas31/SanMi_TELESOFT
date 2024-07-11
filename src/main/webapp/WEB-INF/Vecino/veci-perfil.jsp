<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.sanmi_telesoft.beans.Usuario" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    Usuario usuario = (Usuario) session1.getAttribute("usuario");
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
                                    <%if(usuario.getGenero()==1){%>
                                        <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/male.png" alt="user image" class="d-block h-auto ms-0 ms-sm-4 rounded user-profile-img">
                                        </div>
                                    <% } else if (usuario.getGenero()==2) { %>
                                        <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/female.png" alt="user image" class="d-block h-auto ms-0 ms-sm-4 rounded user-profile-img">
                                        </div>
                                    <%} else { %>
                                        <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                            <img src="${pageContext.request.contextPath}/assets/img/avatars/24.png" alt="user image" class="d-block h-auto ms-0 ms-sm-4 rounded user-profile-img">
                                        </div>
                                    <%} %>
                                        <div class="flex-grow-1 mt-3 mt-sm-5">
                                        <div class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-4 flex-md-row flex-column gap-4">
                                            <div class="user-profile-info">
                                                <h4><%= usuario.getNombreUsuario()%> <%=usuario.getApellidoUsuario()%></h4>
                                                <ul class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-2">
                                                    <li class="list-inline-item fw-medium">
                                                        <i class='bx bx-pen'></i> Vecino Sanmiguelino
                                                    </li>
                                                    <li class="list-inline-item fw-medium">
                                                        <i class='bx bx-map'></i> <%=usuario.getDireccionUsuario()%>
                                                    </li>
                                                    <li class="list-inline-item fw-medium">
                                                        <i class='bx bx-calendar-alt'></i> <%=usuario.getNacimientoDate()%>
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
                                    <form action="ServletCord" method="post">
                                        <input type="hidden" name="action" value="updateProfile">
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
                                                <label class="form-label" for="phoneNumber">Teléfono</label>
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text">PE (+51)</span>
                                                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<%= usuario.getTelefonoUsuario() %>">
                                                </div>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="direccion">Dirección</label>
                                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%= usuario.getDireccionUsuario() %>">
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="dni">DNI</label>
                                                <p class="form-control-plaintext" id="dni"><%= usuario.getDniUsuario() %></p>
                                            </div>
                                            <% if (usuario.getIdTipoCoordinadora() == 1) { %>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba1">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba1">Maranga</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==2){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba2">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba2">Pando</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==3){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba3">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba3">Miramar</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==4){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba4">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba4">San Miguelito</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==5){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba5">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba5">Elio</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==6){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba6">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba6">Bertolotto</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==7){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba7">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba7">La Perla</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==8){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba8">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba8">San Antonio</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==9){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba9">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba9">Santa Patricia</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==10){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba10">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba10">Residencial San Felipe</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==11){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba11">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba11">Cueva</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==12){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba12">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba12">Las Brisas</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==13){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba13">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba13">Las Leyendas</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==14){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba14">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba14">Parque de las Leyendas</p>
                                            </div>
                                            <%} else if (usuario.getIdUrbanizacion()==15){%>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba15">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba15">San José</p>
                                            </div>
                                            <%} else { %>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="Urba16">Urbanización</label>
                                                <p class="form-control-plaintext" id="Urba16">Los Cipreses</p>
                                            </div>
                                            <%} %>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="correo">Correo</label>
                                                <p class="form-control-plaintext" id="correo"><%=usuario.getCorreoUsuario()%></p>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Actualizar</button>
                                    </form>

                                    <% if (request.getAttribute("errorMessage") != null) { %>
                                    <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
                                    <% } %>

                                    <% if (request.getAttribute("successMessage") != null) { %>
                                    <div class="alert alert-success"><%= request.getAttribute("successMessage") %></div>
                                    <% } %>

                                </div>
                                <!-- /Account -->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- / Content -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- / Content wrapper -->
        </div>
        <!-- / Layout container -->
    </div>
    <!-- / Layout wrapper -->
</div>

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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/auto-focus.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/pages-account-settings-account.js"></script>
</body>
</html>