<%--
  Created by IntelliJ IDEA.
  User: Sergio
  Date: 15/06/2024
  Time: 00:39
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

    <title>Dispatcher | Incidencias</title>


    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
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
                                <h3 class="m-4 fw-bold">Reporte de incidencias</h3>
                            </div>
                            <table id="serenazgo-table-incidencias" class="datatables-basic table border-top">
                                <thead>
                                <tr>
                                    <th>Incidencia</th>
                                    <th>Usuario</th>
                                    <th>Urbanizacion</th>
                                    <th>Estado</th>
                                    <th>Prioridad</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>


                                <!-- Editar Incd-->
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

                                <!--/ Editar Incd -->






                                <!-- Modal -->

                                <div class="modal fade" id="modalScrollable1" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle1">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">

                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me dirijo a ustedes con preocupación para informar sobre un accidente que está ocurriendo en este momento en la Calle 3 de San Borja. Soy Ana Duran, una vecina consternada por lo que está sucediendo en nuestra comunidad. </p>

                                                <p>Atentamente,</p>

                                                <p>Ana Duran.
                                                    Vecina de la Calle 3 - San Borja</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/accidente.jpeg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 3- San Borja.</p>
                                                        <p class="card-text">Referencia: 2 cuadras de Modo.</p>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <div class="modal fade" id="modalScrollable3" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle3">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me comunico con ustedes con gran preocupación para informar sobre un robo que está ocurriendo en este momento en la Calle 5 de San Miguel. Soy Carlos Paredes, un vecino consternado por lo que está sucediendo en nuestra comunidad.</p>

                                                <p>En este momento, mientras redacto este reporte, puedo ver desde mi ventana cómo individuos sospechosos están forzando la entrada a una vivienda cercana. Han roto la puerta principal y están saqueando el interior de la propiedad.</p>

                                                <p>Atentamente,</p>

                                                <p>Carlos Paredes.
                                                    Vecino de la Calle 5 - San Miguel</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/robo2.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 5- San Miguel.</p>
                                                        <p class="card-text">Referencia: 3 cuadras de Plaza San Miguel.</p>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalScrollable2" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle2">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me comunico con ustedes con urgencia para informar sobre un robo que está ocurriendo en este momento en la Calle 2 de Ingeniería. Soy Andrés Rivero, un vecino consternado por la situación que estamos enfrentando en nuestra comunidad. </p>

                                                <p>Al momento de redactar este reporte, puedo observar desde mi ventana cómo individuos desconocidos están intentando ingresar a una vivienda cercana. Han forzado la cerradura y están tratando de entrar a la propiedad. </p>

                                                <p>Atentamente,</p>

                                                <p>Andrés Rivero.
                                                    Vecino de la Calle 2 - Ingeniería</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/robo1.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 2- Ingenieria.</p>
                                                        <p class="card-text">Referencia: frente al parque de las Leyendas.</p>

                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalScrollable4" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle4">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me dirijo a ustedes con gran preocupación para informar sobre un incendio que está ocurriendo en este momento en la Calle 4 de La Marina. Soy Dina Boluarte, una vecina consternada por la situación que estamos enfrentando.</p>

                                                <p>Atentamente,</p>

                                                <p>Dina Boluarte. Vecina de la Calle 4 - La Marina</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/incendio1.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 4- La Marina.</p>
                                                        <p class="card-text">Referencia: Frente al Casino.</p>

                                                    </div>
                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalScrollable5" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalScrollableTitle5">Detalles del Reporte.</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Estimado Serenazgo de la Zona,</p>

                                                <p>Me dirijo a ustedes con gran urgencia para informar sobre un incendio que está ocurriendo en este momento en la Calle 1 de Villa del Mar. Soy Katiuska Quispe, una vecina preocupada por la seguridad de nuestra comunidad.</p>

                                                <p>Atentamente,</p>

                                                <p>Katiuska Quispe. Vecina de la Calle 1 - Villa del Mar</p>

                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/incendio2.jpg" alt="Card image cap" />
                                                    <div class="card-body">
                                                        <h5 class="card-title">Foto del reporte</h5>
                                                        <p class="card-text">Lugar: Calle 3- San Miguel.</p>
                                                        <p class="card-text">Referencia: 2 cuadras de Modo.</p>

                                                    </div>
                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <tbody>
                                <tr>
                                    <td>Incendio en la calle 1</td>
                                    <td>Katiuska Quispe</td>
                                    <td>Villa del mar</td>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <td><span class="badge bg-danger">Alta</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable5"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                onclick="promptDeletion();" id="confirm-color"><i
                                                class='bx bx-trash'></i></button>

                                    </td>
                                </tr>
                                <tr>
                                    <td>Robo en la calle 2</td>
                                    <td>Andres Rivero</td>
                                    <td>Ingeniería</td>
                                    <td><span class="badge bg-success">Resuelto</span></td>
                                    <td><span class="badge bg-warning">Media</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable2"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Accidente en la calle 3</td>
                                    <td>Ana Durán</td>
                                    <td>San Borja</td>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <td><span class="badge bg-danger">Alta</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable1"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Incendio en la calle 4</td>
                                    <td>Dina Boluarte</td>
                                    <td>La Marina</td>
                                    <td><span class="badge bg-success">Resuelto</span></td>
                                    <td><span class="badge bg-warning">Media</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable4"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
                                                class='bx bx-edit'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" onclick="promptDeletion();" data-bs-target="#modal-eliminar-incidencia"><i
                                                class='bx bx-trash'></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Robo en la calle 5</td>
                                    <td>Carlos Paredes</td>
                                    <td>San Miguel</td>
                                    <td><span class="badge bg-danger">Nueva</span></td>
                                    <td><span class="badge bg-danger">Alta</span></td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#modalScrollable3"><i
                                                class='bx bx-show'></i></button>
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editUser"><i
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
                    <!--/ DataTable with Buttons -->

                    <hr class="my-5">

                </div>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
                <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
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

                <!-- Modals pa la pagina -->
                <script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>

                <script src="${pageContext.request.contextPath}/assets/js/ui-modals.js"></script>
                <!-- Page JS -->
                <script src="${pageContext.request.contextPath}/assets/js/init-datatables.js"></script>

                <script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
                <script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>


            </div>
        </div>
    </div>
</div>


<!-- Modal Eliminación -->
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
                    <textarea type="text" class="form-control" id="deleteReason" required></textarea>
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