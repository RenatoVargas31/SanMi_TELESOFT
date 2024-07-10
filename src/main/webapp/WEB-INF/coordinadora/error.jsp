<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>

    <jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
    <title>Error</title>

    <style>
        body {
            background: url('${pageContext.request.contextPath}/assets/img/backgrounds/prueba.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>

</head>
<body>

<div class="container-xxl flex-grow-1 container-p-y text-center">
    <div class="card w-75 mx-auto"> <!-- Ajusta el ancho de la tarjeta aquí -->
        <div class="card-body">
            <h1 class="display-4">Error al crear un evento o incidencia</h1>
            <div>
                <img src="https://as1.ftcdn.net/v2/jpg/05/55/89/72/1000_F_555897211_ktvt7N2TH42KQtafAXw7jcoJSH1SlqtG.jpg" alt="Error en la Incidencia" class="img-fluid"> <!-- Añade la clase img-fluid -->
            </div>
            <p class="lead"><%= request.getAttribute("errorMessage") %></p>
            <p class="lead">Asegúrese de que los datos ingresados cumplen con los siguientes criterios:</p>
            <ul>
                <li>Nombre de la incidencia: No puede estar vacío y debe tener un máximo de 100 caracteres.</li>
                <li>Teléfono: Puede estar vacío, pero si se proporciona debe ser un número de 9 dígitos.</li>
                <li>Lugar exacto: No puede estar vacío y debe tener un máximo de 100 caracteres.</li>
                <li>Referencia: No puede estar vacía y debe tener un máximo de 255 caracteres.</li>
                <li>Archivo de foto: Tamaño máximo permitido es 5MB.</li>
            </ul>
            <a href="<%= request.getContextPath() %>/ServletCoordinadora" class="btn btn-primary">Regresar al Inicio</a>
        </div>
    </div>
</div>

<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>
