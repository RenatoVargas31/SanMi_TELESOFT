<%--
  Created by IntelliJ IDEA.
  User: rlvs_
  Date: 12/06/2024
  Time: 03:28
  To change this template use File | Settings | File Templates.
--%>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">


    <div class="app-brand demo ">
        <a href="<%=request.getContextPath()%>/ServletAdministrador" class="app-brand-link">
            <img class="img-fluid" width="33" src="${pageContext.request.contextPath}/assets/img/illustrations/logo-San-Miguel-1.webp"
                 alt="logo-sanmiguel">
            <span class="app-brand-text demo menu-text fw-bold ms-4">SanMI</span>
        </a>
        <a href="#" class="layout-menu-toggle menu-link text-large ms-auto">
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
        <li class="menu-item ${activeMenu == 'Inicio' ? 'active' : ''}">
            <a href="<%=request.getContextPath()%>/ServletAdministrador" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-alt"></i>
                <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                <!-- <span class="badge badge-center rounded-pill bg-danger ms-auto">5</span>-->
            </a>

        </li>


        <li class="menu-header small text-uppercase">
            <span class="menu-header-text" data-i18n="Usuarios">Usuarios</span>
        </li>
        <!-- e-commerce-app menu start -->
        <!-- e-commerce-app menu end -->
        <!-- Academy menu start -->
        <li class="menu-item ${activeMenuToggle == 'Usuarios' ? 'active' : ''} ">
            <a href="#" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-user'></i>
                <div class="text-truncate" data-i18n="Usuarios">Usuarios</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${activeMenu == 'SolicitudesRegistro' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletAdministrador?action=mostrarSolicitudesRegistro" class="menu-link"><!--Zona de linkeo href: -->
                        <div class="text-truncate" data-i18n="Solicitudes de registro">Solicitudes de registro</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenu == 'UsuariosHabilitados' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletAdministrador?action=mostrarUsuariosHabilitados" class="menu-link"><!--Zona de linkeo href: -->
                        <div class="text-truncate" data-i18n="Usuarios habilitados">Usuarios habilitados</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenu == 'UsuariosBaneados' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletAdministrador?action=mostrarUsuariosBaneados" class="menu-link"><!--Zona de linkeo href: -->
                        <div class="text-truncate" data-i18n="Usuarios baneados">Usuarios baneados</div>
                    </a>
                </li>
            </ul>
        </li>

        <!-- Academy menu end -->
        <li class="menu-header small text-uppercase">
            <span class="menu-header-text" data-i18n="Personal de Serenazgo">Personal de Serenazgo</span>
        </li>

        <li class="menu-item ${activeMenuToggle == 'PersonalSerenazgo' ? 'active' : ''} ">
            <a href="#" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-shield"></i>
                <div class="text-truncate" data-i18n="Serenazgos">Serenazgos</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item ${activeMenu == 'DeCampo' ? 'active' : ''}">
                    <a href=<%=request.getContextPath()%>/ServletAdministrador?action=mostrarDeCampo class="menu-link"><!--Zona de linkeo href: -->
                        <div class="text-truncate" data-i18n="De Campo">De Campo</div>
                    </a>
                </li>
                <li class="menu-item ${activeMenu == 'Dispatcher' ? 'active' : ''}">
                    <a href="<%=request.getContextPath()%>/ServletAdministrador?action=mostrarDispatcher" class="menu-link"><!--Zona de linkeo href: -->
                        <div class="text-truncate" data-i18n="Dispatcher">Dispatcher</div>
                    </a>
                </li>
            </ul>





        </li>

        <li class="menu-header small text-uppercase">
            <span class="menu-header-text" data-i18n="Instructores">Instructores</span>
        </li>
        <li class="menu-item ${activeMenu == 'Instructores' ? 'active' : ''}">
            <a href="<%=request.getContextPath()%>/ServletAdministrador?action=mostrarInstructores" class="menu-link">
                <i class="menu-icon tf-icons bx bx-chalkboard"></i>
                <div class="text-truncate" data-i18n="Instructores">Instructores</div>
            </a>
        </li>

        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text"
                                                           data-i18n="Ayuda">Ayuda</span></li>
        <!-- Cards -->
        <li class="menu-item ${activeMenu == 'Ayuda' ? 'active' : ''}">
            <a href="<%=request.getContextPath()%>/ServletAdministrador?action=mostrarAyuda" class="menu-link">
                <i class="menu-icon tf-icons bx bx-help-circle"></i>
                <div class="text-truncate" data-i18n="Ayuda">Ayuda</div>
            </a>
        </li>

    </ul>


</aside>
