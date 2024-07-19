<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.form-title {
	text-align: center;
	margin-bottom: 20px;
}

.form-table {
	border-collapse: collapse;
	width: 100%;
	max-width: 800px;
	margin-bottom: 20px;
}

.form-table td {
	border: 1px solid #ccc;
	padding: 8px;
}

.form-table input[type="text"], .form-table input[type="email"],
	.form-table input[type="date"], .form-table select, .form-table input[type="password"]
	{
	width: calc(100% - 12px);
	padding: 5px;
	box-sizing: border-box;
}

.form-table input[type="radio"] {
	margin-right: 8px;
}

.checkbox-container {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
}

.time-input-container {
	display: flex;
	align-items: center;
	gap: 8px;
}

.time-input {
	width: 70px;
	padding: 5px;
	box-sizing: border-box;
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
	margin-top: 5px;
}

.submit-button:hover {
	background-color: #219ebc;
	color: white;
}

.message, .error {
	text-align: center;
	margin: 20px 0;
	font-size: 18px;
	font-weight: bold;
}

.message {
	color: #4caf50;
}

.error {
	color: red;
}

.sidebar-container {
	width: 280px;
	margin-left: 20px;
	padding: 10px;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
}

.sidebar-table {
	width: 100%;
	border-collapse: collapse;
}

.sidebar-table td {
	border: 1px solid #ccc;
	padding: 8px;
}

.sidebar-table input[type="text"] {
	width: calc(100% - 16px);
	padding: 5px;
	box-sizing: border-box;
	margin-top: 5px;
}

.contrasena {
	width: calc(100% - 65px) !important;
}

#togglePassword {
	padding: 5px 10px;
}
#submitBtn{
	visibility:hidden;
	
}
</style>



</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container">
				<form action="altaMedico.html" method="post" onsubmit="return confirm('¿Estás seguro de que deseas dar de alta este médico?');">
					<div class="form-title">
						<h2>Insertar Médico</h2>
					</div>
					<table class="form-table">
						<tr>
							<td>Nombre</td>
							<td><input type="text" name="nombre" pattern="[A-Za-z]+" required></td>
						</tr>
						<tr>
							<td>Apellido</td>
							<td><input type="text" name="apellido" pattern="[A-Za-z]+" required></td>
						</tr>
						<tr>
							<td>Sexo</td>
							<td>
								<div class="radio-container">
									<label><input type="radio" name="sexo" value="F"
										required> Femenino</label> <label><input type="radio"
										name="sexo" value="M" required> Masculino</label> <label><input
										type="radio" name="sexo" value="otro" required> Otro</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>Nacimiento</td>
							<td><input type="date" name="nacimiento" required></td>
						</tr>
						<tr>
							<td>Dirección</td>
							<td><input type="text" name="direccion" required></td>
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
							<td>Correo</td>
							<td><input type="email" name="correo" required></td>
						</tr>
						<tr>
							<td>Teléfono</td>
							<td><input type="text" name="telefono" pattern="[0-9]+" required></td>
						</tr>
						<tr>
							<td>Días</td>
							<td>
								<div class="checkbox-container">
									<label><input type="checkbox" name="dias" value="Lunes">
										Lunes</label> <label><input type="checkbox" name="dias"
										value="Martes"> Martes</label> <label><input
										type="checkbox" name="dias" value="Miércoles">
										Miércoles</label> <label><input type="checkbox" name="dias"
										value="Jueves"> Jueves</label> <label><input
										type="checkbox" name="dias" value="Viernes"> Viernes</label> <label><input
										type="checkbox" name="dias" value="Sábado"> Sábado</label> <label><input
										type="checkbox" name="dias" value="Domingo"> Domingo</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>Horarios</td>
							<td>
								<div class="time-input-container">
									<label for="horaInicio">De: </label><input type="text"
										id="horaInicio" name="horaInicio" class="time-input" placeholder="HH:mm" required>
									<label for="horaFin">a: </label><input type="text" placeholder="HH:mm" id="horaFin"
										name="horaFin" class="time-input" required>
								</div>
							</td>
						</tr>
						<tr>
							<td>Especialidad</td>
							<td><select name="especialidad" required>
									<option value="" disabled selected>Seleccione una
										opción</option>
									<c:forEach var="especialidad" items="${especialidades}">
										<option value="${especialidad.id}">${especialidad.nombre}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>

					<table class="form-table">
						<tr>
							<td>Usuario:</td>
							<td><input type="text" name="usuario" required></td>
						</tr>
						<tr>
							<td>Contraseña:</td>
							<td>
								<div style="position: relative;">
									<input type="password" name="contrasena" id="contrasenaInput1"
										class="contrasena" required>
									<div
										style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
										<button type="button" id="togglePassword1">
											<img id="toggleIcon1"
												src="https://img.icons8.com/?size=100&id=85028&format=png&color=000000"
												alt="Mostrar contraseña" width="20" height="20">
										</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>Contraseña:</td>
							<td>
								<div style="position: relative;">
									<input type="password" name="contrasena2" id="contrasenaInput2"
										class="contrasena" required>
									<div
										style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
										<button type="button" id="togglePassword2">
											<img id="toggleIcon2"
												src="https://img.icons8.com/?size=100&id=85028&format=png&color=000000"
												alt="Mostrar contraseña" width="20" height="20">
										</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<div style="text-align: center;">
						<button type="button" class="submit-button" onclick="verificarContrasenas()">Cargar</button>
						<button type="submit" id="submitBtn"></button>
						<c:if test="${not empty mensaje}">
							<div class="message">${mensaje}</div>
						</c:if>
						<c:if test="${not empty error}">
							<div class="error">${error}</div>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		const togglePasswordButton1 = document
				.getElementById('togglePassword1');
		const passwordInput1 = document.getElementById('contrasenaInput1');
		const toggleIcon1 = document.getElementById('toggleIcon1');

		togglePasswordButton1.addEventListener('click', function() {
			togglePasswordVisibility(passwordInput1, toggleIcon1);
		});

		const togglePasswordButton2 = document
				.getElementById('togglePassword2');
		const passwordInput2 = document.getElementById('contrasenaInput2');
		const toggleIcon2 = document.getElementById('toggleIcon2');

		togglePasswordButton2.addEventListener('click', function() {
			togglePasswordVisibility(passwordInput2, toggleIcon2);
		});

		function togglePasswordVisibility(input, icon) {
			if (input.type === 'password') {
				input.type = 'text';
				icon.src = 'https://img.icons8.com/?size=100&id=beUVRGiJjkAO&format=png&color=000000';
				icon.alt = 'Ocultar contraseña';
			} else {
				input.type = 'password';
				icon.src = 'https://img.icons8.com/?size=100&id=85028&format=png&color=000000';
				icon.alt = 'Mostrar contraseña';
			}
		}
		
		function verificarContrasenas() {
	        var contrasena1 = document.getElementsByName('contrasena')[0].value;
	        var contrasena2 = document.getElementsByName('contrasena2')[0].value;

	        if (contrasena1 === contrasena2) {

	            document.getElementById('submitBtn').click();
	        } else {
	            alert('Las contraseñas no coinciden');
	        }
	    }

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
