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
    <title>Error - Detalles de la Incidencia</title>
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
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Vecino/navBar.jsp"/>
<div class="container-xxl flex-grow-1 container-p-y text-center">
    <div class="card">
        <div class="card-body error-content">
            <h1 class="display-4">Error en la Incidencia</h1>
            <img src="https://as1.ftcdn.net/v2/jpg/05/55/89/72/1000_F_555897211_ktvt7N2TH42KQtafAXw7jcoJSH1SlqtG.jpg" alt="Error en la Incidencia">
            <p class="lead"><%= request.getAttribute("errorMessage") %></p>
            <p class="lead">Asegúrese de que los datos ingresados cumplen con los siguientes criterios:</p>
            <ul>
                <li>Nombre de la incidencia: No puede estar vacío y debe tener un máximo de 100 caracteres.</li>
                <li>Teléfono: Puede estar vacío, pero si se proporciona debe ser un número de 9 dígitos.</li>
                <li>Lugar exacto: No puede estar vacío y debe tener un máximo de 100 caracteres.</li>
                <li>Referencia: No puede estar vacía y debe tener un máximo de 255 caracteres.</li>
                <li>Archivo de foto: Tamaño máximo permitido es 5MB.</li>
            </ul>
            <a href="<%= request.getContextPath() %>/ServletVecino?action=mostrarInicio" class="btn btn-primary">Regresar al Inicio</a>
        </div>
    </div>
</div>
<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>


