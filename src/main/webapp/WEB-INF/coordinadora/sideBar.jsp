<%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 15/06/2024
  Time: 00:25
  To change this template use File | Settings | File Templates.
--%>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">


    <div class="app-brand demo ">
        <a href="<%= request.getContextPath()%>/ServletCoordinadora" class="app-brand-link">
            <img class="img-fluid" width="33" src="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp"
                 alt="logo-sanmiguel">
            <span class="app-brand-text demo menu-text fw-bold ms-4">SanMI</span>
        </a>
        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>


    <ul class="menu-inner py-1">
        <li class="menu-item ${activeMenu == 'Inicio' ? 'active' : ''}">
            <a href="<%= request.getContextPath()%>/ServletCoordinadora"  class="menu-link">
                <i class="menu-icon tf-icons bx bx-home"></i>
                <div class="text-truncate" data-i18n="Inicio">Inicio</div>
            </a>
        </li>

        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text"
                                                           data-i18n="Eventos">Eventos</span></li>

        <!-- Eventos -->
        <li class="menu-item ${activeMenu == 'Eventos' ? 'active open' : ''}">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-calendar-event'></i>
                <div class="text-truncate" data-i18n="Eventos">Eventos</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${activeMenuSub == 'Eventos1' ? 'active' : ''}">
                    <a href="<%= request.getContextPath()%>/ServletCoordinadora?action=listarEventos" class="menu-link">
                        <div class="text-truncate" data-i18n="Todos los eventos">Todos los eventos</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenuSub == 'Eventos2' ? 'active' : ''}">
                    <a href="<%= request.getContextPath()%>/ServletCoordinadora?action=crearEventos" class="menu-link">
                        <div class="text-truncate" data-i18n="Crear eventos">Crear eventos</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenuSub == 'Eventos3' ? 'active' : ''}">
                    <a href="<%= request.getContextPath()%>/ServletCoordinadora?action=verEventos" class="menu-link">
                        <div class="text-truncate" data-i18n="Mis eventos">Mis eventos</div>
                    </a>
                </li>
            </ul>
        </li>

        <li class="menu-header small text-uppercase"><span class="menu-header-text" data-i18n="Incidencias">Incidencias</span>
        </li>
        <!-- Incidenciass -->
        <li class="menu-item ${activeMenu == 'Incidencias' ? 'active open' : ''}">
            <a href="javascript:void(0);" target="_blank" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-bell"></i>
                <div class="text-truncate" data-i18n="Incidencias">Incidencias</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${activeMenuSub == 'Incidencias1' ? 'active' : ''}">
                    <a href="<%= request.getContextPath()%>/ServletCoordinadora?action=mostrarReportarIncidencias" class="menu-link">
                        <div class="text-truncate" data-i18n="Reportar incidencias">Reportar incidencias</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenuSub == 'Incidencias2' ? 'active' : ''}">
                    <a href="<%= request.getContextPath()%>/ServletCoordinadora?action=listarIncidencias" class="menu-link">
                        <div class="text-truncate" data-i18n="Todas las incidencias">Todas las incidencias</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenuSub == 'Incidencias3' ? 'active' : ''}">
                    <a href="<%= request.getContextPath()%>/ServletCoordinadora?action=listarMisIncidencias" class="menu-link">
                        <div class="text-truncate" data-i18n="Mis incidencias">Mis incidencias</div>
                    </a>
                </li>
            </ul>
        </li>

        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text"
                                                           data-i18n="Ayuda">Ayuda</span></li>
        <!-- Cards -->
        <li class="menu-item ${activeMenu == 'Ayuda' ? 'active' : ''}">
            <a href="<%= request.getContextPath()%>/ServletCoordinadora?action=mostrarAyuda" class="menu-link">
                <i class="menu-icon tf-icons bx bx-help-circle"></i>
                <div class="text-truncate" data-i18n="Ayuda">Ayuda</div>
            </a>
        </li>

    </ul>


</aside>