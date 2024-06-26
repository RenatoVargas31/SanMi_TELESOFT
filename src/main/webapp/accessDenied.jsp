<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 25/06/2024
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="WEB-INF/Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
    <title>Acceso Denegado</title>
</head>
<body>
<jsp:include page="WEB-INF/Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="WEB-INF/Vecino/navBar.jsp"/>
<div class="container-xxl flex-grow-1 container-p-y text-center">
    <div class="card">
        <div class="card-body">
            <h1 class="display-4">Acceso Denegado</h1>
            <img src="https://as2.ftcdn.net/v2/jpg/05/65/69/83/1000_F_565698378_GH5Tjc87HXUMIbB0eC5FSbdTbChMAj3E.jpg" alt="Acceso Denegado" style="max-width: 20%; height: auto; margin-bottom: 20px;">
            <p class="lead">No tiene permisos para acceder a esta página. Por favor, contacte al administrador si cree que esto es un error.</p>
            <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-primary">Regresar al Inicio</a>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>

