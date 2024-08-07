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
<style>
  /* Personalización adicional del modal */
  .modal-content {
    border-radius: 15px;
    padding: 20px;
    background: linear-gradient(145deg, #f0f0f0, #cacaca);
  }
  .modal-header {
    background-color: #1A4D8F;
    color: white;
    border-bottom: 1px solid #dee2e6;
    border-radius: 15px 15px 0 0;
  }
  .modal-footer {
    border-top: 1px solid #dee2e6;
    border-radius: 0 0 15px 15px;
  }
  .modal-title {
    color: white;
  }
  .modal-body {
    font-size: 1.1rem;
    text-align: center;
  }
  .btn-close {
    background-color: white;
    border-radius: 50%;
  }
  .btn-secondary, .btn-danger {
    margin: 0 10px;
  }
</style>
<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
  <!-- DataTable with Buttons -->
  <div class="card">
    <div class="card-header">
      <h3 class="m-4 fw-bold">Incidencias Generales</h3>
      <div class="dropdown">
        <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
          Filtrar Incidencias
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletVecino?action=filtrarIncidenciasDia">Incidencias del Día</a></li>
          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletVecino?action=filtrarIncidenciasSemana">Incidencias de la Semana</a></li>
          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletVecino?action=incidenciasGenerales">Todas las Incidencias</a></li>
        </ul>
      </div>
    </div>
    <div class="card-datatable table-responsive">
      <table id="table-incidenciasGenerales" class="datatables-basic table border-top">
        <thead>
        <tr>
          <th>Incidencia</th>
          <th>Lugar</th>
          <th>Estado</th>
          <th>Prioridad</th>
          <th>Fecha de Registro</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
          int i = 1;
          for (Incidencia incidencia : incidencias) {
        %>
        <tr>
          <td><%= incidencia.getNombreIncidencia() %></td>
          <td><%= incidencia.getLugarIncidencia() %></td>
          <% if (incidencia.getEstado() == 1) { %>
          <td><span class="badge bg-danger">Nueva</span></td>
          <% } else if (incidencia.getEstado() == 2) { %>
          <td><span class="badge bg-warning">Procesando</span></td>
          <% } else if (incidencia.getEstado() == 3) { %>
          <td><span class="badge bg-success">Resuelta</span></td>
          <% } %>
          <% if (incidencia.getCriticidad() == 1) { %>
          <td><span class="badge bg-primary">Baja</span></td>
          <% } else if (incidencia.getCriticidad() == 2) { %>
          <td><span class="badge bg-warning">Media</span></td>
          <% } else if (incidencia.getCriticidad() == 3) { %>
          <td><span class="badge bg-danger">Alta</span></td>
          <% } else { %>
          <td><span class="badge bg-secondary">No asignado</span></td>
          <% } %>
          <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(incidencia.getFechaRegistro()) %></td>
          <td>
            <button type="button"
                    class="btn btn-icon btn-icon-only btn-outline-primary btn-sm"
                    onclick="window.location.href='${pageContext.request.contextPath}/ServletVecino?action=verDetallesIncidenciaGeneral&id=<%= incidencia.getIdIncidencias() %>';">
              <i class='bx bx-show'></i>
            </button>
          </td>
        </tr>
        <%
            i++;
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


<!-- Footer -->
<footer class="content-footer footer bg-footer-theme">
  <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
    <div class="mb-2 mb-md-0">
      ©
      <script>
        document.write(new Date().getFullYear())

      </script>
      , made by <a href="https://themeselection.com/" target="_blank"
                   class="footer-link fw-medium">Telesoft</a>
    </div>

  </div>
</footer>
<!-- / Footer -->


<div class="content-backdrop fade"></div>
</div>
<!-- Content wrapper -->
</div>
<!-- / Layout page -->
</div>


<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>


<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

</div>

<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>


</body>
</html>




