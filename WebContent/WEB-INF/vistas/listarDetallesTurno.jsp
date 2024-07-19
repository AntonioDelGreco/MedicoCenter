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
            margin: 0;
            padding: 0;
        }
        .adminPanel-container {
            display: flex;
            width: 100%;
        }
        .content-container {
        	margin-left:280px;
            width: 100%;
        }
        .details-table {
            width: 50%;
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
		.div-tablas{
			display:flex;
			justify-content:center;
		}
		.form-mostrarTodo {
			width:100%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.form-mostrarTodo{
			padding-bottom:30px;
		}
		.mostrarTodos button[type="submit"]{
			background-color: #007BFF;
			color: white;
			border: none;
			padding: 8px 16px;
			cursor: pointer;
			border-radius: 4px;
		}
		.mostrarTodos button[type="submit"]:hover {
			background-color: #0056b3;
		}
		.titulo-paginas {
			text-align: center;
			font-size: 24px;
			margin-bottom: 20px;
		}
    </style>
</head>
<body>
    <div class="adminPanel-container">
        <%@ include file="medicSideBarMenu.jsp"%>
        <div class="content-container">
	         <%@ include file="header.jsp"%>
	         <c:if test="${not empty turno}">
	         <h2 class="titulo-paginas">Detalles del Turno</h2>
	         <div class=div-tablas>       
	            <table class="details-table">
	    			<tr><th colspan="2" style="text-align:center;">TURNO</th></tr>
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
	                
	            </table>
	         	<table class="details-table">                
	                <c:if test="${empty mensaje}">
	                <c:if test="${not empty pacienteBuscado}">
	                <tr><th colspan="2" style="text-align:center">PACIENTE</th></tr>
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
	         </div>
	         </c:if> 
	         <div class="form-mostrarTodo">
				<form action="redireccionar_listarTurnos.html" method="post">
					<table class="mostrarTodos">
						<tr><td><button type="submit" name="mostrarTodos">Volver a TURNOS</button></td></tr>
					</table>
				</form>
			</div>       	
        </div>  
    </div>
</body>
</html>
