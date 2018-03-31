$(document).ready(function () {
    $('table.data-table').DataTable({
        "language": {
            "lengthMenu": "Vis _MENU_ emner per side",
            "zeroRecords": "Ingen resultater",
            "info": "Viser side _PAGE_ af _PAGES_",
            "infoEmpty": "Ingen resultater",
            "infoFiltered": "(filtreret af _MAX_ antal emner)",
            "decimal": ",",
            "thousands": ".",
            "paginate": {
                "next": "Næste",
                "previous": "Forrige"
            },
            "search": "Søg"
        }
    });

   // $('.collapse').collapse()
});

function cmsSendForm(event, url, form, modal) {
    event.preventDefault();
    event.stopPropagation();

    $.ajax({
        type: 'post',
        url: url,
        data: $(form).serialize(),
        success: function () {
            $(modal).modal('hide');
            $(form)[0].reset();
            location.reload(true);
        }
    });
}