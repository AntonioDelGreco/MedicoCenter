<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar un turno</title>
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
         <c:if test="${not empty turno}">
            <table class="details-table">
                <caption class="caption-medicos">Detalles del Turno</caption>
                <tr>
                    <th>Estado</th>
                    <td>${turno.estadoTurno }</td>
                </tr>
                <tr>
                    <th>Fecha</th>
                    <td>${turno.fecha }</td>
                </tr>
                <tr>
                    <th>Hora</th>
                    <td>${turno.hora }</td>
                </tr>
                <tr>
                    <th>Observacion</th>
                    <td>${turno.observacion }</td>
                </tr>
                <tr>
                    <th>Medico</th>
                    <td>${turno.medico.nombre } ${turno.medico.apellido }</td>
                </tr>
                <tr>
                    <th>Paciente</th>
                    <td>${turno.paciente.dni }</td>
                </tr>
                <tr>
                      <td class="table-actions">
            			<form action="buscarPaciente.html" method="post">
                			<input type="hidden" name="dni" value="${turno.paciente.dni }">
                			<input type="hidden" name="viewName" value="listarPacienteDelTurno">
                			<input type="submit" value="Ver Paciente" name="btnVer">
            			</form>
                        </td>
                </tr>
            </table>
            </c:if>
        </div>
    </div>
</body>
</html>
