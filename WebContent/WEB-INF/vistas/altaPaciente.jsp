<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alta de Paciente</title>
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
	justify-content: center;
	align-items: center;
	height: calc(100vh - 100px);
}

.form-table {
	border-collapse: collapse;
	width: 90%;
	max-width: 1000px;
}

.form-table td {
	border: 1px solid #ccc;
	padding: 10px;
}

.form-table input[type="text"], .form-table input[type="email"],
	.form-table input[type="date"], .form-table select {
	width: 100%;
	padding: 5px;
	box-sizing: border-box;
}

.form-table input[type="radio"] {
	margin-right: 10px;
}

.radio-container {
	display: flex;
	align-items: center;
	gap: 20px;
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

.message {
	text-align: center;
	margin: 20px 0;
	font-size: 18px;
	font-weight: bold;
	color: #4caf50;
}

.form-title {
	text-align: center;
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container">
				<form action="altaPaciente.html" method="post" onsubmit="return confirm('¿Estás seguro de que deseas dar de alta este paciente?');">
					<div class="form-title">
						<h2>Insertar Paciente</h2>
					</div>
					<table class="form-table">
						<tr>
							<td>DNI</td>
							<td><input type="text" name="dni" pattern="[0-9]+" required></td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td><input type="text" name="nombre" pattern="[A-Za-z]+" required ></td>
						</tr>
						<tr>
							<td>Apellido</td>
							<td><input type="text" name="apellido" pattern="[A-Za-z]+" required></td>
						</tr>
						<tr>
							<td>Nacimiento</td>
							<td><input type="date" name="nacimiento" required></td>
						</tr>
						<tr>
							<td>Provincia</td>
							<td><select name="provincia" id="provinciaSelect"
								onchange="cargarLocalidades()" required>
									<option value="" disabled selected>Seleccione una
										provincia</option>
									<c:forEach var="provincia" items="${provincias}">
										<option value="${provincia.idProvincia}">${provincia.nombre}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>Localidad</td>
							<td><select name="localidad" id="localidadSelect" required
								disabled>
									<option value="" disabled selected>Seleccione una
										provincia</option>
							</select></td>
						</tr>
						<tr>
							<td>Dirección</td>
							<td><input type="text" name="direccion" required></td>
						</tr>
						<tr>
							<td>Correo</td>
							<td><input type="email" name="correo" required></td>
						</tr>
						<tr>
							<td>Teléfono</td>
							<td><input type="text" name="telefono" pattern="[0-9]+" required></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<button type="submit" class="submit-button">Cargar</button>
						<c:if test="${not empty mensaje}">
							<div class="message">${mensaje}</div>
						</c:if>
					</div>
				</form>
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
						localidadSelect.disabled = false;
					} else {
						localidadSelect.innerHTML = '<option value="">Error al cargar localidades</option>';
						localidadSelect.disabled = true;
					}
				}
			};
			xhr.send("provinciaId=" + encodeURIComponent(provinciaId));

			var localidadSelect = document.getElementById("localidadSelect");
			localidadSelect.innerHTML = '<option value="">Cargando...</option>';
			localidadSelect.disabled = true;
		}
	</script>
</body>
</html>