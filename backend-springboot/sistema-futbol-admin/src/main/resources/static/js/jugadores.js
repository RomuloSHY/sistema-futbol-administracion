const urlBase = "http://localhost:8082/jugador";

// ---------------- LISTAR JUGADORES ----------------
function cargarJugadores(){

    fetch(urlBase + "/lista")
        .then(response => response.json())
        .then(data => {

            const tabla = document.getElementById("tabla-jugadores");

            //Limpia tabla antes de volver a cargar
            tabla.innerHTML = "";

            data.forEach(j => {

                const fila = `
                    <tr>
                        <td>${j.id}</td>
                        <td>${j.nombre}</td>
                        <td>${j.telefono}</td>
                        <td>${j.activo ? "✅" : "❌"}</td>
                    </tr>
                `;

                tabla.innerHTML += fila;
            });
        });

}

// ---------------- GUARDAR JUGADOR ----------------
function guardarJugador() {

    const nombre = document.getElementById("nombre").value;
    const telefono = document.getElementById("telefono").value;

    const jugador = {
        nombre: nombre,
        telefono: telefono
    };

    fetch(urlBase, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(jugador)
    })
    .then(res => res.json())
    .then(() => {

        alert("Jugador agregado correctamente");

        // limpiar form
        document.getElementById("formJugador").reset();

        // cerrar modal
        const modal = bootstrap.Modal.getInstance(document.getElementById("modalJugador"));
        modal.hide();

        // refrescar tabla
        cargarJugadores();
    })
    .catch(err => console.error(err));

}

