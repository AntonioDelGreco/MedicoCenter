<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Cargar estado Turno</title>
    <link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon"><link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">

    <style>
        .medicPanel-container {
            display: flex;
        }

        .content-container {
        	margin-left:280px;
            width: 100%;
        }

        .medic-options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
            margin-top: 50px;
        }

        .medic-options button {
            display: block;
            width: 200px;
            height: 100px;
            margin: 20px;
            text-align: center;
            background-color: #8ecae6;
            color: black;
            text-decoration: none;
            font-weight: bold;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .medic-options button:hover {
            background-color: #219ebc;
            color: white;
        }

        .adminPanel-container {
            display: flex;
        }

        .content-container {
            width: 100%;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content:center;
        }

        .form-table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .form-table td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .form-table input[type="text"],
        .form-table input[type="email"],
        .form-table input[type="date"],
        .form-table select {
            width: calc(100% - 20px);
            padding: 5px;
            box-sizing: border-box;
        }
		.busqueda {
			border: 1px solid #ddd;
			padding: 20px;
			margin-bottom: 20px;
		}
        .busqueda button[type="submit"]{
			background-color: #007BFF;
			color: white;
			border: none;
			padding: 8px 16px;
			cursor: pointer;
			border-radius: 4px;
		}
		.busqueda button[type="submit"]:hover{
			background-color: #0056b3;
		}
        .submit-button {
            background-color: green;
            color: white;
            font-weight: bold;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            padding: 10px 20px;
            margin-top: 20px;
        }

        .submit-button:hover {
            background-color: #8fce00;
        }

        .message {
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            font-weight: bold;
            color: #f44336;
        }

        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .titulo-paginas {
			text-align: center;
			margin-bottom: 20px;
			font-size: 24px;
		}
    </style>

</head>
<body>
    <div class="medicPanel-container">
        <%@ include file="medicSideBarMenu.jsp"%>
        <div class="content-container">
            <%@ include file="header.jsp"%>
            <div class="form-container" style="padding: 20px;">
            <h1 class="titulo-paginas">Cargar Estado Turnos</h1>
                <form action="buscarTurnoEditar.html" method="post">
                    <div style="text-align: center;" class="busqueda">
                        <a>Inserte el ID del turno:</a>
                        <input type="number" name="idTurno" required>
                        <button type="submit" class="search-button">Buscar</button>
                        <c:if test="${not empty mensaje}">
                            <p style="color:red">${mensaje}</p>
                        </c:if>
                        <c:if test="${not empty mensajeOK}">
                            <p>${mensajeOK}</p>
                        </c:if>
                    </div>
                </form>

                <c:if test="${not empty turno}">
                    <form action="actualizarTurno.html" method="post" onsubmit="return confirm('¿Estás seguro de que deseas actualizar el turno?');">
                        <input type="hidden" name="idTurno" value="${turno.id_turno}">
                        <table class="form-table">
                            <tr>
                                <td>Turno</td>
                                <td>${turno.id_turno}</td>
                            </tr>
                            <tr>
                                <td>Fecha</td>
                                <td>${turno.fecha}</td>
                            </tr>
                            <tr>
                                <td>Hora</td>
                                <td>${turno.hora}</td>
                            </tr>
                            <tr>
                                <td>Paciente</td>
                                <td>${turno.paciente.nombre} ${turno.paciente.apellido}</td>
                            </tr>
                            <tr>
                                <td>Estado</td>
                                <td>
                                    <select name="estado" id="estado" required>
                                        <option value="" disabled>Seleccione una opción</option>                                        
                                        <option value="Presente" ${turno.estadoTurno == 'Presente' ? 'selected' : ''}>Presente</option>
                                        <option value="Ausente" ${turno.estadoTurno == 'Ausente' ? 'selected' : ''}>Ausente</option>
                                        
                                    </select>
                                </td>
                            </tr>
                            <tr id="observacionesRow" style="${not empty turno.observacion ? '' : 'display: none;'}">
                                <td>Observaciones</td>
                                <td>
                                    <textarea name="observaciones" id="observaciones" rows="4" cols="50">${turno.observacion}</textarea>
                                </td>
                            </tr>
                        </table>
                        <div class="action-buttons">
                            <button type="submit" class="submit-button">Actualizar</button>
                        </div>
                    </form>
                </c:if>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('estado').addEventListener('change', function() {
            var observacionesRow = document.getElementById('observacionesRow');
            if (this.value === 'Presente') {
                observacionesRow.style.display = '';
            } else {
                observacionesRow.style.display = 'none';
            }
        });
    </script>
</body>
</html>
