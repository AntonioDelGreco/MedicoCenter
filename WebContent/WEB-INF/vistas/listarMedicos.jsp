<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Médicos</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" />
<style>
.adminPanel-container {
	display: flex;
}

.content-container {
	width: 100%;
	box-sizing: border-box;
	margin-left: 280px;
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
	margin-top: 20px;
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
</style>
</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container" style="padding: 20px;">
				<h1 class="titulo-paginas">Listado de Médicos</h1>
				<form action="redireccionar_verMedico.html" method="post">
					<div style="text-align: center;">
						<label for="legajo">Inserte el Legajo del Médico:</label> <input
							type="text" id="legajo" name="legajo" required>
						<button type="submit" class="search-button">Buscar</button>
						<c:if test="${not empty mensaje}">
							<div class="message">${mensaje}</div>
						</c:if>
					</div>
				</form>
				<table id="tablaMedicos" class="table-medicos">
					<thead>
						<tr>
							<th>Legajo</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Especialidad</th>
							<th>Estado</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="medico" items="${medicos}">
							<tr>
								<td>${medico.legajo}</td>
								<td>${medico.nombre}</td>
								<td>${medico.apellido}</td>
								<td>${medico.especialidad.nombre}</td>
								<td>${medico.estado ? 'Activo' : 'Inactivo'}</td>
								<td class="table-actions">
									<form action="redireccionar_verMedico.html" method="get">
										<input type="hidden" name="legajo" value="${medico.legajo}">
										<input type="submit" value="Ver">
									</form>
									<form action="redireccionar_editarMedico.html" method="get">
										<input type="hidden" name="legajo" value="${medico.legajo}">
										<input type="submit" value="Editar">
									</form>
									<form action="buscarMedicoEliminar.html" method="get">
										<input type="hidden" name="legajo" value="${medico.legajo}">
										<input type="submit" value="Eliminar">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('#tablaMedicos')
									.DataTable(
											{
												language : {
													url : 'https://cdn.datatables.net/plug-ins/1.11.4/i18n/es-ES.json'
												},
												"dom" : '<"top"lf>rt<"bottom"ip><"clear">',
											});
						});
	</script>
</body>
</html>

