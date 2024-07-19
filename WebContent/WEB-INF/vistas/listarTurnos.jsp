<%@page import="com.GRUPO10.Entidades.Turno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Turnos</title>
    <link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" />
<style>
.lista-vacia{
	text-align:center;
	width:100%;
}
.adminPanel-container {
	display: flex;
}

.content-container {
	margin-left:280px;
	width: 100%;
	box-sizing: border-box;
}

.table-medicos {
	width: 100%;
	border-collapse: collapse;
}

.table-medicos th, .table-medicos td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.table-medicos th {
	background-color: #f2f2f2;
}

.table-medicos tr:hover {
	background-color: #f1f1f1;
}

.table-actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.table-actions form {
	margin-right: 10px;
}

.table-actions input[type="submit"] {
	background-color: #007BFF;
	color: white;
	border: none;
	padding: 8px 16px;
	cursor: pointer;
	border-radius: 4px;
}

.table-actions input[type="submit"]:hover {
	background-color: #0056b3;
}
.table-actions input[type="submit"][disabled] {
    background-color: #f2f2f2;
    color: #aaa;
    cursor: not-allowed;
}
.titulo-paginas {
	text-align: center;
	margin-bottom: 20px;
	font-size: 24px;
}

.busqueda, .filtros {
	width: 100%;
	border: 1px solid #ddd;
	padding: 20px;
	margin-bottom: 20px;
}

.busqueda td {
	width: 25%;
}

.cuadro-busqueda {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}

.form-busqueda,.form-mostrarTodo {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}
.form-mostrarTodo{
	padding-bottom:30px;
}

.filtros input[type="date"], .filtros select {
	width: calc(70% - 8px);
	padding: 8px;
	box-sizing: border-box;
}

.filtros button[type="submit"],.mostrarTodos button[type="submit"],
.busqueda button[type="submit"]{
	background-color: #007BFF;
	color: white;
	border: none;
	padding: 8px 16px;
	cursor: pointer;
	border-radius: 4px;
}

.filtros button[type="submit"]:hover, .mostrarTodos button[type="submit"]:hover
,.busqueda button[type="submit"]:hover{
	background-color: #0056b3;
}

.titulo-paginas {
	text-align: center;
	font-size: 24px;
	margin-bottom: 20px;
}

.subtitulo-paginas {
	text-align: left;
	padding: 20px;
	padding-bottom: 0px;
}

a {
	text-decoration: none;
}

.action-buttons {
	text-align: center;
	margin-top: 20px;
}

.submit-button {
	background-color: #8ecae6;
	color: black;
	font-weight: bold;
	border-radius: 10px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	padding: 10px 20px;
	margin-top: 20px;
}

.submit-button:hover {
	background-color: #219ebc;
	color: white;
}

.search-button {
	background-color: blue;
	color: white;
	font-weight: bold;
	border-radius: 10px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	padding: 10px 20px;
}

.message {
	text-align: center;
	margin: 20px 0;
	font-size: 18px;
	font-weight: bold;
	color: #f44336;
}

.dataTables_wrapper .dataTables_paginate .paginate_button {
	padding: 0;
	margin-left: 4px;
	margin-right: 4px;
	display: inline-block;
	border: none;
	background: transparent;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current {
	color: white !important;
	background: #007BFF !important;
	border: none;
	border-radius: 50%;
	width: 30px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	padding: 0;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled {
	background: transparent;
	color: grey;
}

.dataTables_wrapper .dataTables_info {
	padding-top: 0;
}

.dataTables_wrapper .dataTables_length {
	padding-bottom: 10px;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
	background: #ddd;
	color: black;
	border-radius: 50%;
}

.dataTables_wrapper .dataTables_filter {
	float: right;
}

.header {
	width: 100%;
	background-color: #8ecae6;
	padding: 20px;
	box-sizing: border-box;
}
.filtros td{
	width:50%;
}

</style>
</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="medicSideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container" style="padding: 20px;">
				<h1 class="titulo-paginas">Listado de Turnos</h1>
				<form action="buscarTurnoPorDNI.html" method="post" class="form-busqueda">
					<table class="busqueda">
						<tr>
							<td>Buscar por DNI paciente:</td>
							<td><input type="number" name="dni" class="cuadro-busqueda" required></td>
							<td colspan="2"><button type="submit">Buscar</button></td>
						</tr>
					</table>
				</form>	
				<div class="form-busqueda">
					<table class="filtros">
						<tr>
							<td colspan="2">Filtrar por Fecha</td>
							<td>
								<div style="display:flex;justify-content:space-between;">
									Filtrar por Estado
									<c:if test="${not empty mensajeFiltro2}">
										<div style="text-align:right;color:red">
										Por favor seleccione una opción válida.	
										</div>								
									</c:if>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<form action="filtrarFechasTurno.html" method="post">
									<input type="date" name="fecha" required>
									<button type="submit" name="filtrarFecha">Filtrar</button>									
								</form>	
							</td>
							<td colspan="2">
								<form action="filtrarEstadoTurno.html" method="post">
									<select name="estadoTurno">
										<option value="-1" selected >Seleccione una opción</option>
										<c:forEach var="estado" items="${estadoTurnos}">
											<option value="${estado}">${estado}</option>								
										</c:forEach>
									</select>
									<button type="submit" name="filtrarEstado">Filtrar</button>
								</form>											
								
						</tr>
					</table>
				</div>
				<div class="form-mostrarTodo">
					<form action="redireccionar_listarTurnos.html" method="post">
						<table class="mostrarTodos">
							<tr><td><button type="submit" name="mostrarTodos">Mostrar Todos</button></td></tr>
						</table>
					</form>
				</div>
				<c:if test="${empty turnos }">
					<div class="lista-vacia">
						No se encontraron turnos
					</div>
				</c:if>
				<c:if test="${not empty turnos}">
				<table id="tablaTurnos" class="table-medicos">
					<thead>
						<tr>
							<th>ID Turno</th>
							<th>Fecha</th>
							<th>Hora</th>
							<th>DNI Paciente</th>
							<th>Estado</th>
							<th>Observaciones</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="turno" items="${turnos}">
						<tr>
							<td>${turno.id_turno}</td>
							<td>${turno.fecha}</td>
							<td>${turno.hora}</td>
							<td>${turno.paciente.dni}</td>
							<td>${turno.estadoTurno}</td>
							<td>${turno.observacion}</td>
							<td class="table-actions">
								<form action="obtenerDetalleTurno.html" method="post">
									<input type="hidden" name="id_turno" value="${turno.id_turno}">
									<input type="hidden" name="dni" value="${turno.paciente.dni}"> 
									<input type="submit" value="Ver Detalle" name="btnVer">
								</form>
								<form action="buscarTurnoEditar.html" method="post">
										<input type="hidden" name="idTurno" value="${turno.id_turno}">
										<input 
											type="submit" 
											value="Cargar Estado" 
											name="btnVer"
											<c:if test="${turno.estadoTurno !='Pendiente'&&turno.estadoTurno!='Confirmado'}">
												disabled
											</c:if>	
										>
								</form>
								
								
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
	<script>
        $(document).ready(function() {
            $('#tablaTurnos').DataTable({
                language: {
                    url: 'https://cdn.datatables.net/plug-ins/1.11.4/i18n/es-ES.json'
                },
                "dom": '<"top"lf>rt<"bottom"ip><"clear">'
            });
        });
    </script>
</body>
</html>
