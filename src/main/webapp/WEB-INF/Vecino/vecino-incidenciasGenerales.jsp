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
    <div class="card-datatable table-responsive">
      <table id="table-incidenciasGenerales" class="datatables-basic table border-top">
        <h3 class="m-4 fw-bold">Incidencias Generales</h3>
        <thead>
        <tr>
          <th><input type="checkbox" class="form-check-input" id="select-all"></th>
          <th>Incidencia</th>
          <th>Lugar</th>
          <th>Estado</th>
          <th>Prioridad</th>
          <th>Usuario</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
          int i = 1;
          for (Incidencia incidencia : incidencias) {
            String modalId = "modalScrollable" + i;
        %>
        <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="modalScrollableTitle<%= i %>">Detalles del Reporte.</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <p>Estimado Serenazgo de la Zona,</p>
                <% if(incidencia.getDescripcionSolucion() == null) { %>
                <p>Me dirijo a ustedes con preocupación para informar sobre un incidente que está ocurriendo en este momento en <%=incidencia.getLugarIncidencia()%> de San Miguel.</p>
                <% } else { %>
                <p><%= incidencia.getDescripcionSolucion() %></p>
                <% } %>
                <p>Atentamente,</p>
                <p><%= incidencia.getNameUsuario() %></p>
                <div class="card">
                  <%
                    if (incidencia.getFotoIncidencia() != null) { %>
                  <img class="card-img-top" src="${pageContext.request.contextPath}/ServletVecino?action=servirImagenIncidencia&id=<%= incidencia.getIdIncidencias() %>" alt="Foto del reporte" />
                  <% } else { %>
                  <div class="alert alert-warning text-center" role="alert" style="font-size: 1.2em; font-weight: bold; color: blue;">
                    No hay foto adjunta para este reporte.
                  </div>
                  <% } %>
                  <div class="card-body">
                    <h5 class="card-title">Foto del reporte</h5>
                    <p class="card-text">Lugar: <%= incidencia.getLugarIncidencia() %></p>
                    <p class="card-text">Referencia: <%= incidencia.getReferenciaIncidencia() %></p>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
              </div>
            </div>
          </div>
          <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
              <div class="modal-content">
                <div class="modal-header" style="background-color: #154360;">
                  <h5 class="modal-title text-white" id="modalScrollableTitle<%= i %>">Detalles del Reporte.</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <p class="text-center">Estimado Serenazgo de la Zona,</p>

                  <% if(incidencia.getDescripcionSolucion() == null) { %>
                  <p class="text-center">Me dirijo a ustedes con preocupación para informar sobre un incidente que está ocurriendo en este momento en <%=incidencia.getLugarIncidencia()%> de San Miguel.</p>
                  <% } else { %>
                  <p class="text-center"><%= incidencia.getDescripcionSolucion() %></p>
                  <% } %>

                  <p class="text-center">Atentamente,</p>
                  <p class="text-center"><%= incidencia.getNameUsuario() %></p>

                  <div class="card h-100">
                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/elements/incendio1.jpg" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title text-center">Foto del reporte</h5>
                      <p class="card-text text-center">Lugar: <%= incidencia.getLugarIncidencia() %></p>
                      <p class="card-text text-center">Referencia: <%= incidencia.getReferenciaIncidencia() %></p>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">OK</button>
                </div>
              </div>
            </div>
          </div>
          <tr>
            <td><input type="checkbox" class="form-check-input"></td>
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
            <td><%= incidencia.getNameUsuario() %></td>
            <td>
              <button type="button"
                      class="btn btn-icon btn-icon-only btn-outline-primary btn-sm"
                      data-bs-toggle="modal" data-bs-target="#<%= modalId %>">
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

<script>
  function cargarDetallesIncidencia(idIncidencia) {
    fetch('<%= request.getContextPath() %>/ServletVecino?action=obtenerDetallesIncidencia&idIncidencia=' + idIncidencia)
            .then(response => response.json())
            .then(data => {
              document.getElementById('detalle-nombreIncidencia').innerText = 'Nombre: ' + data.nombreIncidencia;
              document.getElementById('detalle-lugarIncidencia').innerText = 'Lugar: ' + data.lugarExacto;
              document.getElementById('detalle-referenciaIncidencia').innerText = 'Referencia: ' + data.referenciaIncidencia;
              document.getElementById('detalle-contactoIncidencia').innerText = 'Contacto: ' + data.contactoIncidencia;
              document.getElementById('detalle-requiereAmbulancia').innerText = 'Requiere Ambulancia: ' + (data.requiereAmbulancia ? 'Sí' : 'No');
              document.getElementById('detalle-requierePolicia').innerText = 'Requiere Policía: ' + (data.requierePolicia ? 'Sí' : 'No');
              document.getElementById('detalle-requiereBombero').innerText = 'Requiere Bombero: ' + (data.requiereBombero ? 'Sí' : 'No');
              document.getElementById('detalle-descripcionSolucion').innerText = 'Descripción Solución: ' + data.descripcionSolucion;
              document.getElementById('detalle-nameUsuario').innerText = 'Usuario: ' + data.nameUsuario;
            })
            .catch(error => console.error('Error:', error));
  }
</script>

</body>
</html>




