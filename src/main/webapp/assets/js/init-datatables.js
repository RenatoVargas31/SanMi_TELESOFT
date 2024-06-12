//Tablas Vecino
$('#table-misincidencias').DataTable({
    lengthMenu: [7, 10, 15, 20],
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, -1]}
    ]
});

$('#table-incidenciasGenerales').DataTable({
    lengthMenu: [7, 10, 15, 20],
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[3, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, -1]}
    ]
});

//Tablas Serenazgo
$('#serenazgo-table-incidencias').DataTable({
    responsive: true,
    lengthChange: false,
    pageLength: 10,
    info: false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[3, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, 1, -1]}
    ]
});
$('#serenazgo-table-incidenciasfalsas').DataTable({
    responsive: true,
    lengthChange: false,
    pageLength: 10,
    info: false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, 1, -1]}
    ]
});
//Administrador
$(document).ready(function () {
    var table = $('#table-personalSerenazgo').DataTable({
        responsive: true,
        lengthChange: false,
        pageLength: 7,
        info: false,
        paging: true,
        language: {
            url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
        },
        order: [[2, 'asc']],
        columnDefs: [
            {orderable: false, targets: [0, -1]}
        ]
    });
    $('.searchInTable').keyup(function() {
        console.log('searchInTable keyup'); // Verifica si se ejecuta
        var searchTerm = $(this).val(); // Almacena el valor del campo de búsqueda
        table.DataTable().search(searchTerm).draw(); // Realiza la búsqueda
    });
});

$('#table-solicitudRegistro').DataTable({
    responsive: true,
    lengthChange: false,
    pageLength: 5,
    info: false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, 1, -1]}
    ]
});
$('#table-usuariosHabilitados').DataTable({
    responsive: true,
    lengthChange: false,
    pageLength: 7,
    info: false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[1, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, 2, -1]}
    ]
});
$('#table-usuariosBaneados').DataTable({
    responsive: true,
    lengthChange: false,
    pageLength: 7,
    info: false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, -1]}
    ]
});
