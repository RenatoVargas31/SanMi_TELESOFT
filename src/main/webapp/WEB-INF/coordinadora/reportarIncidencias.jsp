<%@ page import="com.example.sanmi_telesoft.beans.TipoIncidencia" %>
<%@ page import="com.example.sanmi_telesoft.beans.Urbanizacion" %>
<jsp:useBean id="urbanizaciones" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.Urbanizacion>" scope="request" />;
<jsp:useBean id="tipos" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.TipoIncidencia>" scope="request" />
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr"
      data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMI  | Reportar Incidencia</title>

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
                                    <h5 class="card-title text-white mb-0">Reportar Incidencia</h5>
                                </div>
                                <div class="card-body">
                                    <form id="reportarIncidenciaForm" enctype="multipart/form-data">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label for="nombreIncidencia" class="form-label">Nombre de la Incidencia</label>
                                                <input type="text" class="form-control" id="nombreIncidencia" name="nombreIncidencia" placeholder="Nombre de la Incidencia" required>
                                                <div id="nombreIncidenciaError" class="error" style="color: red;"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label" for="phone">Teléfono</label>
                                                <input type="text" id="phone" name="phone" class="form-control" placeholder="Opcional" />
                                                <div id="telefonoError" class="error" style="color: red;"></div>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label" for="LugarExacto">Lugar Exacto</label>
                                                <textarea name="LugarExacto" class="form-control" id="LugarExacto" rows="2" placeholder="Av, jr, calle." required></textarea>
                                                <div id="lugarExactoError" class="error" style="color: red;"></div>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label" for="Referencia">Referencia</label>
                                                <input type="text" id="Referencia" name="Referencia" class="form-control" placeholder="Cerca a . . ." required />
                                                <div id="referenciaError" class="error" style="color: red;"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label" for="tipoIncidencia">Tipo de Incidencia</label>
                                                <select id="tipoIncidencia" name="tipoIncidencia" class="select2 form-select">
                                                    <option value="sinSeleccion">--Seleccione--</option>
                                                    <% for (TipoIncidencia t : tipos) {%>
                                                    <option value="<%=t.getId()%>"><%=t.getName()%></option>
                                                    <%}%>
                                                </select>
                                                <div id="tipoIncidenciaError" class="error" style="color: red;"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label" for="urbanizacion">Urbanizacion</label>
                                                <select id="urbanizacion" name="urbanizacion" class="select2 form-select">
                                                    <option value="sinSeleccion">--Seleccione--</option>
                                                    <% for (Urbanizacion u : urbanizaciones) {%>
                                                    <option value="<%=u.getId()%>"><%=u.getName()%></option>
                                                    <%}%>
                                                </select>
                                                <div id="urbanizacionError" class="error" style="color: red;"></div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-3 form-check">
                                                    <input type="checkbox" class="form-check-input" id="requiereAmbulancia" name="requiereAmbulancia"
                                                        <%= request.getParameter("requiereAmbulancia") != null ? "checked" : "" %>>
                                                    <label class="form-check-label" for="requiereAmbulancia">Es necesario una ambulancia</label>
                                                </div>
                                                <div id="requiereAmbulanciaError" class="error" style="color: red;"></div>
                                            </div>

                                            <div class="col-12">
                                                <div class="input-group">
                                                    <input type="file" class="form-control" id="file" name="fotoincidencia" accept="image/jpeg, image/png">
                                                    <div id="fotoincidenciaError" class="error" style="color: red;"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 mt-3 text-center">
                                                <label for="previewImage" class="form-label">Imagen a subir:</label>
                                                <img id="previewImage" style="max-width: 400px; display: none; margin: 0 auto;"/>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mt-4">
                                            <button class="btn btn-label-primary" type="button" onclick="checkFieldsAndGoBack();">Atrás</button>
                                            <div class="flex-grow-1 d-flex justify-content-center">
                                                <button class="btn btn-primary" type="submit" style="background-color: #33CCFF; color: white; text-align: center;">Reportar</button>
                                            </div>
                                            <div style="width: 86px;"></div> <!-- This empty div serves as a spacer to maintain balance -->
                                        </div>
                                    </form>
                                    </div>
                                </div>
                            </div>
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
    function validateForm() {
        let nombreIncidencia = document.getElementById('nombreIncidencia').value.trim();
        let lugarExacto = document.getElementById('LugarExacto').value.trim();
        let referencia = document.getElementById('Referencia').value.trim();

        if (!nombreIncidencia || !lugarExacto || !referencia) {
            alert('Por favor, complete todos los campos obligatorios .');
            return false; // Previene el envío del formulario
        }
        return true; // Permite el envío del formulario
    }

    function areFieldsFilled() {
        const nombreIncidencia = document.getElementById('nombreIncidencia').value.trim();
        const LugarExacto = document.getElementById('LugarExacto').value.trim();
        const referencia = document.getElementById('Referencia').value.trim();

        return nombreIncidencia && LugarExacto && referencia > 0;
    }

    function checkFieldsAndGoBack() {
        if (areFieldsFilled()) {
            const confirmLeave = confirm('Todavía no ha reportado su incidencia. ¿Desea regresar de todas formas o reportar la incidencia ahora? OK para regresar, Cancelar para seguir escribiendo.');
            if (confirmLeave) {
                window.location.href = '${pageContext.request.contextPath}/ServletCoordinadora?action=listarIncidencias';
            }
        } else {
            const confirmLeaveNoReport = confirm('No ha registrado los datos necesarios, ¿Está seguro que quiere volver? No se registrará su incidencia. Aceptar: Volver a lista general de incidencias. Cancelar: Seguir llenando los campos');
            if (confirmLeaveNoReport) {
                window.location.href = '${pageContext.request.contextPath}/ServletCoordinadora?action=listarIncidencias';
            }
        }
    }

    document.getElementById('inputGroupFile03').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

        if (!allowedExtensions.exec(file.name)) {
            alert('Solo puedes subir imágenes (archivos con terminación jpg o png)');
            event.target.value = '';
        } else {
            const reader = new FileReader();
            reader.onload = function(e) {
                const imagePreview = document.createElement('img');
                imagePreview.src = e.target.result;
                imagePreview.style.maxWidth = '200px';
                document.body.appendChild(imagePreview);
            };
            reader.readAsDataURL(file);
        }
    });

    $(document).ready(function() {
        $("#reportarIncidenciaForm").submit(function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/ServletCoordinadora?action=reportarIncidencia",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    if (response.success) {
                        window.location.href = "${pageContext.request.contextPath}/ServletCoordinadora?action=listarMisIncidencias";
                    } else {
                        $(".error").text(""); // Clear previous errors
                        for (var key in response) {
                            $("#" + key + "Error").text(response[key]);
                        }
                    }
                }
            });
        });
    });
</script>

</body>
</html>
