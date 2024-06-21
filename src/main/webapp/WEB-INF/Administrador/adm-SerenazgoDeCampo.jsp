<%@ page import="com.example.sanmi_telesoft.beans.Serenazgo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.example.sanmi_telesoft.beans.Usuario" %>
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



<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>Administrador: Dispatcher's</title>


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
                                <h3 class="m-4 fw-bold">Lista de Serenazgos Dispatchers</h3>

                                <form action="<%=request.getContextPath()%>/ServletAdministrador" method="get">
                                    <input type="hidden" name="action" value="nuevoDeCampo">
                                    <button type="submit" class="btn btn-primary me-3 ">
                                        <i class='bx bx-laptop me-2'></i>
                                        <span><h2 style="color: white;font-size:15px; margin-bottom: 0px">Nuevo Dispatcher</h2></span>
                                    </button>
                                </form>
                            </div>
                            <table id="table-personalSerenazgoDeCampo" class="datatables-basic table border-top">
                                <thead>
                                <tr>
                                    <th>Nombre Y apellido</th>
                                    <th>DNI</th>
                                    <th>Teléfono</th>
                                    <th>Tipo</th>
                                    <th>Turno</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <%
                                    ArrayList<Serenazgo> listaDeCampo = (ArrayList<Serenazgo>) request.getAttribute("listaDeCampo");
                                %>
                                <tbody>

                                <%for (Serenazgo deCampo : listaDeCampo) {%>
                                <%if(Objects.equals(deCampo.getIsEnable(), "1")){%>
                                <tr>
                                    <td><%= deCampo.getNombreSereno() %> <%= deCampo.getApellidoSereno() %></td>
                                    <td><%= deCampo.getDniSereno() %></td>
                                    <td><%= deCampo.getTelefonoSereno() %></td>
                                    <td><%= deCampo.getTipoSereno().getNameTipo()%></td>
                                    <td><%= deCampo.getTurnoSereno()%></td>
                                    <td>
                                        <a type="button" class="btn btn-icon btn-icon-only btn-label-primary btn-sm " href="<%=request.getContextPath()%>/ServletAdministrador?action=actualizarDeCampo&idDeCampo=<%= deCampo.getIdSerenazgos() %>">
                                            <i class='bx bx-edit'></i>
                                        </a>

                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modalToggle<%= deCampo.getIdSerenazgos() %>"><i
                                                class='bx bx-trash'></i>
                                        </button>
                                        <div class="modal fade" id="modalToggle<%= deCampo.getIdSerenazgos() %>" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="modalToggleLabel">Eliminar de la Lista</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <b> ¿Está seguro de eliminar a este Dispatcher? </b>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <a class="btn btn-primary"  href="<%=request.getContextPath()%>/ServletAdministrador?action=eliminarDeCampo&idDeCampo=<%= deCampo.getIdSerenazgos() %>">Si</a>
                                                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <% } %>
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
