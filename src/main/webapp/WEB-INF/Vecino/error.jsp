<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 21/06/2024
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
    <title>Error - No Autenticado</title>
</head>
<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Vecino/navBar.jsp"/>
<div class="container">
    <h1>Error: No Autenticado</h1>
    <p>Debe iniciar sesión para acceder a esta página. Por favor <a href="${pageContext.request.contextPath}/ServletLoguin">inicie sesión</a>.</p>
</div>
<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>

