function consultarNombreUsuario() {

    let cedula = document.getElementById('cedula').value;

    if (cedula.length == 9) {

        $.ajax({
            type: 'GET',
            url: 'https://apis.gometa.org/cedulas/' + cedula,
            dataType: 'json',
            success: function (response) {
                if (response.resultcount > 0) {
                    document.getElementById('nombre').value = response.results[0].firstname;
                    document.getElementById('apellidos').value = response.results[0].lastname;
                } else {
                    document.getElementById('nombre').value = '';
                    document.getElementById('apellidos').value = '';
                }
            }
        });
    }


}