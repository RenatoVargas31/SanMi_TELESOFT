<%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 15/06/2024
  Time: 01:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:08 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>Administrador: Usuarios Baneados</title>


    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />


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

                    <!-- DataTable with Buttons -->
                    <div class="card">
                        <div class="card-datatable table-responsive">
                            <div class="d-flex justify-content-between align-items-center">
                                <h3 class="m-4 fw-bold">Lista de Usuarios Baneados</h3>
                            </div>
                            <table id="table-usuariosBaneados" class="datatables-basic table border-top">
                                <thead>
                                <tr>

                                    <th>Nombre y Apellido</th>
                                    <th>Rol</th>
                                    <th>Motivo</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>

                                    <td>Arturo Martinez Lara</td>
                                    <td>Vecino</td>
                                    <td><span>Cambio de Localidad</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                onclick="promptDeletion();" id="confirm-color"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>José García López</td>
                                    <td>Vecino</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Sofía Martínez Valdez</td>
                                    <td>Coordinadora - Deporte</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Alejandro García Sánchez</td>
                                    <td>Vecino</td>
                                    <td><span>Cambio de localidad</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Valentina Rodríguez Reyes</td>
                                    <td>Coordinadora - Cultura</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Juan López Ramírez</td>
                                    <td>Vecino</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Isabella Pérez Gómez</td>
                                    <td>Vecino</td>
                                    <td><span>Cambio de Localidad</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Diego Hernández Flores</td>
                                    <td>Vecino</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Camila Díaz Mendoza</td>
                                    <td>Vecino</td>
                                    <td><span>Cambio de Localidad</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Lucas González Cruz</td>
                                    <td>Vecino</td>
                                    <td><span>Cambio de Localidad</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Emma Vázquez Morales</td>
                                    <td>Vecino</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Mateo Torres Ortiz</td>
                                    <td>Vecino</td>
                                    <td><span>Cambio de Localidad</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Victoria Ruiz Vega</td>
                                    <td>Vecino</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Nicolás Castro Jiménez</td>
                                    <td>Vecino</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Olivia Herrera Silva</td>
                                    <td>Vecino</td>
                                    <td><span>Cumplio el máximo de reportes falsos</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- Modal to add new record -->
                    <div class="offcanvas offcanvas-end" id="add-new-record">
                        <div class="offcanvas-header border-bottom">
                            <h5 class="offcanvas-title" id="exampleModalLabel">New Record</h5>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                    aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body flex-grow-1">
                            <form class="add-new-record pt-0 row g-2" id="form-add-new-record" onsubmit="return false">
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicFullname">Full Name</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicFullname2" class="input-group-text"><i
                                                class="bx bx-user"></i></span>
                                        <input type="text" id="basicFullname" class="form-control dt-full-name"
                                               name="basicFullname" placeholder="John Doe" aria-label="John Doe"
                                               aria-describedby="basicFullname2"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicPost">Post</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicPost2" class="input-group-text"><i class='bx bxs-briefcase'></i></span>
                                        <input type="text" id="basicPost" name="basicPost" class="form-control dt-post"
                                               placeholder="Web Developer" aria-label="Web Developer"
                                               aria-describedby="basicPost2"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicEmail">Email</label>
                                    <div class="input-group input-group-merge">
                                        <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                                        <input type="text" id="basicEmail" name="basicEmail"
                                               class="form-control dt-email" placeholder="john.doe@example.com"
                                               aria-label="john.doe@example.com"/>
                                    </div>
                                    <div class="form-text">
                                        You can use letters, numbers & periods
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicDate">Joining Date</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicDate2" class="input-group-text"><i
                                                class='bx bx-calendar'></i></span>
                                        <input type="text" class="form-control dt-date" id="basicDate" name="basicDate"
                                               aria-describedby="basicDate2" placeholder="MM/DD/YYYY"
                                               aria-label="MM/DD/YYYY"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="form-label" for="basicSalary">Salary</label>
                                    <div class="input-group input-group-merge">
                                        <span id="basicSalary2" class="input-group-text"><i
                                                class='bx bx-dollar'></i></span>
                                        <input type="number" id="basicSalary" name="basicSalary"
                                               class="form-control dt-salary" placeholder="12000" aria-label="12000"
                                               aria-describedby="basicSalary2"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary data-submit me-sm-3 me-1">Submit
                                    </button>
                                    <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="offcanvas">
                                        Cancel
                                    </button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
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
                <script src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
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
        </div>
    </div>
</div>
<div class="modal fade" id="deletionModal" tabindex="-1" aria-labelledby="deletionModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletionModalLabel">Confirmar Eliminación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de que deseas eliminar este elemento?</p>
                <div class="mb-3">
                    <label for="deleteReason" class="form-label">Motivo de la eliminación:</label>
                    <input type="text" class="form-control" id="deleteReason" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" onclick="submitDeletion()">Eliminar</button>
            </div>
        </div>
    </div>
</div>
<script>
    function closeModal() {
        const modal = document.getElementById('deletionModal');
        modal.style.display = 'none'; // Oculta el modal
    }
    function promptDeletion() {
        var myModal = new bootstrap.Modal(document.getElementById('deletionModal'));
        myModal.show(); // This is the correct way to show a mod
    }



    function submitDeletion() {
        const reason = document.getElementById('deleteReason').value;
        if (reason === '') {
            alert('Por favor, ingrese un motivo para la eliminación.');
            return;
        }

        if (confirm('¿Está seguro de que desea eliminar esta incidencia?')) {
            console.log('Motivo:', reason); // Aquí deberías enviar el motivo a la base de datos
            alert('La incidencia ha sido eliminada correctamente.');
            closeModal();
            // Aquí deberías implementar la lógica para eliminar la fila del servidor/base de datos
        }
    }

</script>
</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:09 GMT -->
</html>