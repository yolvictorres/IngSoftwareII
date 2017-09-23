function filtrarSalario(salarioDeseado) {
    var tablaEmpleos = document.getElementById('mostrarEmpleos');
    var cellsOfRow = "";
    var found = false;
    var compareWith = "";

    // Recorremos todas las filas con contenido de la tabla
    for (var i = 1; i < tablaEmpleos.rows.length; i++)
    {
        cellsOfRow = tablaEmpleos.rows[i].getElementsByTagName('td');
        found = false;
        // Recorremos todas las celdas
        for (var j = 0; j < cellsOfRow.length && !found; j++)
        {
            compareWith = cellsOfRow[j].innerHTML.toLowerCase();
            // Buscamos el texto en el contenido de la celda
            if (salarioDeseado === "=<1000000") {
                if (tablaEmpleos.length == 0 || (compareWith.indexOf(salarioDeseado) > -1))
                {
                    found = true;
                }
            } else if (salarioDeseado === "1000000-1500000") {

            } else if (salarioDeseado === ">1500000") {

            }
        }
        if (found)
        {
            tablaEmpleos.rows[i].style.display = '';
        } else {
            // si no ha encontrado ninguna coincidencia, esconde la
            // fila de la tabla
            tablaEmpleos.rows[i].style.display = 'none';
        }
    }
}

