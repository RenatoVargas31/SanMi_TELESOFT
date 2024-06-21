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
<div class="container-xxl flex-grow-1 container-p-y text-center">
    <div class="card">
        <div class="card-body">

            <h1 class="display-4">Error: No Autenticado</h1>
            <img src="https://as1.ftcdn.net/v2/jpg/05/55/89/72/1000_F_555897211_ktvt7N2TH42KQtafAXw7jcoJSH1SlqtG.jpg" alt="Error: No Autenticado" style="max-width: 20%; height: auto; margin-bottom: 20px;">
            <p class="lead">Debe iniciar sesión para acceder a esta página. Por favor <a href="<%= request.getContextPath() %>/ServletLoguin">inicie sesión</a>.</p>
            <a href="<%= request.getContextPath() %>/ServletLoguin" class="btn btn-primary">Iniciar Sesión</a>
        </div>
    </div>
</div>
<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>

