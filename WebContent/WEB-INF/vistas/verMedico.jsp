<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del Médico</title>
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
            margin-left: 280px;
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
        <%@ include file="sideBarMenu.jsp"%>
                <div class="content-container">
         <%@ include file="header.jsp"%>
            <table class="details-table">
                <caption class="caption-medicos">Detalles del Médico</caption>
                <c:if test="${empty mensaje}">
                <tr>
                    <th>Legajo</th>
                    <td>${medico.legajo}</td>
                </tr>
                <tr>
                    <th>Nombre</th>
                    <td>${medico.nombre}</td>
                </tr>
                <tr>
                    <th>Apellido</th>
                    <td>${medico.apellido}</td>
                </tr>
                <tr>
                    <th>Sexo</th>
                    <td>${medico.sexo}</td>
                </tr>
                <tr>
                    <th>Fecha de Nacimiento</th>
                    <td>${medico.nacimiento}</td>
                </tr>
                <tr>
                    <th>Dirección</th>
                    <td>${medico.direccion}</td>
                </tr>
                <tr>
                    <th>Localidad</th>
                    <td>${medico.localidad.nombre}</td>
                </tr>
                <tr>
                    <th>Correo</th>
                    <td>${medico.correo}</td>
                </tr>
                <tr>
                    <th>Teléfono</th>
                    <td>${medico.telefono}</td>
                </tr>
                <tr>
                    <th>Días</th>
                    <td>${medico.dias}</td>
                </tr>
                <tr>
                    <th>Horarios</th>
                    <td>${medico.horarios}</td>
                </tr>
                <tr>
                    <th>Especialidad</th>
                    <td>${medico.especialidad.nombre}</td>
                </tr>
                <tr>
                	<th>Usuario</th>
                	<td>${medico.usuario.nombre}</td>
                </tr>
                
                <tr>
                    <th>Estado</th>
                    <td>${medico.estado ? 'Activo' : 'Inactivo'}</td>
                </tr>
                </c:if>
            </table>
            <c:if test="${not empty mensaje}">
                            <div class="message">${mensaje}</div>
            </c:if>
            <div class="table-actions">
                <a href="redireccionar_listarMedicos.html">Volver a la lista</a>
            </div>
        </div>
    </div>
</body>
</html>
