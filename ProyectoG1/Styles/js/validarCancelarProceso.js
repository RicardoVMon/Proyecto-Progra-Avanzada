document.addEventListener("DOMContentLoaded", function () {
    // Select all buttons with the "retirar-postulacion" class
    const buttons = document.querySelectorAll(".cancelar-proceso");

    buttons.forEach((button) => {
        button.addEventListener("click", function (e) {
            e.preventDefault(); // Prevent default link behavior

            const projectName = this.dataset.nombreProyecto; // Get the project name from the data attribute
            const deleteUrl = this.dataset.url; // Get the URL for deletion

            Swal.fire({
                title: '¿Estás seguro?',
                text: "Esta acción cancelará el proceso con esta institución. ¿Deseas continuar?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, retirar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Confirmar acción',
                        text: `Por favor, escribe el nombre del proyecto: "${projectName}"`,
                        input: 'text',
                        inputPlaceholder: 'Escribe el nombre del proyecto aquí',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Confirmar',
                        cancelButtonText: 'Cancelar',
                        preConfirm: (inputValue) => {
                            if (inputValue !== projectName) {
                                Swal.showValidationMessage('El nombre no coincide. Inténtalo de nuevo.');
                                return false;
                            }
                            return true;
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = deleteUrl; // Redirect to the URL if confirmed
                        }
                    });
                }
            });
        });
    });
});
