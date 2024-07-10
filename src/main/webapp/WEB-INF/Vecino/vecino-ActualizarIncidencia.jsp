<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 16/06/2024
  Time: 05:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="incidencia" class="com.example.sanmi_telesoft.beans.Incidencia" scope="request"/>
<%
    String pageName = "actualizarIncidencia";
    request.setAttribute("pageName", pageName);
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/ServletLoguin");
        return;
    }
%>
<jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>

<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Vecino/navBar.jsp"/>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="card">
                    <div class="card-header" style="background-color: #33CCFF; color: white; text-align: center;">
                        <h5 class="card-title text-white mb-0">Actualizar Incidencia</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="post" action="<%=request.getContextPath()%>/ServletVecino?action=actualizarIncidencia" enctype="multipart/form-data">
                            <input type="hidden" name="incidencia_id" value="<%= incidencia.getIdIncidencias()%>"/>
                            <div class="col-md-6">
                                <label class="form-label" for="fullname">Nombre</label>
                                <input type="text" id="fullname" name="fullname" class="form-control" value="<%= incidencia.getNombreIncidencia() == null ? "" : incidencia.getNombreIncidencia()%>" placeholder="Nombre" />
                            </div>

                            <div class="col-md-6">
                                <label class="form-label" for="phone">Telefono</label>
                                <input type="text" class="form-control" name="phone" id="phone" value="<%= incidencia.getTelefono()%>"  placeholder="" />
                            </div>

                            <div class="col-12">
                                <label class="form-label" for="LugarExacto">Lugar Exacto</label>
                                <input type="text" id="LugarExacto" name="LugarExacto" class="form-control" value="<%= incidencia.getLugarIncidencia() == null ? "" : incidencia.getLugarIncidencia()%>" placeholder="Av, jr, calle."/>
                            </div>

                            <div class="col-12">
                                <label class="form-label" for="Referencia">Referencia</label>
                                <input type="text" id="Referencia" name="Referencia" class="form-control" value="<%= incidencia.getReferenciaIncidencia() == null ? "" : incidencia.getReferenciaIncidencia()%>" placeholder="Cerca a . . ." />
                            </div>

                            <div class="col-12">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" value="" id="ambulancia" name="ambulancia" <% if(incidencia.isRequiereAmbulancia()) { %> checked="" <%}%> >
                                    <label class="form-check-label" for="ambulancia">Es necesario una ambulancia</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="input-group">
                                    <input type="file" class="form-control" id="file" name="file" aria-describedby="inputGroupFileAddon03" aria-label="Upload" accept="image/jpeg, image/png">
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <button class="btn btn-label-primary" onclick="checkFieldsAndGoBack();">Atrás</button>
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

<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>

<script>
    // Verifica que todos los campos de texto estén llenos y que un archivo haya sido cargado
    function validateForm() {
        let lugarExacto = document.getElementById('LugarExacto-actualizarProfesor').value.trim();
        let referencia = document.getElementById('Referencia-actualizarProfesor').value.trim();
        let fileInput = document.getElementById('inputGroupFile03-actualizarProfesor');

        if (!lugarExacto || !referencia || fileInput.files.length === 0) {
            alert('Por favor, complete todos los campos obligatorios y suba una imagen.');
            return false;
        }
        return true;
    }

    function checkFieldsAndGoBack() {
        if (validateForm()) {
            var confirmLeave = confirm('Todavía no ha actualizado su incidencia. ¿Desea regresar de todas formas o actualizarProfesor la incidencia ahora? OK para regresar, Cancelar para seguir escribiendo.');
            if (confirmLeave) {
                window.location.href = '${pageContext.request.contextPath}/ServletVecino?action=misIncidencias';
            }
        } else {
            var confirmLeaveNoReport = confirm('No se ha actualizado su incidencia. ¿Está seguro que quiere volver? Aceptar: Volver . Cancelar: Seguir llenando los campos');
            if (confirmLeaveNoReport) {
                window.location.href = '${pageContext.request.contextPath}/ServletVecino?action=misIncidencias';
            }
        }
    }

    document.getElementById('inputGroupFile03-actualizarProfesor').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

        if (!allowedExtensions.exec(file.name)) {
            alert('Solo puedes subir imágenes !(archivos con terminación jpg o png)');
            event.target.value = '';
        } else {
            var reader = new FileReader();
            reader.onload = function(e) {
                var imagePreview = document.createElement('img');
                imagePreview.src = e.target.result;
                imagePreview.style.maxWidth = '200px';
                document.body.appendChild(imagePreview);
            };
            reader.readAsDataURL(file);
        }
    });
</script>
</body>
</html>
