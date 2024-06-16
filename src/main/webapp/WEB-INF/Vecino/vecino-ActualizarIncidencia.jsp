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
%>
<jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Fragmentos/FragmentosVecino/navbarFragmentVecino.jsp"/>

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
                        <form action="${pageContext.request.contextPath}/ServletVecino?action=actualizarIncidencia" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <input type="hidden" name="id" value="${incidencia.idIncidencias}" />
                                <div class="col-12">
                                    <label class="form-label" for="LugarExacto-actualizar">Lugar Exacto</label>
                                    <textarea name="LugarExacto" class="form-control" id="LugarExacto-actualizar" rows="2" placeholder="Av, jr, calle." required>${incidencia.lugarIncidencia}</textarea>
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="Referencia-actualizar">Referencia</label>
                                    <input type="text" id="Referencia-actualizar" name="Referencia" class="form-control" placeholder="Cerca a . . ." value="${incidencia.referenciaIncidencia}" required />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="phone-actualizar">Teléfono</label>
                                    <input type="text" id="phone-actualizar" name="phone" class="form-control phone-mask" placeholder="Opcional" value="${incidencia.telefono}" />
                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="ambulancia" id="ambulancia-actualizar" ${incidencia.requiereAmbulancia ? 'checked' : ''}>
                                        <label class="form-check-label" for="ambulancia-actualizar">Es necesario una ambulancia</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label class="form-check-label" for="victima-actualizar">La incidencia afecta a:</label>
                                    <input type="text" id="victima-actualizar" name="victima" class="form-control" placeholder="Nombre de la víctima" value="${incidencia.victima}" />
                                </div>
                                <div class="col-12">
                                    <div class="input-group">
                                        <button class="btn btn-outline-primary" type="button" id="inputGroupFileAddon03-actualizar">Subir foto</button>
                                        <input type="file" class="form-control" id="inputGroupFile03-actualizar" name="foto" aria-describedby="inputGroupFileAddon03-actualizar" aria-label="Upload" accept="image/jpeg, image/png">
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <button class="btn btn-label-primary" type="button" onclick="checkFieldsAndGoBack();">Atrás</button>
                                <div class="flex-grow-1 d-flex justify-content-center">
                                    <button class="btn btn-primary" type="submit" style="background-color: #33CCFF; color: white; text-align: center;">Actualizar</button>
                                </div>
                                <div style="width: 86px;"> <!-- This empty div serves as a spacer to maintain balance -->
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
        let lugarExacto = document.getElementById('LugarExacto-actualizar').value.trim();
        let referencia = document.getElementById('Referencia-actualizar').value.trim();
        let fileInput = document.getElementById('inputGroupFile03-actualizar');

        if (!lugarExacto || !referencia || fileInput.files.length === 0) {
            alert('Por favor, complete todos los campos obligatorios y suba una imagen.');
            return false;
        }
        return true;
    }

    function checkFieldsAndGoBack() {
        if (validateForm()) {
            var confirmLeave = confirm('Todavía no ha actualizado su incidencia. ¿Desea regresar de todas formas o actualizar la incidencia ahora? OK para regresar, Cancelar para seguir escribiendo.');
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

    document.getElementById('inputGroupFile03-actualizar').addEventListener('change', function(event) {
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
