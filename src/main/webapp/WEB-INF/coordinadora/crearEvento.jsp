<%@ page import="com.example.sanmi_telesoft.beans.Profesor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" type="com.example.sanmi_telesoft.beans.Usuario" scope="session" class="com.example.sanmi_telesoft.beans.Usuario"/>
<% ArrayList<Profesor> profesores = (ArrayList<Profesor>) request.getAttribute("listaProfesores"); %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMI  | Crear evento </title>

    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

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
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css" />
    <!-- Row Group CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
    <!-- Form Validation -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!-- Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <!-- Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

    <style>
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>

</head>

<style>
    .bootstrap-select .dropdown-menu {
        transform: translateY(0) !important;
    }
</style>
<body>

<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0"
            style="display: none; visibility: hidden"></iframe>
</noscript>

<div class="layout-wrapper layout-content-navbar  ">
    <div class="layout-container">

        <jsp:include page="sideBar.jsp"/>
        <div class="layout-page">
            <jsp:include page="navBar.jsp"/>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-8">
                            <div class="card">
                                <div class="card-header" style="background-color: #33CCFF; color: white; text-align: center;">
                                    <h5 class="card-title text-white mb-0">Crear evento</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <form class="row g-3" method="post" action="<%=request.getContextPath()%>/ServletCoordinadora?action=guardarEventos" enctype="multipart/form-data">

                                            <div class="col-md-6">
                                                <label class="form-label" for="nombre">Nombre del evento</label>
                                                <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre" required/>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label" for="vacantes">Vacantes</label>
                                                <input type="number" id="vacantes" name="vacantes" class="form-control" placeholder="Número de vacantes" required min="1"
                                                       onkeydown="return (event.key >= '0' && event.key <= '9') || (event.key === 'Backspace' || event.key === 'Delete' || event.key === 'ArrowLeft' || event.key === 'ArrowRight') || (this.value === '' && event.key === '1')"
                                                       oninput="validity.valid||(value='1');"/>
                                            </div>


                                            <div class="col-12">
                                                <label class="form-label" for="descripcion">Descripción</label>
                                                <textarea class="form-control" name="descripcion" id="descripcion" rows="4" placeholder="Máximo 255 caracteres." required maxlength="255"></textarea>
                                            </div>


                                            <div class="col-12">
                                                <label class="form-label" for="LugarExacto">Ubicación del Evento</label>
                                                <input type="text" id="LugarExacto" name="LugarExacto" class="form-control" placeholder="Distrito, Av. o Calle " required/>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label" for="FechaInicio">Fecha de inicio</label>
                                                <input type="date" id="FechaInicio" name="FechaInicio" class="form-control" placeholder="" required/>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label" for="FechaFin">Fecha de fin</label>
                                                <input type="date" id="FechaFin" name="FechaFin" class="form-control" placeholder="" required/>
                                            </div>
                                            <div class="col-md-6" hidden>
                                                <label class="form-label" for="tipoEvento">Tipo de Evento</label>
                                                <%
                                                    // Suponiendo que user es un objeto que tiene el método getTipoCoordinadora()
                                                    int tipoCoordinadora = usuario.getIdTipoCoordinadora();
                                                    int tipoEventoValue = 0;
                                                    if (tipoCoordinadora == 1) {
                                                        tipoEventoValue = 1;
                                                    }
                                                    if (tipoCoordinadora == 2) {
                                                        tipoEventoValue = 2;
                                                    }
                                                %>
                                                <input type="text" id="tipoEvento" name="tipoEvento" class="form-control" placeholder="Tipo de Evento" value="<%= tipoEventoValue %>" />
                                            </div>

                                            <div class="col-md-6" hidden>
                                                <label class="form-label" for="idCoordinadora"></label>
                                                <input type="text" id="idCoordinadora" name="idCoordinadora" class="form-control" placeholder="Tipo de Evento" value="<%= usuario.getIdUsuarios() %>" />
                                            </div>


                                            <div class="col-md-6">
                                                <label class="form-label" for="horaInicio">Hora de inicio</label>
                                                <input type="time" id="horaInicio" name="horaInicio" class="form-control" placeholder="" required/>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label" for="horaFin">Hora de fin</label>
                                                <input type="time" id="horaFin" name="horaFin" class="form-control" placeholder="" required/>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label" for="materiales">Materiales (opcional)</label>
                                                <input type="text" class="form-control" name="materiales" id="materiales" maxlength="255"/>
                                            </div>

                                            <div class="col-md-6 mb-4">
                                                <label for="selectpickerLiveSearch" class="form-label">Profesores</label>
                                                <select id="selectpickerLiveSearch" name="profesorId" class="selectpicker w-100" data-style="btn-default" data-live-search="true" data-dropup-auto="false" data-none-results-text="Ningun resultado para '{0}'">
                                                    <% for (Profesor profesor : profesores) { %>
                                                    <option value="<%= profesor.getIdProfesores() %>">
                                                        <%= profesor.getNombreProfesor() + " " + profesor.getApellidoProfesor() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>

                                            <div class="col-md-6 mb-4">
                                                <label for="selectpickerMultiple" class="form-label">Frecuencia del Evento</label>
                                                <select id="selectpickerMultiple" name="diasSemana" class="selectpicker w-100" data-style="btn-default" multiple data-icon-base="bx" data-dropup-auto="false" data-none-selected-text="Sin frecuencia" data-tick-icon="bx-check text-primary">
                                                    <option value="lunesActive">Todos los lunes</option>
                                                    <option value="martesActive">Todos los martes</option>
                                                    <option value="miercolesActive">Todos los miércoles</option>
                                                    <option value="juevesActive">Todos los jueves</option>
                                                    <option value="viernesActive">Todos los viernes</option>
                                                    <option value="sabadoActive">Todos los sábados</option>
                                                    <option value="domingoActive">Todos los domingos</option>
                                                </select>
                                            </div>


                                            <div class="col-12">
                                                <div class="input-group">
                                                    <label class="form-label">Foto del evento</label>
                                                    <div class="col-12">
                                                        <input type="file" class="form-control" id="file" name="file" aria-describedby="inputGroupFileAddon03" aria-label="Upload" accept="image/jpeg, image/png" required>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="d-flex justify-content-between align-items-center mt-4">
                                                <a href="${pageContext.request.contextPath}/ServletCoordinadora?action=verMisEventos" class="btn btn-label-primary">Regresar a la lista de eventos</a>
                                                <div class="flex-grow-1 d-flex justify-content-center">
                                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                                </div>
                                                <div style="width: 86px;"></div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js"></script>

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
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/popular.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/auto-focus.js"></script>
                <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
                <script src="${pageContext.request.contextPath}/assets/js/init-datatables.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
                <script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>
                <script src="${pageContext.request.contextPath}/assets/js/ui-modals.js"></script>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

                <script>






                    document.getElementById('registerButton').addEventListener('click', function(event) {
                        event.preventDefault(); // Evitar el envío del formulario
                        Swal.fire({
                            icon: 'success',
                            title: 'Registro Exitoso',
                            text: 'El personal de serenazgo ha sido registrado correctamente.',
                            confirmButtonText: 'Aceptar'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = 'adm-personalSerenazgoDeCampo.html';
                            }
                        });
                    });

                    document.getElementById('cancelButton').addEventListener('click', function() {
                        window.location.href = 'adm-personalSerenazgoDeCampo.html';
                    });
                </script>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
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
    document.addEventListener("DOMContentLoaded", function() {

        const form = document.querySelector('form');
        const descripcion = document.getElementById('descripcion');
        const materiales = document.getElementById('materiales');
        const charCount = document.getElementById('charCount');
        const materialesCharCount = document.getElementById('materialesCharCount');
        const selectElement = document.getElementById('selectpickerMultiple');
        form.addEventListener('submit', function(event) {
            const fechaInicio = document.getElementById('FechaInicio').value;
            const fechaFin = document.getElementById('FechaFin').value;
            const horaInicio = document.getElementById('horaInicio').value;
            const horaFin = document.getElementById('horaFin').value;

            const selectedOptions = Array.from(selectElement.selectedOptions).map(option => option.value);
            if (fechaFin < fechaInicio) {
                alert('La fecha de fin debe ser mayor o igual a la fecha de inicio.');
                event.preventDefault();
                return;
            }

            if (fechaFin === fechaInicio && horaFin <= horaInicio) {
                alert('Si la fecha de fin es igual a la fecha de inicio, la hora de fin debe ser mayor a la hora de inicio.');
                event.preventDefault();
                return;
            }

            if (descripcion.value.length > 255) {
                alert('La descripción no puede tener más de 255 caracteres.');
                event.preventDefault();
                return;
            }

            if (materiales.value.length > 255) {
                alert('Los materiales no pueden tener más de 255 caracteres.');
                event.preventDefault();
                return;
            }

        });

        descripcion.addEventListener('input', function() {
            const currentLength = descripcion.value.length;
            charCount.textContent = `${currentLength}/255 caracteres`;

            if (currentLength > 255) {
                descripcion.value = descripcion.value.slice(0, 255);
                charCount.textContent = '255/255 caracteres';
            }
        });

        materiales.addEventListener('input', function() {
            const currentLength = materiales.value.length;
            materialesCharCount.textContent = `${currentLength}/255 caracteres`;

            if (currentLength > 255) {
                materiales.value = materiales.value.slice(0, 255);
                materialesCharCount.textContent = '255/255 caracteres';
            }
        });

    });


</script>
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

<!-- jQuery -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<!-- Perfect Scrollbar -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<!-- Hammer.js -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>

<!-- i18n -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>

<!-- Typeahead.js and Bloodhound -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bloodhound/bloodhound.js"></script>

<!-- Menu -->
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

<!-- Select2 -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>

<!-- Tagify -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.js"></script>

<!-- Bootstrap Select -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/forms-selects.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-tagify.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-typeahead.js"></script>





</body>
</html>
