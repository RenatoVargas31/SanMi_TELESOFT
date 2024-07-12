<%--
  Created by IntelliJ IDEA.
  User: Sergio
  Date: 15/06/2024
  Time: 01:49
  To change this template use File | Settings | File Templates.
--%>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">


    <div class="app-brand demo ">
        <a href="<%=request.getContextPath()%>/ServletSerenazgo?action=mostrarInicio" class="menu-link" class="app-brand-link">
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

        <!-- Layouts -->

        <!-- Front Pages -->

        <!-- Apps & Pages -->
        <!--<li class="menu-header small text-uppercase">
          <span class="menu-header-text" data-i18n="Inicio">Inicio</span>
        </li>-->




        <!-- e-commerce-app menu start -->
        <!-- e-commerce-app menu end -->
        <!-- Academy menu start -->
        <li class="menu-item ${activeMenu == 'Inicio' ? 'active' : ''}">
            <a href="<%=request.getContextPath()%>/ServletSerenazgo?action=mostrarInicio" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-alt"></i>
                <div class="text-truncate" data-i18n="Inicio">Inicio</div>
            </a>
        </li>
        <!-- Academy menu end -->
        <li class="menu-header small text-uppercase">
            <span class="menu-header-text" data-i18n="Incidencias">Incidencias</span>
        </li>

        <li class="menu-item ${activeMenuToggle == 'Incidencias' ? 'active' : ''}">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-bell"></i>
                <div class="text-truncate" data-i18n="Incidencias">Incidencias</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${activeMenu == 'ReporteIncidencias' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletSerenazgo?action=mostrarReportesIncidencias" class="menu-link">
                        <div class="text-truncate" data-i18n="Reporte de Incidencias">Reporte de Incidencias</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenu == 'MisReportes' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletSerenazgo?action=mostrarMisIncidencias" class="menu-link">
                        <div class="text-truncate" data-i18n="Reportes aceptados">Reportes aceptados</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenu == 'IncidenciasFalsas' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletSerenazgo?action=mostrarIncidenciasFalsas" class="menu-link">
                        <div class="text-truncate" data-i18n="Incidencias Falsas">Incidencias Falsas</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenu == 'IncidenciasHistorial' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletSerenazgo?action=mostrarIncidenciasHistorial" class="menu-link">
                        <div class="text-truncate" data-i18n="Historial de casos">Historial de casos</div>
                    </a>
                </li>
            </ul>
        </li>

        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text"
                                                           data-i18n="Ayuda">Ayuda</span></li>
        <!-- Cards -->
        <li class="menu-item ${activeMenu == 'Ayuda' ? 'active' : ''}">
            <a href="<%=request.getContextPath()%>/ServletSerenazgo?action=mostrarAyuda" class="menu-link">
                <i class="menu-icon tf-icons bx bx-help-circle"></i>
                <div class="text-truncate" data-i18n="Ayuda">Ayuda</div>
            </a>
        </li>

        <!-- Extended components -->

        <!-- Icons -->

        <!-- Forms & Tables -->

        <!-- Forms -->

        <!-- Tables -->


        <!-- Misc -->
    </ul>


</aside>

