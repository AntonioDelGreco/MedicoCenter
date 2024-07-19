<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paciente del Turno</title>
    <link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .adminPanel-container {
            display: flex;
            width: 100%;
        }
        .content-container {
            width: 100%;
        }
        .details-table {
            width: 100%;
            margin-top: 20px;
            padding: 20px;
        }
        .details-table th, .details-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .details-table th {
            background-color: #f2f2f2;
            text-align: left;
        }
        .details-table tr:hover {
            background-color: #f1f1f1;
        }
        .caption-medicos {
            font-size: 1.5rem;
            font-weight: bold;
            margin: 2rem 0;
            text-align: center;
        }
        .table-actions {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .table-actions a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }
        .table-actions a:hover {
            text-decoration: underline;
        }
        .message {
		    text-align: center;
		    margin: 20px 0;
		    font-size: 18px;
		    font-weight: bold;
		    color: #f44336;
		}
    </style>
</head>
<body>
    <div class="adminPanel-container">
        <%@ include file="medicSideBarMenu.jsp"%>
                <div class="content-container">
         <%@ include file="header.jsp"%>
            <table class="details-table">
                <caption class="caption-medicos">Detalles del Paciente</caption>
                <c:if test="${empty mensaje}">
                <c:if test="${not empty pacienteBuscado}">
                <tr>
                    <th>DNI</th>
                    <td>${pacienteBuscado.dni }</td>
                </tr>
                <tr>
                    <th>Nombre</th>
                    <td>${pacienteBuscado.nombre }</td>
                </tr>
                <tr>
                    <th>Apellido</th>
                    <td>${pacienteBuscado.apellido }</td>
                </tr>
                
                <tr>
                    <th>Fecha de Nacimiento</th>
                    <td>${pacienteBuscado.fechaNacimiento }</td>
                </tr>
                <tr>
                    <th>Provincia</th>
                    <td>${pacienteBuscado.provincia.nombre }</td>
                </tr>
                <tr>
                    <th>Localidad</th>
                  	<td>${pacienteBuscado.localidad.nombre }</td>
                </tr>
                <tr>
                    <th>Dirección</th>
                    <td>${pacienteBuscado.direccion }</td>
                </tr>
                
                <tr>
                    <th>Correo</th>
                    <td>${pacienteBuscado.email }</td>
                </tr>
                <tr>
                    <th>Teléfono</th>
                    <td>${pacienteBuscado.telefono }</td>
                </tr>
                
                <tr>
                    <th>Estado</th>
                    <td>${pacienteBuscado.estado ? 'Activo' : 'Inactivo'}</td>
                </tr>
				</c:if>
                </c:if>
            </table>
            <c:if test="${not empty mensaje}">
                            <div class="message">${mensaje}</div>
            </c:if>
            <div class="table-actions">
                <a href="listarUnTurno.html">Volver al Turno</a>
            </div>
        </div>
    </div>
</body>
</html>
