<%--
  Created by IntelliJ IDEA.
  User: jaimi
  Date: 14/06/2024
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentPage = (String) request.getAttribute("pageName");
%>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="${pageContext.request.contextPath}/vecino_index.jsp" class="app-brand-link">
                    <img class="img-fluid" width="33" src="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp" alt="logo-sanmiguel">
                    <span class="app-brand-text demo menu-text fw-bold ms-4">SanMI</span>
                </a>
                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>

             <ul class="menu-inner py-1">
                <!-- Inicio -->
                 <li class="menu-item <%= "inicio".equals(currentPage) ? "active" : "" %>">
                     <a href="${pageContext.request.contextPath}/vecino_index.html" class="menu-link">
                         <i class="menu-icon tf-icons bx bx-home-alt"></i>
                         <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                     </a>
                 </li>
                 <li class="menu-header small text-uppercase">
                     <span class="menu-header-text" data-i18n="Eventos">Eventos</span>
                 </li>
                 <li class="menu-item <%= ("catalogoEventos".equals(currentPage) || "eventosInscritos".equals(currentPage)) ? "active open" : "" %>">
                     <a href="javascript:void(0);" class="menu-link menu-toggle">
                         <i class='menu-icon tf-icons bx bx-book-open'></i>
                         <div class="text-truncate" data-i18n="Eventos">Eventos</div>
                     </a>
                     <ul class="menu-sub">
                         <li class="menu-item <%= "catalogoEventos".equals(currentPage) ? "active" : "" %>">
                             <a href="${pageContext.request.contextPath}/vecino-catalogoEventos.html" class="menu-link">
                                 <div class="text-truncate" data-i18n="Catálogo de eventos">Catálogo de eventos</div>
                             </a>
                         </li>
                         <li class="menu-item <%= "eventosInscritos".equals(currentPage) ? "active" : "" %>">
                             <a href="${pageContext.request.contextPath}/app-academy-course-details.html" class="menu-link">
                                 <div class="text-truncate" data-i18n="Eventos inscritos">Eventos inscritos</div>
                             </a>
                         </li>
                     </ul>
                 </li>
                 <li class="menu-header small text-uppercase">
                     <span class="menu-header-text" data-i18n="Incidencias">Incidencias</span>
                 </li>
                 <li class="menu-item <%= ("reportarIncidencia".equals(currentPage) || "misIncidencias".equals(currentPage) || "incidenciasGenerales".equals(currentPage)) ? "active open" : "" %>">
                     <a href="javascript:void(0);" class="menu-link menu-toggle">
                         <i class="menu-icon tf-icons bx bx-bell"></i>
                         <div class="text-truncate" data-i18n="Incidencias">Incidencias</div>
                     </a>
                     <ul class="menu-sub">
                         <li class="menu-item <%= "reportarIncidencia".equals(currentPage) ? "active" : "" %>">
                             <a href="${pageContext.request.contextPath}/vecino-reportarIncidencia.html" class="menu-link">
                                 <div class="text-truncate" data-i18n="Reportar incidencia">Reportar incidencia</div>
                             </a>
                         </li>
                         <li class="menu-item <%= "misIncidencias".equals(currentPage) ? "active" : "" %>">
                             <a href="${pageContext.request.contextPath}/vecino-misIncidencias.html" class="menu-link">
                                 <div class="text-truncate" data-i18n="Mis incidencias">Mis incidencias</div>
                             </a>
                         </li>
                         <li class="menu-item <%= "incidenciasGenerales".equals(currentPage) ? "active" : "" %>">
                             <a href="#" class="menu-link">
                                 <div class="text-truncate" data-i18n="Incidencias generales">Incidencias generales</div>
                             </a>
                         </li>
                     </ul>
                 </li>
                 <!-- Components -->
                 <li class="menu-header small text-uppercase">
                     <span class="menu-header-text" data-i18n="Ayuda">Ayuda</span>
                 </li>
                 <li class="menu-item <%= "ayuda".equals(currentPage) ? "active" : "" %>">
                     <a href="${pageContext.request.contextPath}/vecino_ayuda.html" class="menu-link">
                         <i class="menu-icon tf-icons bx bx-help-circle"></i>
                         <div class="text-truncate" data-i18n="Ayuda">Ayuda</div>
                     </a>
                 </li>
             </ul>
        </aside>
        <!-- / Menu -->
        <!-- Layout container -->
        <div class="layout-page">



