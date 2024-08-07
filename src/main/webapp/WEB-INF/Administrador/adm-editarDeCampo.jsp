<%@ page import="com.example.sanmi_telesoft.beans.TipoSereno" %><%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 19/06/2024
  Time: 07:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">
<jsp:useBean id="deCampo" type="com.example.sanmi_telesoft.beans.Serenazgo" scope="request" />
<jsp:useBean id="listaTipoSereno" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.TipoSereno>" scope="request"/>
<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-datatables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Apr 2024 13:16:08 GMT -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>SanMi: Registrar DeCampo</title>


    <meta name="description"
          content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!"/>
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
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
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

    <style>
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>

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
            <div class="content-wrapper p-4">
                <!-- Content -->

                <div class="modal-content p-3 p-md-5">
                    <div class="modal-body">
                        <div class="text-center mb-4">
                            <h3 class="address-title fw-bold">Editar Serenazgo</h3>
                        </div>
                        <form class="row g-3" method="post" action="<%=request.getContextPath()%>/ServletAdministrador?action=editarDeCampo">
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="nombreDeCampo">Nombres</label>
                                <input type="text" id="nombreDeCampo" name="nombreDeCampo" class="form-control" value="<%=deCampo.getNombreSereno()%>" />
                            </div>
                            <script>
                                document.getElementById('nombreDeCampo').addEventListener('keypress', function(event) {
                                    var regex = new RegExp("^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$");
                                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                                    if (!regex.test(key) || (key === ' ' && this.value.length === 0)) {
                                        event.preventDefault();
                                        return false;
                                    }
                                });
                            </script>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="apellidoDeCampo">Apellidos</label>
                                <input type="text" id="apellidoDeCampo" name="apellidoDeCampo" class="form-control" value="<%=deCampo.getApellidoSereno()%>" />
                            </div>
                            <script>
                                document.getElementById('apellidoDeCampo').addEventListener('keypress', function(event) {
                                    var regex = new RegExp("^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$");
                                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                                    if (!regex.test(key) || (key === ' ' && this.value.length === 0)) {
                                        event.preventDefault();
                                        return false;
                                    }
                                });
                            </script>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="dniDeCampo">DNI</label>
                                <input type="text" id="dniDeCampo" name="dniDeCampo" class="form-control" value="<%=deCampo.getDniSereno()%>" />
                            </div>
                            <script>
                                document.getElementById('dniDeCampo').addEventListener('keypress', function(event) {
                                    var regex = new RegExp("^[0-9]+$");
                                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                                    // Verificar si el input cumple con la longitud deseada y el regex
                                    if (!regex.test(key) || this.value.length >= 8) {
                                        event.preventDefault();
                                        return false;
                                    }
                                });
                            </script>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="telefonoDeCampo">Teléfono</label>
                                <input type="text" id="telefonoDeCampo" name="telefonoDeCampo" class="form-control" value="<%=deCampo.getTelefonoSereno()%>" />
                            </div>
                            <script>
                                document.getElementById('telefonoDeCampo').addEventListener('keypress', function(event) {
                                    var regex = new RegExp("^[0-9]+$");
                                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                                    // Verificar si el input cumple con la longitud deseada y el regex
                                    if (!regex.test(key) || this.value.length >= 9) {
                                        event.preventDefault();
                                        return false;
                                    }
                                });
                            </script>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="tipoDeCampo">Tipo</label>
                                <select id="tipoDeCampo" name="tipoDeCampo" class="select2 form-select">
                                    <% for (TipoSereno tipoSereno : listaTipoSereno) {
                                        String selected = "";
                                        if (deCampo.getTipoSereno().getIdTipoSereno()==tipoSereno.getIdTipoSereno()) {
                                            selected = "selected";
                                        }
                                    %>
                                    <option value="<%=tipoSereno.getIdTipoSereno()%>" <%=selected%>><%=tipoSereno.getNameTipo()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="turnoDeCampo">Turno</label>
                                <select id="turnoDeCampo" name="turnoDeCampo" class="select2 form-select" >
                                    <%
                                        String selectedM = "";
                                        String selectedT = "";
                                        String selectedN = "";
                                        if (deCampo.getTurnoSereno().equals("Mañana")) {
                                            selectedM = "selected";
                                        } else if (deCampo.getTurnoSereno().equals("Tarde")) {
                                            selectedT = "selected";
                                        } else if (deCampo.getTurnoSereno().equals("Noche")) {
                                            selectedN = "selected";
                                        }
                                    %>
                                    <option value="Mañana" <%=selectedM%>>Mañana</option>
                                    <option value="Tarde" <%=selectedT%>>Tarde</option>
                                    <option value="Noche" <%=selectedN%>>Noche</option>
                                </select>
                            </div>
                            <div class="col-12 ">
                                <label class="form-label" for="direccionDeCampo">Dirección</label>
                                <input type="text" id="direccionDeCampo" name="direccionDeCampo" class="form-control" value="<%=deCampo.getDireccionSereno()%>" />
                            </div>
                            <script>
                                document.getElementById('direccionDeCampo').addEventListener('keypress', function(event) {

                                    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                                    if ((key === ' ' && this.value.length === 0)) {
                                        event.preventDefault();
                                        return false;
                                    }
                                });
                            </script>
                            <div>
                                <input type="hidden" id="idDeCampo" name="idDeCampo" value="<%= deCampo.getIdSerenazgos() %>">
                            </div>
                            <div class="col-12 text-center">
                                <button type="submit" class="btn btn-primary me-sm-3 me-1">Registrar</button>
                                <a href="ServletAdministrador?action=mostrarDeCampo" class="btn btn-label-secondary">Cancelar</a>
                            </div>
                        </form>
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
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/popular.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/auto-focus.js"></script>

                <!-- Main JS -->
                <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

                <!-- Page JS -->
                <script src="${pageContext.request.contextPath}/assets/js/init-datatables.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
                <script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>

                <!-- Modal Agregado -->
                <script src="${pageContext.request.contextPath}/assets/js/ui-modals.js"></script>

                <!-- SweetAlert2 -->
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
