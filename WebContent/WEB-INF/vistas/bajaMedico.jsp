<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alta de Médico</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">

<style>
.adminPanel-container {
	display: flex;
}

.content-container {
	width: 100%;
	margin-left: 280px;
}

.form-container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.form-table {
	border-collapse: collapse;
	width: 100%;
	max-width: 800px;
	margin-bottom: 20px;
}

.form-title {
	text-align: center;
	margin-bottom: 20px;
}

.form-table td {
	border: 1px solid #ccc;
	padding: 10px;
}

.form-table input[type="text"], .form-table input[type="email"],
	.form-table input[type="date"], .form-table select {
	width: calc(100% - 20px);
	padding: 5px;
	box-sizing: border-box;
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

.submit-button {
	background-color: #f44336;
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
	background-color: #cc0000;
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
</style>

</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container">
				<form action="buscarMedicoEliminar.html" method="post">
					<div class="form-title">
						<h2>Baja Médico</h2>
					</div>
					<div style="text-align: center;">
						<a>Inserte el Legajo del Médico:</a> <input type="text"
							name="legajo" pattern="[0-9]+" required>
						<button type="submit" class="search-button">Buscar</button>
						<c:if test="${not empty mensaje}">
							<div class="message">${mensaje}</div>
						</c:if>
					</div>
				</form>

				<c:if test="${not empty medico}">
					<hr>
					<h2>Información del Médico</h2>
					<table class="form-table">
						<tr>
							<td>Legajo</td>
							<td>${medico.legajo}</td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td>${medico.nombre}</td>
						</tr>
						<tr>
							<td>Apellido</td>
							<td>${medico.apellido}</td>
						</tr>
						<tr>
							<td>Sexo</td>
							<td>${medico.sexo}</td>
						</tr>
						<tr>
							<td>Nacimiento</td>
							<td>${medico.nacimiento}</td>
						</tr>
						<tr>
							<td>Dirección</td>
							<td>${medico.direccion}</td>
						</tr>
						<tr>
							<td>Localidad</td>
							<td>${medico.localidad.nombre}</td>
						</tr>
						<tr>
							<td>Correo</td>
							<td>${medico.correo}</td>
						</tr>
						<tr>
							<td>Teléfono</td>
							<td>${medico.telefono}</td>
						</tr>
						<tr>
							<td>Días</td>
							<td>${medico.dias}</td>
						</tr>
						<tr>
							<td>Horarios</td>
							<td>${medico.horarios}</td>
						</tr>
						<tr>
							<td>Estado</td>
							<td>${medico.estado ? 'Habilitado' : 'Deshabilitado'}</td>
						</tr>
					</table>
					<div class="action-buttons">
						<form action="eliminarMedico.html" method="post"
							onsubmit="return confirm('¿Estás seguro de que deseas eliminar este médico?');">
							<input type="hidden" name="legajo" value="${medico.legajo}">
							<button type="submit" class="submit-button">Eliminar</button>
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
