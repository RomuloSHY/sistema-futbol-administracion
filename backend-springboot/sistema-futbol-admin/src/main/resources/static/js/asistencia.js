const urlJugadores = "http://localhost:8082/jugador/lista";
const urlRegistrar = "http://localhost:8082/participacion/registrar";

// Función para cargar jugadores activos en la tabla
function cargarJugadores() {
    fetch(urlJugadores)
        .then(res => res.json())
        .then(jugadores => {
            const tbody = document.getElementById("tabla-jugadores-activos");
            tbody.innerHTML = ""; // Limpiar tabla antes de cargar

            jugadores.forEach(j => {
                if (j.activo) {
                    const fila = document.createElement("tr");
                    fila.innerHTML = `
                        <td>${j.nombre}</td>
                        <td><input type="checkbox" class="asistencia" value="${j.id}"></td>
                    `;
                    tbody.appendChild(fila);
                }
            });
        })
        .catch(err => console.error("Error al cargar jugadores:", err));
}

// Botón para cargar jugadores al hacer clic
document.getElementById("btn-cargar").addEventListener("click", cargarJugadores);

// Evento para registrar asistencia
document.getElementById("btn-registrar").addEventListener("click", () => {
    const checkboxes = document.querySelectorAll(".asistencia:checked");
    const jugadorIds = Array.from(checkboxes).map(cb => Number(cb.value));

    if (jugadorIds.length === 0) {
        alert("Marca al menos un jugador.");
        return;
    }

    const partidoId = 1; // Cambiar según el partido actual
    fetch(`${urlRegistrar}?partidoId=${partidoId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(jugadorIds)
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        // Limpiar checkboxes después de registrar
        checkboxes.forEach(cb => cb.checked = false);
    })
    .catch(err => console.error("Error al registrar asistencia:", err));
});
