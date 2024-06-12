<%@ page import="com.example.sanmi_telesoft.beans.Profesor" %>
<%@ page import="java.util.ArrayList" %><%--

  User: rlvs_
  Date: 4/06/2024
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">



<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>Administrador: Instructores</title>


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


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />


    <!-- Row Group CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
    <!-- Form Validation -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css"/>

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
                                <h3 class="m-4 fw-bold">Lista de Instructores</h3>

                                <button type="button" class="btn btn-primary me-3 ">
                                    <i class='bx bx-chalkboard me-2'></i>
                                    <a href="<%=request.getContextPath()%>/ServletAdministrador?action=nuevoProfesor"><h2 style="color: white;font-size:15px; margin-bottom: 0px">Nuevo Instructor</h2></a>
                                </button>
                                <!-- Modal de registro -->
                                <div class="modal fade" id="addNewAddress" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-simple modal-add-new-address">
                                        <div class="modal-content p-3 p-md-5">
                                            <div class="modal-body">
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                <div class="text-center mb-4">
                                                    <h3 class="address-title fw-bold">Registrar Instructor</h3>
                                                </div>
                                                <form class="row g-3" method="post" action="<%=request.getContextPath()%>/ServletAdministrador?action=crearProfesor">

                                                    <div class="col-12">
                                                        <div class="row">
                                                            <div class="col-md mb-md-0 mb-3">
                                                                <div class="form-check custom-option custom-option-icon">
                                                                    <label class="form-check-label custom-option-content" for="customRadioHome">
                                                                        <span class="custom-option-body">
                                                                          <i class="bx bx-tennis-ball"></i>
                                                                          <span class="custom-option-title">Deporte</span>
                                                                        </span>
                                                                        <input name="tipoProfesor" class="form-check-input" type="radio" value="Deporte"/>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md mb-md-0 mb-3">
                                                                <div class="form-check custom-option custom-option-icon">
                                                                    <label class="form-check-label custom-option-content" for="customRadioOffice">
                                                                        <span class="custom-option-body">
                                                                          <i class='bx bxs-book-reader'></i>
                                                                          <span class="custom-option-title"> Cultura </span>
                                                                        </span>
                                                                        <input name="tipoProfesor" class="form-check-input" type="radio" value="Cultura"/>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="nombreProfesor">Nombre</label>
                                                        <input type="text" id="nombreProfesor" name="nombreProfesor" class="form-control" placeholder="Nombre" />
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="apellidoProfesor">Apellidos</label>
                                                        <input type="text" id="apellidoProfesor" name="apellidoProfesor" class="form-control" placeholder="Apellido" />
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="dniProfesor">DNI</label>
                                                        <input type="text" id="dniProfesor" name="dniProfesor" class="form-control" placeholder="DNI (8 dígitos)" />
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label" for="cursoProfesor">Curso</label>
                                                        <input type="text" id="cursoProfesor" name="cursoProfesor" class="form-control" placeholder="Curso a dictar" />
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Registrar</button>
                                                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table id="table-personalSerenazgo" class="datatables-basic table border-top">
                                <thead>
                                <tr>

                                    <th>Nombre Y apellido</th>
                                    <th>Tipo</th>
                                    <th>DNI</th>
                                    <th>Curso</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <%
                                    ArrayList<Profesor> listaProfesores = (ArrayList<Profesor>) request.getAttribute("listaProfesores");
                                %>

                                <tbody>
                                <%for (Profesor profesor : listaProfesores) {%>
                                <tr>
                                    <td><%= profesor.getNombreProfesor() %> <%= profesor.getApellidoProfesor() %></td>
                                    <td><%= profesor.getTipoProfesor() %></td>
                                    <td><%= profesor.getDniProfesor() %></td>
                                    <td><%= profesor.getCursoProfesor()%></td>
                                    <td>
                                        <a type="button" class="btn btn-icon btn-icon-only btn-label-primary btn-sm " href="<%=request.getContextPath()%>/ServletAdministrador?action=actualizarProfesor&id=<%= profesor.getIdProfesores() %>">
                                            <i class='bx bx-edit'></i>
                                        </a>
                                        <!-- Modal de edición -->
                                        <div class="modal fade" id="editarPersonal<%= profesor.getIdProfesores()%>" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-simple modal-add-new-address">
                                                <div class="modal-content p-3 p-md-5">
                                                    <div class="modal-body">
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        <div class="text-center mb-4">
                                                            <h3 class="address-title fw-bold">Editar Personal</h3>
                                                        </div>
                                                        <form id="editarPersonalForm<%= profesor.getIdProfesores()%>" class="row g-3" method="Post" action="<%=request.getContextPath()%>/ServletAdministrador?action=editarProfesor&idProfesor=<%=profesor.getIdProfesores()%>">

                                                            <div class="col-12">
                                                                <div class="row">
                                                                    <div class="col-md mb-md-0 mb-3">
                                                                        <div class="form-check custom-option custom-option-icon">
                                                                            <label class="form-check-label custom-option-content" for="customRadioHome">
                                                                                <span class="custom-option-body">
                                                                                  <i class="bx bx-tennis-ball"></i>
                                                                                  <span class="custom-option-title">Deporte</span>
                                                                                </span>
                                                                                <input name="tipoProfesor" class="form-check-input" type="radio" value="Deporte" id="customRadioHome" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md mb-md-0 mb-3">
                                                                        <div class="form-check custom-option custom-option-icon">
                                                                            <label class="form-check-label custom-option-content" for="customRadioOffice">
                                                                                <span class="custom-option-body">
                                                                                  <i class='bx bxs-book-reader'></i>
                                                                                  <span class="custom-option-title"> Cultura</span>
                                                                                </span>
                                                                                <input name="tipoProfesor" class="form-check-input" type="radio" value="Cultura" id="customRadioOffice" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12 col-md-6">
                                                                <label class="form-label" for="nombreProfesorEdit">Nombre</label>
                                                                <input type="text" id="nombreProfesorEdit" name="nombreProfesorEdit" class="form-control" value="<%= profesor.getNombreProfesor()%>" />

                                                            </div>
                                                            <div class="col-12 col-md-6">
                                                                <label class="form-label" for="apellidoProfesorEdit">Apellidos</label>
                                                                <input type="text" id="apellidoProfesorEdit" name="apellidoProfesorEdit" class="form-control" value="<%= profesor.getApellidoProfesor()%>" />
                                                            </div>
                                                            <div class="col-12 col-md-6">
                                                                <label class="form-label" for="dniProfesorEdit">DNI</label>
                                                                <input type="text" id="dniProfesorEdit" name="dniProfesorEditmodalDNI" class="form-control" value="<%= profesor.getDniProfesor()%>" />
                                                            </div>

                                                            <div class="col-12 col-md-6">
                                                                <label class="form-label" for="cursoProfesorEdit">Curso</label>
                                                                <input type="text" id="cursoProfesorEdit" name="cursoProfesorEdit" class="form-control" value="<%= profesor.getCursoProfesor()%>" />
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
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modalToggle<%= profesor.getIdProfesores() %>"><i
                                                class='bx bx-trash'></i>
                                        </button>
                                        <!-- Modal de eliminación y confirmación -->

                                        <div class="modal fade" id="modalToggle<%= profesor.getIdProfesores() %>" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="modalToggleLabel">Eliminar de la Lista</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <b> ¿Está seguro de eliminar a este instructor? </b>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <a class="btn btn-primary"  href="<%=request.getContextPath()%>/ServletAdministrador?action=eliminarProfesor&idProfesor=<%= profesor.getIdProfesores() %>">Si</a>
                                                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>

                        </div>
                    </div> <!-- Modal to add new record -->
                    <!--/ DataTable with Buttons -->


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

</html>
