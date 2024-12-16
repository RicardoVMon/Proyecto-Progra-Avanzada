document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll(".rechazar-solicitud");

    buttons.forEach((button) => {
        button.addEventListener("click", function (e) {
            e.preventDefault();

            const deleteUrl = this.dataset.url;

            Swal.fire({
                title: '¿Estás seguro?',
                text: "Esta acción rechazará tu conexión con esta persona. ¿Deseas continuar?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, continuar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = deleteUrl;
                }
            });
        });
    });
});