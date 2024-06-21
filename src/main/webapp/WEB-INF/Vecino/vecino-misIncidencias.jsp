<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 16/06/2024
  Time: 03:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="misIncidencias" type="java.util.List" class="com.example.sanmi_telesoft.beans.Incidencia" scope="request" />
<%
    String pageName = "misIncidencias";
    request.setAttribute("pageName", pageName);
%>
<jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Vecino/navBar.jsp"/>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="fw-bold">Mis incidencias</h3>
            <button class="btn btn-secondary create-new btn-primary" type="button" onclick="window.location.href='vecino-reportarIncidencia.jsp';">
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
                        <th>Estado</th>
                        <th>Prioridad</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="incidencia" items="${misIncidencias}">
                        <tr>
                            <td>${incidencia.nombreIncidencia}</td>
                            <td><span class="badge ${incidencia.estado == 1 ? 'bg-danger' : 'bg-success'}">${incidencia.estado == 1 ? 'Pendiente' : 'Resuelto'}</span></td>
                            <td><span class="badge ${incidencia.criticidad == 1 ? 'bg-danger' : 'bg-warning'}">${incidencia.criticidad == 1 ? 'Alta' : 'Media'}</span></td>
                            <td>
                                <button type="button" class="btn btn-icon btn-icon-only btn-outline-primary btn-sm">
                                    <i class='bx bx-show'></i>
                                </button>
                                <button type="button" class="btn btn-icon btn-icon-only btn-outline-primary btn-sm" onclick="window.location.href='vecino-ActualizarIncidencia.jsp?id=${incidencia.idIncidencias}';">
                                    <i class='bx bx-edit'></i>
                                </button>
                                <button type="button" class="btn btn-icon btn-icon-only btn-outline-primary btn-sm" onclick="promptDeletion(${incidencia.idIncidencias});">
                                    <i class='bx bx-x'></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
                        <p>¿Estás seguro de que deseas eliminar esta incidencia?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" onclick="submitDeletion()">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>

<script>
    function promptDeletion(idIncidencia) {
        var myModal = new bootstrap.Modal(document.getElementById('deletionModal'));
        document.getElementById('deletionModal').setAttribute('data-id', idIncidencia);
        myModal.show();
    }

    function submitDeletion() {
        const idIncidencia = document.getElementById('deletionModal').getAttribute('data-id');

        if (confirm('¿Está seguro de que desea eliminar esta incidencia? Una vez eliminada no podrá ser recuperada . . .')) {
            fetch(`${pageContext.request.contextPath}/ServletVecino?action=eliminarIncidencia`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    idIncidencia: idIncidencia
                })
            }).then(response => {
                if (response.ok) {
                    alert('La incidencia ha sido eliminada correctamente.');
                    location.reload();
                } else {
                    alert('Hubo un error al eliminar la incidencia.');
                }
            });
        }
    }
</script>

</body>
</html>

