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
                        <h5 class="card-title text-white mb-0">Reportar Incidencia</h5>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/ServletVecino" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label" for="fullname">Nombre de la incidencia</label>
                                    <input type="text" id="fullname" name="fullname" class="form-control" placeholder="" required />
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
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="ambulancia" id="ambulancia">
                                        <label class="form-check-label" for="ambulancia">Es necesario una ambulancia</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label class="form-check-label">La incidencia afecta a:</label>
                                    <div class="form-check form-check-inline">
                                        <input name="afectado" class="form-check-input" type="radio" value="mi_persona" id="afectado-yo" checked />
                                        <label class="form-check-label" for="afectado-yo">Mi persona</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input name="afectado" class="form-check-input" type="radio" value="otras_personas" id="afectado-otras" />
                                        <label class="form-check-label" for="afectado-otras">Otras personas</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="input-group">
                                        <button class="btn btn-outline-primary" type="button" id="inputGroupFileAddon03">Subir foto</button>
                                        <input type="file" class="form-control" id="inputGroupFile03" name="foto" aria-describedby="inputGroupFileAddon03" aria-label="Upload" accept="image/jpeg, image/png">
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <button class="btn btn-label-primary" type="button" onclick="checkFieldsAndGoBack();">Atrás</button>
                                <div class="flex-grow-1 d-flex justify-content-center">
                                    <button class="btn btn-primary" type="submit" style="background-color: #33CCFF; color: white; text-align: center;">Reportar</button>
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
</body>
</html>

