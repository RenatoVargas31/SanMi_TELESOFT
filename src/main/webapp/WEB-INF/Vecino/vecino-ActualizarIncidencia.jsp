<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 16/06/2024
  Time: 05:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="incidencia" class="com.example.sanmi_telesoft.beans.Incidencia" scope="request"/>
<%@ page import="com.example.sanmi_telesoft.beans.TipoIncidencia, com.example.sanmi_telesoft.beans.Urbanizacion, java.util.ArrayList" %>
<%@ page import="com.example.sanmi_telesoft.beans.Urbanizacion, com.example.sanmi_telesoft.beans.Urbanizacion, java.util.ArrayList" %>
<%
    System.out.println("Incidencia ID: " + incidencia.getIdIncidencias());
    System.out.println("Tipo de Incidencia ID: " + incidencia.getIdTipoIncidencia());
    System.out.println("Urbanizacion ID: " + incidencia.getIdUrbanizacion());
%>
<%
    String pageName = "misIncidencias";
    request.setAttribute("pageName", pageName);
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/ServletLoguin");
        return;
    }
%>
<jsp:useBean id="urbanizaciones" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.Urbanizacion>" scope="request" />
<jsp:useBean id="tipos" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.TipoIncidencia>" scope="request" />
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
                        <form id="actualizarIncidenciaForm" enctype="multipart/form-data">
                            <input type="hidden" name="incidencia_id" value="<%= incidencia.getIdIncidencias()%>"/>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label" for="fullname">Nombre de la incidencia</label>
                                    <input type="text" id="fullname" name="fullname" class="form-control" value="<%= incidencia.getNombreIncidencia() == null ? "" : incidencia.getNombreIncidencia()%>" placeholder="Nombre de la incidencia" />
                                    <div id="nombreIncidenciaError" class="error" style="color: red;"></div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label" for="phone">Teléfono</label>
                                    <input type="text" class="form-control" name="phone" id="phone" value="<%= incidencia.getTelefono()%>"  placeholder="" />
                                    <div id="telefonoError" class="error" style="color: red;"></div>
                                </div>

                                <div class="col-12">
                                    <label class="form-label" for="LugarExacto">Lugar Exacto</label>
                                    <input type="text" id="LugarExacto" name="LugarExacto" class="form-control" value="<%= incidencia.getLugarIncidencia() == null ? "" : incidencia.getLugarIncidencia()%>" placeholder="Av, jr, calle."/>
                                    <div id="lugarExactoError" class="error" style="color: red;"></div>
                                </div>

                                <div class="col-12">
                                    <label class="form-label" for="Referencia">Referencia</label>
                                    <input type="text" id="Referencia" name="Referencia" class="form-control" value="<%= incidencia.getReferenciaIncidencia() == null ? "" : incidencia.getReferenciaIncidencia()%>" placeholder="Cerca a . . ." />
                                    <div id="referenciaError" class="error" style="color: red;"></div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="tipoIncidencia">Tipo de Incidencia</label>
                                    <select id="tipoIncidencia" name="tipoIncidencia" class="select2 form-select">
                                        <option value="sinSeleccion">--Seleccione--</option>
                                        <% for (TipoIncidencia t : tipos) { %>
                                        <option value="<%= t.getId() %>" <%= (incidencia.getIdTipoIncidencia() ==t.getId()) ? "selected" : "" %>><%= t.getName() %></option>
                                        <% } %>
                                    </select>
                                    <div id="tipoIncidenciaError" class="error" style="color: red;"></div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label" for="urbanizacion">Urbanizacion</label>
                                    <select id="urbanizacion" name="urbanizacion" class="select2 form-select">
                                        <option value="sinSeleccion">--Seleccione--</option>
                                        <% for (Urbanizacion u : urbanizaciones) { %>
                                        <option value="<%= u.getId() %>" <%= (incidencia.getIdUrbanizacion() == u.getId()) ? "selected" : "" %>><%= u.getName() %></option>
                                        <% } %>
                                    </select>
                                    <div id="urbanizacionError" class="error" style="color: red;"></div>
                                </div>

                                <div class="col-12 d-flex align-items-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" value="" id="ambulancia" name="ambulancia" <% if(incidencia.isRequiereAmbulancia()) { %> checked="" <%}%> >
                                        <label class="form-check-label" for="ambulancia">Es necesario una ambulancia</label>
                                    </div>
                                    <div class="input-group ms-3">
                                        <input type="file" class="form-control" id="file" name="file" aria-describedby="inputGroupFileAddon03" aria-label="Upload" accept="image/jpeg, image/png">
                                        <div id="fotoincidenciaError" class="error" style="color: red;"></div>
                                    </div>
                                </div>

                                <div class="col-12 mt-3 text-center">
                                    <label for="currentImage" class="form-label">Imagen actual:</label>
                                    <% if (incidencia.getFotoIncidencia() != null) { %>
                                    <div>
                                        <img id="currentImage" src="<%=request.getContextPath()%>/ServletVecino?action=servirImagenIncidencia&id=<%= incidencia.getIdIncidencias() %>" alt="Imagen actual" style="max-width: 400px;"/>
                                    </div>
                                    <% } else { %>
                                    <div class="alert alert-warning" role="alert">
                                        No hay foto adjunta para este reporte.
                                    </div>
                                    <% } %>
                                    <div>
                                        <img id="previewImage" style="max-width: 400px; display: none; margin: 0 auto;"/>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between align-items-center mt-4">
                                    <button class="btn btn-label-primary" type="button" onclick="checkFieldsAndGoBack();">Atrás</button>
                                    <div class="flex-grow-1 d-flex justify-content-center">
                                        <button class="btn btn-primary" type="submit" style="background-color: #33CCFF; color: white; text-align: center;">Guardar</button>
                                    </div>
                                    <div style="width: 86px;"></div>
                                </div>
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
        var confirmLeaveNoReport = confirm('No se ha actualizado su incidencia. ¿Está seguro que quiere volver? Aceptar: Volver . Cancelar: Seguir llenando los campos');
        if (confirmLeaveNoReport) {
            window.location.href = '${pageContext.request.contextPath}/ServletVecino?action=misIncidencias';
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
<script>
    $(document).ready(function() {
        $("#actualizarIncidenciaForm").submit(function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/ServletVecino?action=actualizarIncidencia",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    if (response.success) {
                        window.location.href = "${pageContext.request.contextPath}/ServletVecino?action=misIncidencias";
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

    document.getElementById('file').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

        if (!allowedExtensions.exec(file.name)) {
            alert('Solo puedes subir imágenes (archivos con terminación jpg o png)');
            event.target.value = '';
        } else {
            const reader = new FileReader();
            reader.onload = function(e) {
                const previewImage = document.getElementById('previewImage');
                const currentImage = document.getElementById('currentImage');
                previewImage.src = e.target.result;
                previewImage.style.display = 'block';
                currentImage.style.display = 'none';
            };
            reader.readAsDataURL(file);
        }
    });
</script>
</body>
</html>
