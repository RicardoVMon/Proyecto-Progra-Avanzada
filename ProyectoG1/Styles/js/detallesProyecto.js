function copyToClipboard(elemento) {
    var objeto = document.getElementById("elemento").innerText;
    navigator.clipboard.writeText(objeto).then(function () {
        Swal.fire({
            icon: 'success',
            title: 'Exito!',
            text: elemento + " " + 'copiado al portapapeles',
            timer: 2000, // Time in milliseconds (2 seconds)
            showConfirmButton: false, // Hides the "Accept" button
            toast: true, // Makes the alert a toast-style popup
            position: 'top' // Positions it at the top-right corner
        });
    }, function (err) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'No se pudo copiar el correo',
            timer: 2000, // Time in milliseconds (2 seconds)
            showConfirmButton: false,
            toast: true,
            position: 'top'
        });
        console.error('Error al copiar el correo: ', err);
    });
}
