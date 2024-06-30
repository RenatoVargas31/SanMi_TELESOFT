<%@ page import="com.example.sanmi_telesoft.beans.Evento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ArrayList<Evento>lista=(ArrayList<Evento>) request.getAttribute("listarEventos");
%>





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


<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>SanMi | Lista de Eventos</title>


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
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap"
          rel="stylesheet">
    <!-- Icons -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/theme-semi-dark.css"  class="template-customizer-theme-css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />

    <!-- Page CSS -->

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />

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



            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">



                    <div class="app-academy">
                        <div class="card p-0 mb-4" id="event-content">
                            <div class="card-body d-flex flex-column flex-md-row justify-content-between p-0 pt-4">
                                <div class="app-academy-md-25 card-body py-0">
                                    <img src="${pageContext.request.contextPath}/assets/img/illustrations/bulb-light.png" height="150" class="scaleX-n1-rtl" alt="Bulb in hand" data-app-light-img="illustrations/bulb-light.png" data-app-dark-img="illustrations/bulb-dark.png" />
                                </div>
                                <div class="app-academy-md-50 card-body d-flex align-items-md-center flex-column text-md-center">
                                    <h3 class="card-title mb-4 lh-sm px-md-5 text-center">
                                        Los eventos más esperados en San Miguel
                                        <span class="text-primary fw-medium text-nowrap"> están en tus manos</span>.
                                    </h3>
                                    <form method="post" action="<%=request.getContextPath()%>/ServletVecino?action=buscarEventos">
                                        <div class="d-flex align-items-center justify-content-between app-academy-md-80">
                                            <input type="search" placeholder="Busca tu evento" name="textoBuscar" id="floatingInput" class="form-control me-2" />
                                            <button type="submit" class="btn btn-primary btn-icon"><i class="bx bx-search"></i></button>
                                            <input type="hidden" name="tipoFiltrado" id="hiddenTipoFiltrado">
                                        </div>

                                    </form>

                                </div>
                                <div class="app-academy-md-25 d-flex align-items-end justify-content-end">
                                    <img src="${pageContext.request.contextPath}/assets/img/illustrations/pencil-rocket.png" alt="pencil rocket" height="188" class="scaleX-n1-rtl" />
                                </div>
                            </div>
                        </div>
                        <%
                            // Obtener el mensaje de la sesión y eliminarlo después de mostrarlo
                            String mensaje = (String) request.getSession().getAttribute("info");
                            if (mensaje != null && !mensaje.isEmpty()) {
                        %>

                    <div class="alert alert-success" style="background-color: rgba(183,255,184,0.78);color: #000000; font-weight: bold" role ="alert">
                            <%= mensaje %>
                        </div>
                        <%
                            // Eliminar el mensaje de la sesión después de mostrarlo
                            request.getSession().removeAttribute("info");
                        %>
                        <% } %>
                        <div class="card mb-4">
                            <div class="card-header d-flex flex-wrap justify-content-between gap-3">
                                <div class="card-title mb-0 me-1">
                                    <h5 class="mb-1" style="font-size: 30px;color:#000000; font-weight: bold">Todos los eventos</h5>
                                </div>
                            <div class="d-flex justify-content-md-end align-items-center gap-3 flex-wrap">
                                <form id="filtroForm" method="post" action="<%=request.getContextPath()%>/ServletVecino?action=listaEventos">
                                        <select id="tipoFiltrado" name="tipoFiltrado" class="select2 form-select" data-placeholder="Filtrar por:">
                                            <option value="Todo" >Todo</option>
                                            <option value="Deporte">Deporte</option>
                                            <option value="Cultura">Cultura</option>
                                        </select>

                                </form>
                            </div>
                            </div>

                            <div class="card-body">
                                <% int i = 0; %>

                                <% for (Evento evento : lista) { %>
                                <% if (i % 3 == 0) { %>
                                <div class="row gy-4 mb-4">
                                    <% } %>

                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border" data-value="<%= evento.getTipoEvento() %>">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento.getIdEventos() %>">
                                                    <img style="height: 200px; width: 390px; border-radius: 10px;" class="img-fluid" src="${pageContext.request.contextPath}/assets/img/events/evento1.jpg" alt="Imagen del evento">
                                                </a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <% if (evento.getTipoEvento().getNameTipo().equals("Deporte")) { %>
                                                    <span class="badge bg-label-hover-success">Deporte</span>
                                                    <% } %>
                                                    <% if (evento.getTipoEvento().getNameTipo().equals("Cultura")) { %>
                                                    <span class="badge bg-label-warning">Cultura</span>
                                                    <% } %>

                                                </div>
                                                <a href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento.getIdEventos() %>" class="h5"><%= evento.getNombreEvento() %></a>
                                                <p class="mt-2"><%= evento.getDescriptionEvento() %></p>
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">
                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center" href="<%=request.getContextPath()%>/ServletVecino?action=viewEvento&id=<%= evento.getIdEventos() %>">
                                                        <span class="me-2">Inscríbete aquí</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <% if ((i + 1) % 3 == 0 || i == lista.size() - 1) { %>
                                </div> <!-- Cierre del div.row -->
                                <% } %>

                                <% i++; %>
                                <% } %>



                            </div>
                                </div>
                            </div>
                        </div>


                <%
                    int pag = (int) request.getAttribute("currentPage");
                    int sizeArray = (int) request.getAttribute("total");
                    //Elementos por página.
                    int maxPag = ((sizeArray) / 9) + 1;
                    //Aquí hago una operación para obtener el número de registro del que inicia.
                    int regMin = (pag - 1) * 9;
                    //Aquí hago una operación para obtener el número de registros máximos para mostrar en esa página.
                    //Esto con el fin, de recorrer el arreglo desde el registro mínimo hasta el registro máximo.
                    int regMax = pag * 9;
                %>


                <nav aria-label="Page navigation" class="d-flex align-items-center justify-content-center">
                    <ul class="pagination">
                        <% if(maxPag >= 1){
                            if(pag != 1) {%>
                        <li class="page-item prev">
                            <a class="page-link" href="<%=request.getContextPath()%>/ServletVecino?action=listaEventos&pg=<%= pag - 1 %>"><i
                                    class="tf-icon bx bx-chevron-left"></i></a>
                        </li>
                        <% } %>
                        <% for (int j= 1; j <= maxPag; j++){ %>
                        <li class="page-item <% if (j == pag) {%> active <% } %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/ServletVecino?action=listaEventos&pg=<%= j %>"><%= j %> </a>
                        </li>
                        <% } %>

                        <% if(pag != maxPag) {%>
                        <li class="page-item next">
                            <a class="page-link" href="<%=request.getContextPath()%>/ServletVecino?action=listaEventos&pg=<%= pag + 1 %>"><i
                                    class="tf-icon bx bx-chevron-right"></i></a>
                        </li>
                        <% }
                        } else {%>
                        <li class="page-item active ">
                            <a class="page-link" href="<%=request.getContextPath()%>/ServletVecino?action=listaEventos&pg=<%= pag %>"> 1 </a>
                        </li>
                        <% } %>

                    </ul>
                </nav>
                    </div>
                </div>
    </div>
</div>


                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                //Script para el filtro
                                document.getElementById('tipoFiltrado').addEventListener('change', function() {
                                    // Guardar el valor seleccionado en el localStorage
                                    localStorage.setItem('selectedTipoFiltrado', this.value);
                                    // Enviar el formulario de filtro cuando cambia la selección
                                    document.getElementById('filtroForm').submit();
                                });

                                window.addEventListener('load', function() {
                                    var tipoFiltradoSelect = document.getElementById('tipoFiltrado');
                                    var selectedValue = localStorage.getItem('selectedTipoFiltrado');

                                    // Si hay un valor seleccionado guardado, establecerlo en el select
                                    if (selectedValue) {
                                        tipoFiltradoSelect.value = selectedValue;
                                    }

                                    // Sincronizar el valor del select con el campo oculto del formulario de búsqueda
                                    document.getElementById('hiddenTipoFiltrado').value = tipoFiltradoSelect.value;

                                    // Guardar el valor seleccionado en el localStorage al cambiar la selección
                                    tipoFiltradoSelect.addEventListener('change', function() {
                                        localStorage.setItem('selectedTipoFiltrado', tipoFiltradoSelect.value);
                                        document.getElementById('hiddenTipoFiltrado').value = tipoFiltradoSelect.value;
                                    });
                                });




                                document.write(new Date().getFullYear())




                            </script>
                            <a>© Telesoft</a>
                        </div>

                    </div>
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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

<!-- endbuild -->

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>

</div>
</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-academy-course.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:14:35 GMT -->
</html>

<!-- beautify ignore:end -->

