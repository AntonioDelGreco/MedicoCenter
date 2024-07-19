<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Medico</title>
    <link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">

<style>
.adminPanel-container {
	display: flex;
}

.content-container {
	width: 100%;
	margin-left: 280px;
}

.form-title {
	text-align: center;
	margin-bottom: 20px;
}


.form-container {
	display: flex;
	justify-content: center;
	align-items: center;

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

.checkbox-container {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
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
</style>

</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container">
				<form action="modificarMedico.html" method="post" onsubmit="return confirm('¿Estás seguro de que deseas modificar este médico?');">
					<div class="form-title">
						<h2>Modificar Médico</h2>
					</div>
					<input type="hidden" name="legajo" value="${medico.legajo}">
					<table class="form-table">
						<tr>
							<td>Nombre</td>
							<td><input type="text" value="${medico.nombre}"
								name="nombre" required></td>
						</tr>
						<tr>
							<td>Apellido</td>
							<td><input type="text" value="${medico.apellido}"
								name="apellido" required></td>
						</tr>
						<tr>
							<td>Sexo</td>
							<td>
								<div class="radio-container">
									<label><input type="radio" name="sexo" value="F"
										${medico.sexo == 'F' ? 'checked' : ''} required>
										Femenino</label> <label><input type="radio" name="sexo"
										value="M" ${medico.sexo == 'M' ? 'checked' : ''} required>
										Masculino</label> <label><input type="radio" name="sexo"
										value="otro" ${medico.sexo == 'otro' ? 'checked' : ''}
										required> Otro</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>Nacimiento</td>
							<td><input type="date" value="${medico.nacimiento}"
								name="nacimiento" required></td>
						</tr>
						<tr>
							<td>Dirección</td>
							<td><input type="text" value="${medico.direccion}"
								name="direccion" required></td>
						</tr>

						<tr>
							<td>Provincia</td>
							<td><select name="provincia" id="provinciaSelect"
								onchange="cargarLocalidades()" required>
									<option value="" disabled>Seleccione una provincia</option>
									<c:forEach var="provincia" items="${provincias}">
										<option value="${provincia.idProvincia}"
											${provincia.idProvincia == medico.localidad.provincia.idProvincia ? 'selected' : ''}>${provincia.nombre}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>Localidad</td>
							<td><select name="localidad" id="localidadSelect" required>
									<option value="" disabled>Seleccione una localidad</option>
									<c:forEach var="localidad" items="${localidades}">
										<option value="${localidad.idLocalidad}"
											${localidad.idLocalidad == medico.localidad.idLocalidad ? 'selected' : ''}>${localidad.nombre}</option>
									</c:forEach>
							</select></td>
						</tr>

						<tr>
							<td>Correo</td>
							<td><input type="email" value="${medico.correo}"
								name="correo" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}" required></td>
						</tr>
						<tr>
							<td>Teléfono</td>
							<td><input type="text" value="${medico.telefono}"
								name="telefono" required></td>
						</tr>
						<tr>
							<td>Días</td>
							<td>
								<div class="checkbox-container">
									<label><input type="checkbox" name="dias" value="Lunes"
										${medico.dias != null && medico.dias.contains('Lunes') ? 'checked' : ''}>
										Lunes</label> <label><input type="checkbox" name="dias"
										value="Martes"
										${medico.dias != null && medico.dias.contains('Martes') ? 'checked' : ''}>
										Martes</label> <label><input type="checkbox" name="dias"
										value="Miercoles"
										${medico.dias != null && medico.dias.contains('Miercoles') ? 'checked' : ''}>
										Miércoles</label> <label><input type="checkbox" name="dias"
										value="Jueves"
										${medico.dias != null && medico.dias.contains('Jueves') ? 'checked' : ''}>
										Jueves</label> <label><input type="checkbox" name="dias"
										value="Viernes"
										${medico.dias != null && medico.dias.contains('Viernes') ? 'checked' : ''}>
										Viernes</label> <label><input type="checkbox" name="dias"
										value="Sabado"
										${medico.dias != null && medico.dias.contains('Sabado') ? 'checked' : ''}>
										Sábado</label> <label><input type="checkbox" name="dias"
										value="Domingo"
										${medico.dias != null && medico.dias.contains('Domingo') ? 'checked' : ''}>
										Domingo</label>
								</div>
							</td>

						</tr>
						<tr>
							<td>Horarios</td>
							<td>
								<div class="time-input-container">
									<label for="horaInicio">De: </label> <input type="text"
										id="horaInicio" name="horaInicio" class="time-input" required
										value="${medico.horarios.substring(0, 5)}"> <label
										for="horaFin">a: </label> <input type="text" id="horaFin"
										name="horaFin" class="time-input" required
										value="${medico.horarios.substring(medico.horarios.length() - 5)}">
								</div>
							</td>
						</tr>


						<tr>
							<td>Especialidad</td>
							<td><select name="especialidad" required>
									<c:forEach var="especialidad" items="${especialidades}">
										<option value="${especialidad.id}"
											${medico.especialidad.id == especialidad.id ? 'selected' : ''}>${especialidad.nombre}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>Estado</td>
							<td><select name="estado" required>
									<option value="true" ${medico.estado ? 'selected' : ''}>Habilitado</option>
									<option value="false" ${!medico.estado ? 'selected' : ''}>Deshabilitado</option>
							</select></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<button type="submit" class="submit-button">Actualizar
							Medico</button>
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
