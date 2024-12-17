function consultarNombreInstitucion() {

    let cedula = document.getElementById('cedula').value;

    if (cedula.length == 10) {

        $.ajax({
            type: 'GET',
            url: 'https://api.hacienda.go.cr/fe/ae?identificacion=' + cedula,
            dataType: 'json',
            success: function (response) {
                if (response.nombre != null) {
                    document.getElementById('nombre').value = response.nombre;
                    document.getElementById('descripcion').value = response.actividades[0].descripcion;
                } else {
                    document.getElementById('nombre').value = '';
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                document.getElementById('nombre').value = '';
                document.getElementById('descripcion').value = '';
            }

        });
    }


}