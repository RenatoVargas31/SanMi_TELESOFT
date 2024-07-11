<%@ page import="com.example.sanmi_telesoft.beans.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Random" %>
<%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 15/06/2024
  Time: 01:32
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

    <title>SanMi  |  Solicitud de Registro</title>


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

    <style>
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>

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
                                <h3 class="m-4 fw-bold">Solicitudes de Registro</h3>
                            </div>
                            <table id="table-solicitudRegistro" class="datatables-basic table border-top">
                                <thead>
                                <tr>
                                    <th>Nombre y Apellido</th>
                                    <th>Rol</th>
                                    <th>Domicilio</th>
                                    <th>Urbanización</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <!-- Modal - Detalles de USUARIO -->
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
                                <%
                                    ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
                                    ArrayList<String> listaColors = new ArrayList<>();
                                    listaColors.add("primary");
                                    listaColors.add("secondary");
                                    listaColors.add("success");
                                    listaColors.add("danger");
                                    listaColors.add("warning");
                                    listaColors.add("info");
                                    listaColors.add("dark");
                                    listaColors.add("twitter");
                                    listaColors.add("youtube");
                                    listaColors.add("reddit");
                                    listaColors.add("instagram");
                                    listaColors.add("pinterest");
                                    listaColors.add("facebook");
                                    listaColors.add("slack");
                                    listaColors.add("github");
                                    listaColors.add("vimeo");

                                    Random rand = new Random();
                                %>

                                <tbody>
                                <%for (Usuario usuario : listaUsuarios) {%>
                                <%if (usuario.getRol().equals("Vecino") || usuario.getRol().equals("Coordinadora")){%>

                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-wrapper">
                                                <div class="avatar me-2">
                                                    <span class="avatar-initial rounded-circle bg-label-<%=listaColors.get(rand.nextInt(listaColors.size()))%>"><%=usuario.getNombreUsuario().charAt(0)%><%=usuario.getApellidoUsuario().charAt(0)%></span>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <span class="emp_name text-truncate"><%= usuario.getNombreUsuario() %> <%= usuario.getApellidoUsuario() %></span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <%=usuario.getRol()%>
                                    </td>
                                    <td>
                                        <%=usuario.getDireccionUsuario()%>
                                    </td>
                                    <td>
                                        <%=usuario.getUrbanizacion()%>
                                    </td>
                                    <td>
                                        <%if(usuario.getIsActive().equals("0")){%>
                                        <span class="badge bg-warning">Pendiente</span>
                                        <%}else{%>
                                        <span class="badge bg-success">Aceptado</span>
                                        <%}%>
                                    </td>
                                    <td>
                                        <!-- Modal para confirmar como Vecino -->
                                        <button type="button"
                                                class="btn btn-label-primary btn-sm"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modalVecino<%= usuario.getIdUsuarios() %>"><i
                                                class='bx bx-user'></i><span>Vecino</span>
                                        </button>
                                        <div class="modal fade" id="modalVecino<%= usuario.getIdUsuarios() %>" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" >Aceptar como Vecino</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <b> ¿Está seguro de aceptar a <%=usuario.getNombreUsuario()%> <%=usuario.getApellidoUsuario()%> como Vecino? </b>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <a class="btn btn-primary"  href="<%=request.getContextPath()%>/ServletAdministrador?action=aceptarVecino&idDeUsuario=<%= usuario.getIdUsuarios() %>">Si</a>
                                                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal para confirmar como Coordinadora -->
                                        <button type="button"
                                                class="btn btn-label-primary btn-sm"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modalCoordinadora<%= usuario.getIdUsuarios() %>"><i
                                                class='bx bx-calendar-event'></i><span>Coordinadora</span>
                                        </button>
                                        <div class="modal fade" id="modalCoordinadora<%= usuario.getIdUsuarios() %>" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" >Aceptar como Coordinadora</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <b> ¿Está seguro de aceptar a <%=usuario.getNombreUsuario()%> <%=usuario.getApellidoUsuario()%> como Coordinadora? </b>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <a class="btn btn-primary"  href="<%=request.getContextPath()%>/ServletAdministrador?action=aceptarCoordinador&idDeUsuario=<%= usuario.getIdUsuarios() %>">Si</a>
                                                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal para confirmar eliminación -->
                                        <button type="button"
                                                class="btn btn-icon btn-icon-only btn-label-primary btn-sm"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modalDelete<%= usuario.getIdUsuarios() %>"><i
                                                class='bx bx-trash'></i>
                                        </button>
                                        <div class="modal fade" id="modalDelete<%= usuario.getIdUsuarios() %>" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="modalToggleLabel">Eliminar solicitud</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <b> ¿Está seguro de eliminar esta solicitud? </b>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <a class="btn btn-primary"  href="<%=request.getContextPath()%>/ServletAdministrador?action=eliminarSolicitudRegistro&idDeUsuario=<%= usuario.getIdUsuarios() %>">Si</a>
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
                    </div>
                    <!-- Modal to add new record -->

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
                <script src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
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
