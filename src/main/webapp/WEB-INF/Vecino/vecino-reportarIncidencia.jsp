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
                        <form id="reportarIncidenciaForm" action="${pageContext.request.contextPath}/ServletVecino?action=reportarIncidencia" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="nombreIncidencia" class="form-label">Nombre de la Incidencia</label>
                                    <input type="text" class="form-control" id="nombreIncidencia" name="nombreIncidencia" placeholder="Nombre de la Incidencia" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="phone">Teléfono</label>
                                    <input type="text" id="phone" name="phone" class="form-control phone-mask" placeholder="Opcional" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="LugarExacto">Lugar Exacto</label>
                                    <textarea name="LugarExacto" class="form-control" id="LugarExacto" rows="2" placeholder="Av, jr, calle." required></textarea>
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="Referencia">Referencia</label>
                                    <input type="text" id="Referencia" name="Referencia" class="form-control" placeholder="Cerca a . . ." required />
                                </div>
                                <div class="col-12">
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="requiereAmbulancia" name="requiereAmbulancia">
                                        <label class="form-check-label" for="requiereAmbulancia">Es necesario una ambulancia</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="input-group">
                                        <button class="btn btn-outline-primary" type="button" id="inputGroupFileAddon03">Subir foto</button>
                                        <input type="file" class="form-control" id="inputGroupFile03" name="fotoincidencia" aria-describedby="inputGroupFileAddon03" aria-label="Upload" accept="image/jpeg, image/png">
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <button class="btn btn-label-primary" type="button" onclick="checkFieldsAndGoBack();">Atrás</button>
                                <div class="flex-grow-1 d-flex justify-content-center">
                                    <button class="btn btn-primary" type="button" onclick="if (validateForm()) { document.getElementById('reportarIncidenciaForm').submit(); }" style="background-color: #33CCFF; color: white; text-align: center;">Reportar</button>
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

</body>
</html>
