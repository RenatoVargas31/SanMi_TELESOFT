<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 3/06/2024
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.sanmi_telesoft.beans.Incidencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String pageName = "incidenciasGenerales";
  request.setAttribute("pageName", pageName);
%>
<jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Vecino/navBar.jsp"/>

<%
  List<Incidencia> incidencias = (List<Incidencia>) request.getAttribute("incidencias");
%>

<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
  <!-- DataTable with Buttons -->
  <div class="card">
    <div class="card-datatable table-responsive">
      <table id="table-incidenciasGenerales" class="datatables-basic table border-top">
        <h3 class="m-4 fw-bold">Incidencias Generales</h3>
        <thead>
        <tr>
          <th><input type="checkbox" class="form-check-input" id="select-all"></th>
          <th>Incidencia</th>
          <th>Urbanización</th>
          <th>Estado</th>
          <th>Prioridad</th>
          <th>Usuario</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
          for (int i = 0; i < incidencias.size(); i++) {
            Incidencia incidencia = incidencias.get(i);
        %>
        <tr>
          <td><input type="checkbox" class="form-check-input"></td>
          <td><%= incidencia.getNombreIncidencia() %></td>
          <td><%= incidencia.getNombreUrbanizacion() %></td>
          <td><span class="badge <%= incidencia.getEstado() == 1 ? "bg-danger" : "bg-success" %>"><%= incidencia.getEstado() == 1 ? "Pendiente" : "Resuelto" %></span></td>
          <td><span class="badge <%= incidencia.getCriticidad() == 1 ? "bg-danger" : "bg-warning" %>"><%= incidencia.getCriticidad() == 1 ? "Alta" : "Media" %></span></td>
          <td><%= incidencia.getNameUsuario() %></td>
          <td>
            <button type="button" class="btn btn-icon btn-icon-only btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i class='bx bx-show'></i></button>
          </td>
        </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>
  </div>

  <!--/ DataTable with Buttons -->
  <hr class="my-5">
</div>
<!-- / Content -->

<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>




