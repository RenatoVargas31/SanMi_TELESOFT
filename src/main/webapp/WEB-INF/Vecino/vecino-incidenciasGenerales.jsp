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
<%@ page import="com.example.sanmi_telesoft.daos.DaoIncidencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String pageName = "incidenciasGenerales";
  request.setAttribute("pageName", pageName);
%>
<jsp:include page="../Fragmentos/FragmentosVecino/headFragmentVecino.jsp"/>
<body>
<jsp:include page="../Fragmentos/FragmentosVecino/menuFragmentVecino.jsp"/>
<jsp:include page="../Fragmentos/FragmentosVecino/navbarFragmentVecino.jsp"/>

<%
  DaoIncidencia incidenciaDao = new DaoIncidencia();
  List<Incidencia> incidencias = incidenciaDao.listarIncidencias();
  request.setAttribute("incidencias", incidencias);
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
        <c:forEach var="incidencia" items="${incidencias}">
          <tr>
            <td><input type="checkbox" class="form-check-input"></td>
            <td>${incidencia.nombreIncidencia}</td>
            <td>${incidencia.nombreUrbanizacion}</td>
            <td><span class="badge ${incidencia.estado == 'Pendiente' ? 'bg-danger' : 'bg-success'}">${incidencia.estado}</span></td>
            <td><span class="badge ${incidencia.criticidad == 'Alta' ? 'bg-danger' : 'bg-warning'}">${incidencia.criticidad}</span></td>
            <td>${incidencia.nameUsuario}</td>
            <td>
              <button type="button" class="btn btn-icon btn-icon-only btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal-ver-incidencia"><i class='bx bx-show'></i></button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <!-- Modal to add new record -->
  <div class="offcanvas offcanvas-end" id="add-new-record">
    <div class="offcanvas-header border-bottom">
      <h5 class="offcanvas-title" id="exampleModalLabel">New Record</h5>
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body flex-grow-1">
      <form class="add-new-record pt-0 row g-2" id="form-add-new-record" onsubmit="return false">
        <div class="col-sm-12">
          <label class="form-label" for="basicFullname">Full Name</label>
          <div class="input-group input-group-merge">
            <span id="basicFullname2" class="input-group-text"><i class="bx bx-user"></i></span>
            <input type="text" id="basicFullname" class="form-control dt-full-name" name="basicFullname" placeholder="John Doe" aria-label="John Doe" aria-describedby="basicFullname2"/>
          </div>
        </div>
        <div class="col-sm-12">
          <label class="form-label" for="basicPost">Post</label>
          <div class="input-group input-group-merge">
            <span id="basicPost2" class="input-group-text"><i class='bx bxs-briefcase'></i></span>
            <input type="text" id="basicPost" name="basicPost" class="form-control dt-post" placeholder="Web Developer" aria-label="Web Developer" aria-describedby="basicPost2"/>
          </div>
        </div>
        <div class="col-sm-12">
          <label class="form-label" for="basicEmail">Email</label>
          <div class="input-group input-group-merge">
            <span class="input-group-text"><i class="bx bx-envelope"></i></span>
            <input type="text" id="basicEmail" name="basicEmail" class="form-control dt-email" placeholder="john.doe@example.com" aria-label="john.doe@example.com"/>
          </div>
          <div class="form-text">
            You can use letters, numbers & periods
          </div>
        </div>
        <div class="col-sm-12">
          <label class="form-label" for="basicDate">Joining Date</label>
          <div class="input-group input-group-merge">
            <span id="basicDate2" class="input-group-text"><i class='bx bx-calendar'></i></span>
            <input type="text" class="form-control dt-date" id="basicDate" name="basicDate" aria-describedby="basicDate2" placeholder="MM/DD/YYYY" aria-label="MM/DD/YYYY"/>
          </div>
        </div>
        <div class="col-sm-12">
          <label class="form-label" for="basicSalary">Salary</label>
          <div class="input-group input-group-merge">
            <span id="basicSalary2" class="input-group-text"><i class='bx bx-dollar'></i></span>
            <input type="number" id="basicSalary" name="basicSalary" class="form-control dt-salary" placeholder="12000" aria-label="12000" aria-describedby="basicSalary2"/>
          </div>
        </div>
        <div class="col-sm-12">
          <button type="submit" class="btn btn-primary data-submit me-sm-3 me-1">Submit</button>
          <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="offcanvas">Cancel</button>
        </div>
      </form>
    </div>
  </div>
  <!--/ DataTable with Buttons -->
  <hr class="my-5">
</div>
<!-- / Content -->

<jsp:include page="../Fragmentos/FragmentosVecino/strylesFragmentVecino.jsp"/>
</body>
</html>



