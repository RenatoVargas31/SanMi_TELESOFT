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
    <jsp:include page="WEB-INF/Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
    <title>Error en el evento</title>
    <style>
        .error-content {
            text-align: center;
        }
        .error-content img {
            max-width: 20%;
            height: auto;
            margin-bottom: 20px;
        }
        .error-content ul {
            display: inline-block;
            text-align: left;
        }
    </style>
</head>
<body>
<jsp:include page="WEB-INF/Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="WEB-INF/Vecino/navBar.jsp"/>
<div class="container-xxl flex-grow-1 container-p-y text-center">
    <div class="card">
        <div class="card-body error-content">
            <h1 class="display-4">Error en el evento</h1>
            <img src="https://as1.ftcdn.net/v2/jpg/05/55/89/72/1000_F_555897211_ktvt7N2TH42KQtafAXw7jcoJSH1SlqtG.jpg" alt="Error en la Incidencia">

            <p class="lead">Asegúrate de que el URL es correcto</p>
            <div class="row align-items-center justify-content-center">
            <a href="<%= request.getContextPath() %>/ServletVecino?action=mostrarInicio" class="btn btn-primary">Regresar al Inicio</a>
</div>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>


