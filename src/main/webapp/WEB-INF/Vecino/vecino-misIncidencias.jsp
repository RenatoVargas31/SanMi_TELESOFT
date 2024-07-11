<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 16/06/2024
  Time: 03:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.sanmi_telesoft.beans.Incidencia" %>
<%@ page import="java.util.List" %>

<% String pageName = "misIncidencias"; request.setAttribute("pageName", pageName); %>
<jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Vecino/navBar.jsp"/>
<style>
    .modal-content {
        border-radius: 15px;
        padding: 20px;
        background: linear-gradient(145deg, #f0f0f0, #cacaca);
    }
    .modal-header {
        background-color: #1A4D8F;
        color: white;
        border-bottom: 1px solid #dee2e6;
        border-radius: 15px 15px 0 0;
    }
    .modal-footer {
        border-top: 1px solid #dee2e6;
        border-radius: 0 0 15px 15px;
    }
    .modal-title {
        color: white;
    }
    .modal-body {
        font-size: 1.1rem;
        text-align: center;
    }
    .btn-close {
        background-color: white;
        border-radius: 50%;
    }
    .btn-secondary, .btn-danger {
        margin: 0 10px;
    }
</style>
<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="fw-bold">Mis incidencias</h3>
            <button class="btn btn-secondary create-new btn-primary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/ServletVecino?action=reportarIncidencia'">
                <i class='bx bx-bell-plus bx-tada'></i>
                <span class="d-none d-sm-inline-block">Nueva Incidencia</span>
            </button>
        </div>

        <div class="card">
            <div class="card-datatable table-responsive">
                <table id="table-misincidencias" class="datatables-basic table border-top">
                    <thead>
                    <tr>
                        <th>Incidencia</th>
                        <th>Lugar Exacto</th>
                        <th>Estado</th>
                        <th>Prioridad</th>
                        <th>Fecha de Registro</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Incidencia> incidencias = (List<Incidencia>) request.getAttribute("misIncidencias");
                        for (int i = 0; i < incidencias.size(); i++) {
                            Incidencia incidencia = incidencias.get(i);
                    %>

                    <tr>
                        <td><%= incidencia.getNombreIncidencia() %></td>
                        <td><%= incidencia.getLugarIncidencia() %></td>
                        <% if (incidencia.getEstado() == 1) { %>
                        <td><span class="badge bg-danger">Nueva</span></td>
                        <% } else if (incidencia.getEstado() == 2) { %>
                        <td><span class="badge bg-warning">Procesando</span></td>
                        <% } else if (incidencia.getEstado() == 3) { %>
                        <td><span class="badge bg-success">Resuelta</span></td>
                        <% } %>
                        <% if (incidencia.getCriticidad() == 1) { %>
                        <td><span class="badge bg-primary">Baja</span></td>
                        <% } else if (incidencia.getCriticidad() == 2) { %>
                        <td><span class="badge bg-warning">Media</span></td>
                        <% } else if (incidencia.getCriticidad() == 3) { %>
                        <td><span class="badge bg-danger">Alta</span></td>
                        <% } else { %>
                        <td><span class="badge bg-secondary">No asignado</span></td>
                        <% } %>
                        <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(incidencia.getFechaRegistro()) %></td>
                        <td>
                            <button type="button"
                                    class="btn btn-icon btn-icon-only btn-outline-primary btn-sm"
                                    onclick="window.location.href='${pageContext.request.contextPath}/ServletVecino?action=verDetallesIncidencia&id=<%= incidencia.getIdIncidencias() %>';">
                                <i class='bx bx-show'></i>
                            </button>
                            <% if (incidencia.getEstado() == 1) { %>
                            <button type="button" class="btn btn-icon btn-icon-only btn-outline-primary btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/ServletVecino?action=actualizarIncidencia&id=<%= incidencia.getIdIncidencias() %>';">
                                <i class='bx bx-edit'></i>
                            </button>
                            <button type="button" class="btn btn-icon btn-icon-only btn-outline-primary btn-sm" onclick="promptDeletion(<%= incidencia.getIdIncidencias() %>);">
                                <i class='bx bx-x'></i>
                            </button>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="deletionModal" tabindex="-1" aria-labelledby="deletionModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deletionModalLabel">¿Estás seguro de que quieres eliminar esta incidencia?</h5>
                    </div>
                    <div class="modal-body">
                        <p>Esta acción no se puede deshacer.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" onclick="submitDeletion()">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>

        <footer class="content-footer footer bg-footer-theme">
            <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                    © <script>document.write(new Date().getFullYear())</script>, made by <a href="https://themeselection.com/" target="_blank" class="footer-link fw-medium">Telesoft</a>
                </div>
            </div>
        </footer>

    </div>
</div>
<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>

<script>
    function promptDeletion(idIncidencia) {
        const modalElement = document.getElementById('deletionModal');
        modalElement.setAttribute('data-id', idIncidencia);
        const myModal = new bootstrap.Modal(modalElement);
        myModal.show();
    }

    function submitDeletion() {
        const modalElement = document.getElementById('deletionModal');
        const idIncidencia = modalElement.getAttribute('data-id');

        fetch('${pageContext.request.contextPath}/ServletVecino?action=eliminarIncidencia&id=' + idIncidencia, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).then(response => {
            if (response.ok) {
                alert('La incidencia ha sido eliminada correctamente.');
                location.reload();
            } else {
                alert('Hubo un error al eliminar la incidencia.');
            }
        }).catch(error => {
            console.error('Error:', error);
        });
    }


</script>

</body>
</html>


