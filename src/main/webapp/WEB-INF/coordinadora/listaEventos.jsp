<%@ page import="com.example.sanmi_telesoft.beans.Evento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../Fragmentos/headFragment.jsp"/>
<body>
<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0"
            style="display: none; visibility: hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->

<div class="layout-wrapper layout-content-navbar  ">
    <div class="layout-container">
        <!-- / Menu -->
        <jsp:include page="../Fragmentos/menuFragment.jsp"/>
        <!-- Layout container -->
        <div class="layout-page">


            <!-- Navbar -->
            <jsp:include page="../Fragmentos/navbarFragment.jsp"/>
            <!-- / Navbar -->


            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">


                    <div class="app-academy">
                        <div class="card p-0 mb-4">
                            <div class="card-body d-flex flex-column flex-md-row justify-content-between p-0 pt-4">
                                <div class="app-academy-md-25 card-body py-0">
                                    <img src="../../assets/img/illustrations/bulb-light.png"
                                         class="img-fluid app-academy-img-height scaleX-n1-rtl" alt="Bulb in hand"
                                         data-app-light-img="illustrations/bulb-light.png"
                                         data-app-dark-img="illustrations/bulb-dark.png" height="90"/>
                                </div>
                                <div class="app-academy-md-50 card-body d-flex align-items-md-center flex-column text-md-center">
                                    <h3 class="card-title mb-4 lh-sm px-md-5 text-center">
                                        Los eventos más esperados en San Miguel
                                        <span class="text-primary fw-medium text-nowrap"> están en tus manos</span>.
                                    </h3>
                                    <div class="d-flex align-items-center justify-content-between app-academy-md-80">
                                        <input type="search" placeholder="Busca tu evento" class="form-control me-2"/>
                                        <button type="submit" class="btn btn-primary btn-icon"><i
                                                class="bx bx-search"></i></button>
                                    </div>
                                </div>
                                <div class="app-academy-md-25 d-flex align-items-end justify-content-end">
                                    <img src="../../assets/img/illustrations/pencil-rocket.png" alt="pencil rocket"
                                         height="188" class="scaleX-n1-rtl"/>
                                </div>
                            </div>
                        </div>


                        <div class="card mb-4">
                            <div class="card-header d-flex flex-wrap justify-content-between gap-3">
                                <div class="card-title mb-0 me-1">
                                    <h5 class="mb-1" style="font-size: 30px">Todos los eventos</h5>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="row gy-4 mb-4">
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border" data-value="Deporte">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento1.jpg"
                                                        alt="tutor image 1"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details.html" class="h5">Festival de Música Peruana</a>
                                                <p class="mt-2">El Festival de la Música Peruana es un evento que
                                                    celebra y promueve la rica diversidad musical del Perú.</p>
                                                <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
                                  -->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details1.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento2.jpg"
                                                        alt="tutor image 2"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-hover-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details1.html" class="h5">Fiesta de San Miguel</a>
                                                <p class="mt-2">Una celebración anual en honor al patrón de la ciudad,
                                                    San Miguel Arcángel. Incluye procesiones, misas especiales, danzas
                                                    folclóricas y actividades culturales para toda la familia.</p>
                                                <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
                                  -->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details1.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">


                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento3.jpg"
                                                        alt="tutor image 3"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-hover-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details.html" class="h5">Teatro en San Miguel</a>
                                                <p class="mt-2">El teatro es una forma de arte en la que los actores
                                                    interpretan personajes y representan historias en vivo ante una
                                                    audiencia.  <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
-->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">

                                    </div>
                                </div>
                                <div class="row gy-4 mb-4">
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento1.jpg"
                                                        alt="tutor image 1"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details.html" class="h5">Festival de Música Peruana</a>
                                                <p class="mt-2">El Festival de la Música Peruana es un evento que
                                                    celebra y promueve la rica diversidad musical del Perú.</p>
                                                <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
                                  -->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento2.jpg"
                                                        alt="tutor image 2"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-hover-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="app-academy-course-details2.html" class="h5">Festival de San
                                                    Miguel</a>
                                                <p class="mt-2"> Durante este evento, se llevan a cabo conciertos,
                                                    exposiciones de arte, danzas folclóricas, eventos gastronómicos y
                                                    más, destacando la rica herencia y diversidad cultural de la
                                                    región..</p>
                                                <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
                                  -->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">

                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento3.jpg"
                                                        alt="tutor image 3"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-hover-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details.html" class="h5">Teatro en San Miguel</a>
                                                <p class="mt-2">El teatro es una forma de arte en la que los actores
                                                    interpretan personajes y representan historias en vivo ante una
                                                    audiencia.  <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
-->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento1.jpg"
                                                        alt="tutor image 1"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details.html" class="h5">Festival de Música Peruana</a>
                                                <p class="mt-2">El Festival de la Música Peruana es un evento que
                                                    celebra y promueve la rica diversidad musical del Perú.</p>
                                                <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
                                  -->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento2.jpg"
                                                        alt="tutor image 2"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-hover-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details.html" class="h5">Festival de Música Peruana</a>
                                                <p class="mt-2">El Festival de la Música Peruana es un evento que
                                                    celebra y promueve la rica diversidad musical del Perú.</p>
                                                <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
                                  -->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="card p-2 h-100 shadow-none border">
                                            <div class="rounded-2 text-center mb-3">
                                                <a href="details.html"><img
                                                        style="height: 200px; width: fit-content; border-radius: 10px"
                                                        class="img-fluid" src="../../assets/img/events/evento3.jpg"
                                                        alt="tutor image 3"/></a>
                                            </div>
                                            <div class="card-body p-3 pt-2">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="badge bg-label-hover-warning">Cultura</span>
                                                    <!--
                                                    <h6 class="d-flex align-items-center justify-content-center gap-1 mb-0">
                                                      4.4 <span class="text-warning"><i class="bx bxs-star me-1"></i></span><span class="text-muted">(1.23k)</span>
                                                    </h6>
                                                    -->
                                                </div>
                                                <a href="details.html" class="h5">Teatro en San Miguel</a>
                                                <p class="mt-2">El teatro es una forma de arte en la que los actores
                                                    interpretan personajes y representan historias en vivo ante una
                                                    audiencia.  <!--<p class="d-flex align-items-center"><i class="bx bx-time-five me-2"></i>30 minutes</p>
-->
                                                <div class="d-flex flex-column flex-md-row gap-2 text-nowrap pe-xl-3 pe-xxl-0">

                                                    <a class="app-academy-md-50 btn btn-label-primary d-flex align-items-center"
                                                       href="app-academy-course-details.html">
                                                        <span class="me-2">Ver detalles</span><i
                                                            class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <nav aria-label="Page navigation" class="d-flex align-items-center justify-content-center">
                            <ul class="pagination">
                                <li class="page-item prev">
                                    <a class="page-link" href="javascript:void(0);"><i
                                            class="tf-icon bx bx-chevron-left"></i></a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="javascript:void(0);">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0);">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0);">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0);">4</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0);">5</a>
                                </li>
                                <li class="page-item next">
                                    <a class="page-link" href="javascript:void(0);"><i
                                            class="tf-icon bx bx-chevron-right"></i></a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>


                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear())

                            </script>
                            , made with ❤️ by <a href="https://themeselection.com/" target="_blank"
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


</body>
</html>
