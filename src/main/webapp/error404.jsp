<%--
  Created by IntelliJ IDEA.
  User: Alejandro
  Date: 2/07/2024
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Página No Encontrada</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 50px;
            margin: 0;
            color: #ff6f61;
        }
        h2 {
            font-size: 24px;
            margin: 20px 0;
        }
        p {
            font-size: 16px;
            margin: 20px 0;
        }
        a {
            color: #007bff;
            text-decoration: none;
            border: 1px solid #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        a:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>404</h1>
    <h2>Oops! Página No Encontrada</h2>
    <p>Lo sentimos, pero la página que estás buscando no existe, ha sido eliminada o está temporalmente fuera de servicio.</p>
    <a href="<%= request.getContextPath() %>/ServletVecino">Volver al Inicio</a>
</div>
</body>
</html>
