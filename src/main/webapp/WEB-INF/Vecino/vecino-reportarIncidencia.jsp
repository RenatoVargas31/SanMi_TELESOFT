<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 15/06/2024
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pageName = "reportarIncidencia";
    request.setAttribute("pageName", pageName);
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/ServletLoguin");
        return;
    }
%>
<%@ page import="com.example.sanmi_telesoft.beans.TipoIncidencia, com.example.sanmi_telesoft.beans.Urbanizacion, java.util.ArrayList" %>
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
</div>

<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>

<script>
    // Verifica que todos los campos de texto estén llenos y que un archivo haya sido cargado
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
                window.location.href = '${pageContext.request.contextPath}/ServletVecino?action=incidenciasGenerales';
            }
        } else {
            const confirmLeaveNoReport = confirm('No ha registrado los datos necesarios, ¿Está seguro que quiere volver? No se registrará su incidencia. Aceptar: Volver a lista general de incidencias. Cancelar: Seguir llenando los campos');
            if (confirmLeaveNoReport) {
                window.location.href = '${pageContext.request.contextPath}/ServletVecino?action=incidenciasGenerales';
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
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
                previewImage.src = e.target.result;
                previewImage.style.display = 'block';
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
                url: "${pageContext.request.contextPath}/ServletVecino?action=reportarIncidencia",
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
</script>
</body>
</html>
