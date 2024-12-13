$(document).ready(function () {
    var barraBusqueda = $("#barraBusqueda");
    var listaSugerencia = $("#listaSugerencias");

    // Mostrar el dropdown al hacer foco en el input si tiene contenido
    barraBusqueda.on('focus', function () {
        if (listaSugerencia.children().length > 0) {
            listaSugerencia.show();
        }
    });

    // Ocultar el dropdown al salir del input
    barraBusqueda.on('blur', function () {
        setTimeout(() => listaSugerencia.hide(), 200); // Delay para permitir clics
    });

    // Actualizar el campo al hacer clic en un item
    listaSugerencia.on('click', 'li', function () {
        var selectedText = $(this).text();
        barraBusqueda.val(selectedText);
    });

    // AJAX para buscar sugerencias en tiempo real
    barraBusqueda.on('keyup', function () {
        var query = barraBusqueda.val();

        if (query.length >= 2) { // Solo buscar si el usuario escribe al menos 2 caracteres
            $.ajax({
                url: '/Proyectos/SugerenciasProyectos', // Ruta del controlador
                type: 'GET',
                data: { query: query }, // Enviar el término como parámetro
                success: function (data) {
                    listaSugerencia.empty(); // Limpiar sugerencias actuales
                    if (data.length > 0) {
                        data.forEach(function (item) {
                            listaSugerencia.append(`<li class="dropdown-item">${item}</li>`);
                        });
                        listaSugerencia.show(); // Mostrar las nuevas sugerencias
                    } else {
                        listaSugerencia.hide(); // Ocultar si no hay resultados
                    }
                },
                error: function () {
                    console.error('Error al obtener sugerencias.');
                    listaSugerencia.hide(); // Ocultar en caso de error
                }
            });
        } else {
            listaSugerencia.empty(); // Limpiar si la consulta es muy corta
            listaSugerencia.hide(); // Ocultar si no hay búsqueda
        }
    });
});