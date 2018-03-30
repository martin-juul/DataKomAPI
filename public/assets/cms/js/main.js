$(document).ready(function() {
    $('table.data-table').DataTable( {
        "language": {
            "lengthMenu": "Vis _MENU_ emner per side",
            "zeroRecords": "Ingen resultater",
            "info": "Viser side _PAGE_ af _PAGES_",
            "infoEmpty": "Ingen resultater",
            "infoFiltered": "(filtreret af _MAX_ totale antal emner)",
            "decimal": ",",
            "thousands": ".",
            "paginate": {
              "next": "Næste",
              "previous": "Forrige"
            },
            "search": "Søg"
        }
    } );
} );