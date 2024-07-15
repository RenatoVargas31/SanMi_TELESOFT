<%@ page import="com.example.sanmi_telesoft.beans.Prioridad" %>
<%@ page import="com.example.sanmi_telesoft.beans.PersonalAmbulancia" %>
<%@ page import="com.example.sanmi_telesoft.beans.TipoSereno" %>
<%@ page import="com.example.sanmi_telesoft.dto.serenoYtipo" %><%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 16/06/2024
  Time: 05:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="incidencia" class="com.example.sanmi_telesoft.beans.Incidencia" scope="request"/>
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
<jsp:useBean id="listaAmbulancia" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.PersonalAmbulancia>" scope="request" />
<jsp:useBean id="listaPrioridad" type="java.util.ArrayList<com.example.sanmi_telesoft.beans.Prioridad>" scope="request" />
<jsp:useBean id="listaSereno" type="java.util.ArrayList<com.example.sanmi_telesoft.dto.serenoYtipo>" scope="request" />
<jsp:include page="head.jsp"/>

<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
<jsp:include page="sideBar.jsp"/>
    <div class="layout-page">
<jsp:include page="navBar.jsp"/>

<!-- Content wrapper -->
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="card">
                    <div class="card-header" style="background-color: #33CCFF; color: white; text-align: center;">
                        <h5 class="card-title text-white mb-0">Guardar respuesta</h5>
                    </div>
                    <div class="card-body">
                        <form id="actualizarIncidenciaForm" method="post" action="<%=request.getContextPath()%>/ServletSerenazgo?action=solucionIncidencia" enctype="multipart/form-data">
                            <input type="hidden" name="incidencia_id" value="<%= incidencia.getIdIncidencias()%>"/>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label" for="tipoPrioridad">Criticidad</label>
                                    <select id="tipoPrioridad" name="tipoPrioridad" class="select2 form-select">
                                        <option value="sinSeleccion">--Seleccione--</option>
                                        <% for (Prioridad p : listaPrioridad) { %>
                                        <option value="<%= p.getId() %>" <%= (incidencia.getIdTipoIncidencia() == p.getId()) ? "selected" : "" %>><%= p.getNombre() %></option>
                                        <% } %>
                                    </select>
                                    <div id="tipoIncidenciaError" class="error" style="color: red;"></div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label" for="personalAmbulancia">Personal de Ambulancia</label>
                                    <select id="personalAmbulancia" name="personalAmbulancia" class="select2 form-select">
                                        <option value="sinSeleccion">--Seleccione--</option>
                                        <% for (PersonalAmbulancia p : listaAmbulancia) { %>
                                        <option value="<%= p.getId() %>" <%= (incidencia.getIdIncidencias() == p.getId()) ? "selected" : "" %>><%= p.getNombre() + " "+p.getApellido()%></option>
                                        <% } %>
                                    </select>
                                    <div id="urbanizacionError" class="error" style="color: red;"></div>
                                </div>




                                <div class="col-12 d-flex align-items-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" value="" id="ambulancia" name="ambulancia" <% if(incidencia.isRequiereAmbulancia()) { %> checked="" <%}%> >
                                        <label class="form-check-label" for="ambulancia">Es necesario una ambulancia</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" value="" id="policia" name="policia" <% if(incidencia.isRequierePolicia()) { %> checked="" <%}%> >
                                        <label class="form-check-label" for="ambulancia">Es necesario llamar a la policía</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" value="" id="bombero" name="bombero" <% if(incidencia.isRequierePolicia()) { %> checked="" <%}%> >
                                        <label class="form-check-label" for="bombero">Es necesario un bombero</label>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label" for="tipoSereno">Tipo de serenazgo</label>
                                        <select id="tipoSereno" name="tipoSereno" class="select2 form-select">
                                            <option value="sinSeleccion">--Seleccione--</option>
                                            <% for (serenoYtipo t : listaSereno) { %>
                                            <option value="<%= t.getId() %>" <%= (incidencia.getNameUsuario() == t.getNombre()) ? "selected" : "" %>><%= t.getNombre()%> - <%= t.getTipo()%></option>
                                            <% } %>
                                        </select>
                                        <div id="serenoError" class="error" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="descrpcion">Descripción </label>
                                    <input type="text" class="form-control" name="descrpcion" id="descrpcion" maxlength="255"/>
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

<jsp:include page="styles.jsp"/>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('actualizarIncidenciaForm');
            const tipoPrioridad = document.getElementById('tipoPrioridad');
            const personalAmbulancia = document.getElementById('personalAmbulancia');
            const tipoSereno = document.getElementById('tipoSereno');
            const fileInput = document.getElementById('file');
            const previewImage = document.getElementById('previewImage');

            form.addEventListener('submit', function(event) {
                let isValid = true;

                // Validar tipoPrioridad
                if (tipoPrioridad.value === 'sinSeleccion') {
                    showError('tipoIncidenciaError', 'Debe seleccionar una criticidad.');
                    isValid = false;
                } else {
                    clearError('tipoIncidenciaError');
                }

                // Validar personalAmbulancia
                if (personalAmbulancia.value === 'sinSeleccion') {
                    showError('urbanizacionError', 'Debe seleccionar el personal de ambulancia.');
                    isValid = false;
                } else {
                    clearError('urbanizacionError');
                }

                // Validar tipoSereno
                if (tipoSereno.value === 'sinSeleccion') {
                    showError('serenoError', 'Debe seleccionar el tipo de serenazgo.');
                    isValid = false;
                } else {
                    clearError('serenoError');
                }

                // Validar archivo (opcional, si no es obligatorio)
                if (fileInput.files.length > 0) {
                    const file = fileInput.files[0];
                    const validTypes = ['image/jpeg', 'image/png'];
                    if (!validTypes.includes(file.type)) {
                        showError('fotoincidenciaError', 'El archivo debe ser una imagen en formato JPEG o PNG.');
                        isValid = false;
                    } else {
                        clearError('fotoincidenciaError');
                        // Mostrar imagen previa
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            previewImage.src = e.target.result;
                            previewImage.style.display = 'block';
                        };
                        reader.readAsDataURL(file);
                    }
                }

                if (!isValid) {
                    event.preventDefault();
                }
            });

            function showError(id, message) {
                document.getElementById(id).textContent = message;
            }

            function clearError(id) {
                document.getElementById(id).textContent = '';
            }

            function checkFieldsAndGoBack() {
                // Aquí puedes implementar la lógica para regresar a la página anterior
                window.history.back();
            }
        });
    </script>
</body>
</html>
