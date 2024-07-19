<%@page import="com.GRUPO10.Entidades.Paciente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Paciente</title>
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

/*CLASE PARA LOS TITULOS DE LAS PAGINAS*/
.titulo-paginas {
	text-align: center;
}

.form-info {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.message-confirmation {
	text-align: center;
	margin: 20px 0;
	font-size: 18px;
	font-weight: bold;
	color: green;
}
</style>
</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container">
				<h1 class="titulo-paginas">Modificar Paciente</h1>
				<form action="buscarPaciente.html" method="post">
					<div style="text-align: center;">
						<a>Inserte el DNI del Paciente:</a> <input type="number"
							name="dni" min=1 required> <input type="hidden"
							name="viewName" value="modificarPaciente">
						<button type="submit" class="search-button">Buscar</button>
					</div>
					<c:if test="${not empty mensaje}">
						<div class="message">${mensaje}</div>
					</c:if>
					<c:if test="${not empty mensaje2}">
						<div class="message-confirmation">${mensaje2}</div>
					</c:if>
				</form>

				<c:if test="${not empty pacienteBuscado}">
					<hr>
					<h2>Información del Paciente</h2>
					<form class="form-info" action="modificarPaciente.html"
						method="post"
						onsubmit="return confirm('¿Estás seguro de que deseas MODIFICAR este PACIENTE?');">
						<table class="form-table">
							<tr>
								<td>DNI</td>
								<td><input type="hidden" value="${pacienteBuscado.dni}"
									name="dni">${pacienteBuscado.dni}</td>
							</tr>
							<tr>
								<td>Nombre</td>
								<td><input type="text" value="${pacienteBuscado.nombre}"
									name="nombre" pattern="[A-Za-z]+" required></td>
							</tr>
							<tr>
								<td>Apellido</td>
								<td><input type="text" name="apellido"
									value="${pacienteBuscado.apellido}" pattern="[A-Za-z]+" required></td>
							</tr>

							<tr>
								<td>Nacimiento</td>
								<td><input type="date" name="fechaNacimiento"
									value="${pacienteBuscado.fechaNacimiento}" required></td>
							</tr>
							<tr>
								<td>Dirección</td>
								<td><input type="text" name="direccion"
									value="${pacienteBuscado.direccion}" required></td>
							</tr>
							<tr>
								<td>Provincia</td>
								<td><select name="provincia" id="provinciaSelect"
									onchange="cargarLocalidades()" required>
										<option value="" disabled>Seleccione una provincia</option>
										<c:forEach var="provincia" items="${provincias}">
											<option value="${provincia.idProvincia}"
												${provincia.idProvincia == pacienteBuscado.provincia.idProvincia ? 'selected' : ''}>${provincia.nombre}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>Localidad</td>
								<td><select name="localidad" id="localidadSelect" required>
										<option value="" disabled>Seleccione una localidad</option>
										<c:forEach var="localidad" items="${localidades}">
											<option value="${localidad.idLocalidad}"
												${localidad.idLocalidad == pacienteBuscado.localidad.idLocalidad ? 'selected' : ''}>${localidad.nombre}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="email" name="email"
									value="${pacienteBuscado.email}" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}" required></td>
							</tr>
							<tr>
								<td>Teléfono</td>
								<td><input type="text" name="telefono"
									value="${pacienteBuscado.telefono}" pattern="[0-9]+" required></td>
							</tr>

							<tr>
								<td>Estado</td>
								<td><Input type="Radio" required name="estado" value="true"
									<c:if test="${pacienteBuscado.estado}"> checked </c:if>>Activo<br>
									<Input type="Radio" name="estado" value="false"
									<c:if test="${pacienteBuscado.estado==false}"> checked </c:if>>Inactivo<br></td>
							</tr>
						</table>
						<div class="action-buttons">

							<button type="submit" class="submit-button">Modificar</button>
						</div>
					</form>

				</c:if>
			</div>
		</div>
	</div>
	<script>
		function cargarLocalidades() {
			var provinciaId = document.getElementById("provinciaSelect").value;
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "/TPINT_GRUPO_10_LAB4/cargarLocalidades.html",
					true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					var localidadSelect = document
							.getElementById("localidadSelect");
					if (xhr.status == 200) {
						localidadSelect.innerHTML = xhr.responseText;
					} else {
						localidadSelect.innerHTML = '<option value="">Error al cargar localidades</option>';
					}
				}
			};
			xhr.send("provinciaId=" + encodeURIComponent(provinciaId));
		}
	</script>
</body>
</html>