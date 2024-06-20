<%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 12/06/2024
  Time: 15:02
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

    <title>Administrador: Personal de Serenazgo de Campo</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />


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
                                <h3 class="m-4 fw-bold">Lista de Personal de Serenazgo de Campo</h3>

                                <button type="button" class="btn btn-primary me-3 ">
                                    <i class='bx bx-shield-plus me-2'></i>
                                    <a href="adm-generacionSerenazgo.html"><h2 style="color: white;font-size:15px; margin-bottom: 0px">Nuevo Personal</h2></a>
                                </button>
                            </div>
                            <table id="table-personalSerenazgoDeCampo" class="datatables-basic table border-top">
                                <thead>
                                <tr>

                                    <th>Nombre Y apellido</th>
                                    <th>Telefono</th>
                                    <th>Tipo</th>
                                    <th>Turno</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>

                                <!-- Modal -->
                                <div class="modal fade" id="editUser" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                        <div class="modal-content p-3 p-md-5">
                                            <div class="modal-body">
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                <div class="text-center mb-4">
                                                    <h3>Editar Estado de la Incidencia</h3>
                                                    <p>Por favor colocar las medidas a tomar según la incidencia.</p>
                                                </div>
                                                <form id="editUserForm" class="row g-3" onsubmit="return false">

                                                    <div class="col-12">
                                                        <label class="form-label" >Escribir una breve respuesta de las medidas a tomar</label>
                                                        <textarea class="form-control" id="basic-default-bio" name="basic-default-bio" rows="3" required></textarea>
                                                    </div>

                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="modalEditUserStatus">Seleccione la ayuda a solicitar</label>
                                                        <select id="modalEditUserStatus" name="modalEditUserStatus" class="form-select" aria-label="Default select example">
                                                            <option selected>Seleccionar</option>
                                                            <option value="1">Ambulancia</option>
                                                            <option value="2">Bombero</option>
                                                            <option value="3">Policia</option>

                                                        </select>
                                                    </div>

                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="modalEditUserStatus">Editar Estado de Incidencia</label>
                                                        <select id="modalEditUserStatus1" name="modalEditUserStatus" class="form-select" aria-label="Default select example">
                                                            <option selected>Seleccionar</option>
                                                            <option value="1">En Proceso</option>
                                                            <option value="2">Cerrada</option>
                                                            <option value="3">Falsa Alarma</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="modalEditUserStatus">Seleccione la prioridad</label>
                                                        <select id="modalEditUserStatus2" name="modalEditUserStatus" class="form-select" aria-label="Default select example">
                                                            <option selected>Seleccionar</option>
                                                            <option value="1">Alta</option>
                                                            <option value="2">Media</option>
                                                            <option value="3">Baja</option>

                                                        </select>
                                                    </div>



                                                    <div style="margin-top: 20px" class="col-12 text-center" >
                                                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Actualizar Estado</button>
                                                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="modalVerUsuario" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle1">Detalles del Usuario</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">

                                                <p>Nombre de Usuario: Arturo Martinez Lara</p>

                                                <p>Correo: art.mart@gmail.com </p>

                                                <p>DNI: 87422011</p>

                                                <p>Dirección: Jr Las Magnolias 166</p>

                                                <p>Teléfono: 992130132</p>

                                                <p>Nacimiento: 13/05/1989</p>

                                                <p>Urbanización: San Miguelito</p>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Modal -->


                                <!-- Modal de eliminación y confirmación -->



                                <div class="modal fade" id="modalToggle" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalToggleLabel">Eliminar de la Lista</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <b> ¿Eliminar este elemento? </b>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-primary" data-bs-target="#modalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Si</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalToggle2" aria-hidden="true" aria-labelledby="modalToggleLabel2" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalToggleLabel2">Eliminar de la lista</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <b> ¿Está seguro? </b>
                                            </div>
                                            <div class="modal-footer">

                                                <button type="reset" class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal">Si</button>

                                                <!-- <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button> -->

                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <tbody>
                                <tr>

                                    <td>Arturo Martinez Lara</td>
                                    <td>Dispatcher</td>
                                    <td><span>-</span></td>
                                    <td>Nocturno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalVerUsuario"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button" class="btn btn-icon btn-icon-only btn-label-primary btn-sm " data-bs-toggle="modal" data-bs-target="#editarPersonal">
                                            <i class='bx bx-edit'></i>
                                        </button>

                                        <!--Nuevo boton implementado -->


                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modalToggle"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>José García López</td>
                                    <td>Serenazgo</td>
                                    <td><span>A pie</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="window.location.href='vecino-ActualizarIncidencia.html';"  data-bs-target="#modal-editar-incidencia"><i
                                                class='bx bx-edit'></i></button>

                                        <!--Nuevo boton implementado -->


                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modalToggle"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Sofía Martínez Valdez</td>
                                    <td>Serenazgo</td>
                                    <td><span>Bicicleta</span></td>
                                    <td>Nocturno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Vehículo</span></td>
                                    <td>Nocturno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Canino</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Dispatcher</td>
                                    <td><span>-</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>A pie</span></td>
                                    <td>Nocturno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Canino</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Bicicleta</span></td>
                                    <td>Nocturno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Vehículo</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Canino</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>A pie</span></td>
                                    <td>Nocturno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Vehículo</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>Canino</span></td>
                                    <td>Nocturno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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
                                    <td>Serenazgo</td>
                                    <td><span>A pie</span></td>
                                    <td>Diurno</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i
                                                class='bx bx-show'></i></button>
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

                <!-- Modal Agregado-->

                <script src="${pageContext.request.contextPath}/assets/js/ui-modals.js"></script>



            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addNewAddress" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-add-new-address">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="text-center mb-4">
                    <h3 class="address-title fw-bold">Registrar Personal</h3>
                </div>
                <form id="addNewAddressForm" class="row g-3" onsubmit="return false">

                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalAddressFirstName">Nombre</label>
                        <input type="text" id="modalAddressFirstName" name="modalAddressFirstName" class="form-control" placeholder="John" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalAddressLastName">Apellidos</label>
                        <input type="text" id="modalAddressLastName" name="modalAddressLastName" class="form-control" placeholder="Doe" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalDNI">DNI</label>
                        <input type="text" id="modalDNI" name="modalDNI" class="form-control" placeholder="99950" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalTipo">Tipo</label>
                        <select id="modalTipo" name="modalTipo" class="select2 form-select" data-allow-clear="true">
                            <option value="">Select</option>
                            <option value="Bicicleta">Bicicleta</option>
                            <option value="A pie">A pie</option>
                            <option value="Canino">Canino</option>
                            <option value="Vehículo">Vehículo</option>
                        </select>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalTelefono">Teléfono</label>
                        <input type="text" id="modalTelefono" name="modalTelefono" class="form-control" placeholder="99950" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalTurno">Turno</label>
                        <select id="modalTurno" name="modalTurno" class="select2 form-select" data-allow-clear="true">
                            <option value="">Select</option>
                            <option value="Diurno">Diurno</option>
                            <option value="Nocturno">Nocturno</option>
                        </select>
                    </div>
                    <div class="col-12 ">
                        <label class="form-label" for="modalMail">Correo Electrónico</label>
                        <input type="text" id="modalMail" name="modalMail" class="form-control" placeholder="jhonDoe@gmail.com" />
                    </div>
                    <div class="col-12 ">
                        <label class="form-label" for="modalDireccion">Dirección</label>
                        <input type="text" id="modalDireccion" name="modalDireccion" class="form-control" placeholder="12, Business Park" />
                    </div>

                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Registrar</button>
                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var e = $(".select2");
        e.length && e.each(function () {
            var e = $(this);
            e.wrap('<div class="position-relative"></div>').select2({
                placeholder: "Seleccione",
                dropdownParent: e.parent()
            })
        })
    }), document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("addNewAddress").addEventListener("show.bs.modal", function (e) {
            window.Helpers.initCustomOptionCheck()
        }), FormValidation.formValidation(document.getElementById("addNewAddressForm"), {
            fields: {
                modalAddressFirstName: {
                    validators: {
                        notEmpty: {message: "Please enter your first name"},
                        regexp: {regexp: /^[a-zA-Zs]+$/, message: "The first name can only consist of alphabetical"}
                    }
                },
                modalAddressLastName: {
                    validators: {
                        notEmpty: {message: "Please enter your last name"},
                        regexp: {regexp: /^[a-zA-Zs]+$/, message: "The last name can only consist of alphabetical"}
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({eleValidClass: "", rowSelector: ".col-12"}),
                submitButton: new FormValidation.plugins.SubmitButton,
                autoFocus: new FormValidation.plugins.AutoFocus
            }
        })
    });
</script>
<div class="modal fade" id="editarPersonal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-add-new-address">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="text-center mb-4">
                    <h3 class="address-title fw-bold">Editar Personal</h3>
                </div>
                <form id="editarPersonalForm" class="row g-3" onsubmit="return false">

                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalAddressFirstName">Nombre</label>
                        <input type="text" id="modalPersonalFirstName" name="modalAddressFirstName" class="form-control" value="Arturo" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalAddressLastName">Apellidos</label>
                        <input type="text" id="modalPersonalLastName" name="modalAddressLastName" class="form-control" value="Martinez Lara" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalDNI">DNI</label>
                        <input type="text" id="modalPersonalDNI" name="modalDNI" class="form-control" value="87422011" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalTipo">Tipo</label>
                        <select id="modalPersonalTipo" name="modalTipo" class="select2 form-select" data-allow-clear="true">
                            <option value="Valor actual">-</option>
                            <option value="Bicicleta">Bicicleta</option>
                            <option value="A pie">A pie</option>
                            <option value="Canino">Canino</option>
                            <option value="Vehículo">Vehículo</option>
                        </select>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalTelefono">Teléfono</label>
                        <input type="text" id="modalPesonalTelefono" name="modalTelefono" class="form-control" value="992130132" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalTurno">Turno</label>
                        <select id="modalPersonalTurno" name="modalTurno" class="select2 form-select" data-allow-clear="true">
                            <option value="Valor actual">Nocturno</option>
                            <option value="Diurno">Diurno</option>
                            <option value="Nocturno">Nocturno</option>
                        </select>
                    </div>
                    <div class="col-12 ">
                        <label class="form-label" for="modalMail">Correo Electrónico</label>
                        <input type="text" id="modalPersonalMail" name="modalMail" class="form-control" value="art.mart@gmail.com" />
                    </div>
                    <div class="col-12 ">
                        <label class="form-label" for="modalDireccion">Dirección</label>
                        <input type="text" id="modalPersonalDireccion" name="modalDireccion" class="form-control" value="Jr Las Magnolias 166" />
                    </div>

                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Guardar</button>
                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var e = $(".select2");
        e.length && e.each(function () {
            var e = $(this);
            e.wrap('<div class="position-relative"></div>').select2({
                placeholder: "Seleccione",
                dropdownParent: e.parent()
            })
        })
    }), document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("editarPersonal").addEventListener("show.bs.modal", function (e) {
            window.Helpers.initCustomOptionCheck()
        }), FormValidation.formValidation(document.getElementById("editarPersonalForm"), {

            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({eleValidClass: "", rowSelector: ".col-12"}),
                submitButton: new FormValidation.plugins.SubmitButton,
                autoFocus: new FormValidation.plugins.AutoFocus
            }
        })
    });
</script>
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
