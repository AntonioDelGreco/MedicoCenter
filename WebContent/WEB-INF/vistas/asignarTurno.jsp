<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asignar Turno</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
<style>
.medicPanel-container {
	display: flex;
}

.content-container {
	margin-left:280px;
	width: 100%;
}

.medic-options {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: flex-start;
	margin-top: 50px;
}

.medic-options button {
	display: block;
	width: 200px;
	height: 100px;
	margin: 20px;
	text-align: center;
	background-color: #8ecae6;
	color: black;
	text-decoration: none;
	font-weight: bold;
	border-radius: 10px;
	border: none;
	cursor: pointer;
	font-size: 16px;
}

.medic-options button:hover {
	background-color: #219ebc;
	color: white;
}

.adminPanel-container {
	display: flex;
}

.content-container {
	width: 100%;
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

.form-table input[type="text"], .form-table input[type="date"],
	.form-table select {
	width: calc(100% - 20px);
	padding: 5px;
	box-sizing: border-box;
}

.button {
	padding: .5em;
	margin: .5em;
	font-size: 1em;
	font-weight: bold;
	color: #000;
	background-color: #4A97FF;
	border-radius: .5em;
	border: 1px solid #000;
	white-space: nowrap;
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.25);
}

.button:disabled {
	opacity: 0.5;
	cursor: not-allowed;
	pointer-events: none;
}

.button:hover {
	color: #000;
	background-color: #ACE0FF;
	border: 1px solid #4A97FF;
	transform: scale(1.05);
	transform-origin: center;
	transition: .3s;
	cursor: pointer;
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

.pacienteContainer {
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var dias;
	var legajo;
	var horario;

	//Bloquear fechas anteriores: 	
	var fecha = new Date();
	var anio = fecha.getFullYear();
	var dia = fecha.getDate();
	var _mes = fecha.getMonth();
	_mes = _mes + 1;
	if (_mes < 10) {
		var mes = "0" + _mes;
	} else {
		var mes = _mes.toString;
	}

	let fecha_minimo = anio + '-' + mes + '-' + dia;

	document.getElementById("fecha").setAttribute('min', fecha_minimo);

	function CargarMedicosPorEspecialidad() {

		$('#medicoTr').hide();
		$('#diasMostrar').hide();
		$('#horarioTr').hide();

		var especialidadId = $('#especialidad').val();
		$
				.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/cargarMedicosPorEspecialidad.html",
					data : {
						idEspecialidad : especialidadId
					},
					success : function(response) {
						var parsedHTML = $.parseHTML(response);
						var medicoSelect = $(parsedHTML).find('#medico');
						$('#medico').empty(); // Limpiar opciones anteriores
						$('#medico').html(medicoSelect.html());

						// Mostrar el campo de selección de médicos
						$('#medicoTr').show();
					},
					error : function(error) {
						alert("Error al cargar los médicos. Por favor, inténtelo de nuevo.");
					}
				});
	}

	function buscarPaciente() {
		var dni = $('#dniPaciente').val();
		$
				.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/buscarPacienteTurno.html",
					data : {
						dni : dni
					},
					success : function(response) {
						var parsedHTML = $.parseHTML(response);
						var pacienteHTML = $(parsedHTML).find('#paciente');

						$('#datosPaciente').html(pacienteHTML.html());

						$('#datosPaciente').show();
					},
					error : function(error) {
						alert("Error al buscar el paciente. Por favor, inténtelo de nuevo.");
					}
				});
	}

	function turnosNoDisponibles(legajo, fecha, horario) {

		$
				.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/turnosNoDisponibles.html",
					data : {
						legajo : legajo,
						fecha : fecha,
						horario : horario
					},
					success : function(response) {
						var parsedHTML = $.parseHTML(response);
						var horarioHTML = $(parsedHTML).find('#horario');

						$('#horario').empty();
						$('#horario').html(horarioHTML.html());
						$('#horarioTr').show();

					},
					error : function(error) {
						alert("Error al traer turnos");
					}
				});
	}

	function validarFormulario() {
		var paciente = $('#datosPaciente').text().trim();
		if (paciente === "" || paciente === "Paciente no encontrado.") {

			alert("Debe buscar y seleccionar un paciente válido antes de asignar el turno.");
			return false; 
		}
		return confirm('¿Estás seguro de asignar el turno?'); 
	}

	function cargarHorarios(select) {
		var selectedIndex = select.selectedIndex;
		var medicoOption = select.options[selectedIndex];
		legajo = medicoOption.getAttribute('data-legajo');
		horario = medicoOption.getAttribute('data-horarios');
		dias = medicoOption.getAttribute('data-dias');
		document.getElementById('diasDisponibles').textContent = dias;

		$('#diasMostrar').show();

	}

	function validarDias() {
		var fechaSeleccionada = document.getElementById("fecha").value;
		
		var fecha2=new Date();
		

		// Crear un objeto de fecha con la fecha seleccionada
		var fecha = new Date(fechaSeleccionada);

		if(fecha<fecha2){
			alert("Fecha invalida " + fechaSeleccionada);
		}else{
		// Obtener el día de la semana (0: Domingo, 1: Lunes, ..., 6: Sábado)
		var diaSemana = fecha.getDay();

		console.log(diaSemana)
		// Array con los nombres de los días de la semana
		var diasSemana = [ 'Lunes', 'Martes', 'Miercoles', 'Jueves',
				'Viernes', 'Sabado', 'Domingo' ];

		// Obtener el nombre del día de la semana
		var nombreDia = diasSemana[diaSemana];

		// Dividir los días disponibles en un array si es necesario
		var diasArray = dias.split(',');

		var diaEstado = false;

		for (var i = 0; i < diasArray.length; i++) {
			if (nombreDia == diasArray[i]) {
				diaEstado = true;
			}
		}

		if (diaEstado == false) {
			alert("El dr no atiende los dias " + nombreDia);
			document.getElementById("fecha").value = "";
		} else {
			turnosNoDisponibles(legajo, fechaSeleccionada, horario);
		}
		}
	}
</script>

</head>
<body>
	<div class="medicPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<form action="confirmarTurno.html" method="post"
				onsubmit="return validarFormulario();">
				<div class="form-container">
					<hr>
					<h2>Asignacion de turnos</h2>
					<table class="form-table">
						<tr>
							<td>Especialidad:</td>
							<td><select name="especialidad" id="especialidad"
								onChange="CargarMedicosPorEspecialidad()" required>
									<option value="" disabled selected>Seleccione una
										especialidad</option>
									<c:forEach var="especialidad" items="${especialidades}">
										<option value="${especialidad.id}">${especialidad.nombre}</option>
									</c:forEach>
							</select></td>
							</select>
							</td>
						</tr>
						<tr id="medicoTr" style="display: none;">
							<td>Medico:</td>
							<td><select name="medico" id="medico"
								onchange="cargarHorarios(this)" required>
									<option value="" disabled selected>Seleccione un
										medico</option>
									<c:forEach var="medico" items="${medicos}">
										<option value="${medico.legajo}" data-dias="${medico.dias}"
											data-horarios="${medico.horarios}"
											, data-legajo="${medico.legajo}">${medico.nombre}
											${medico.apellido}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr id="diasMostrar" style="display: none;">
							<td>Fecha</td>
							<td>
								<div>
									Dias disponibles: <b id="diasDisponibles"></b>
								</div> <input type="date" id="fecha" name="fecha"
								onchange="validarDias()" required>
							</td>
						</tr>
						<tr id="horarioTr" style="display: none;">
							<td>Hora</td>
							<td><select name="horario" id="horario" required>
									<option value="" disabled selected>Seleccione un
										horario</option>
									<c:forEach var="turno" items="${turnos}">
										<option value="${turno}">${turno}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>Paciente</td>
							<td><input type="text" id="dniPaciente" name="dniPaciente"
								placeholder="DNI" pattern="\d{7,8}" required>
								<div class="pacienteContainer">
									<button type="button" onclick="buscarPaciente()" class="button">Buscar</button>
									<div id="datosPaciente" style="display: none;">
										<c:choose>
											<c:when test="${not empty paciente}">
												<p id="paciente">Paciente encontrado: ${paciente.nombre}
													${paciente.apellido}</p>
											</c:when>
											<c:otherwise>
												<p id="paciente">Paciente no encontrado.</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div></td>
						</tr>
					</table>
					<div class="action-buttons">
						<button type="submit" class="button">Asignar turno</button>
					</div>
					<c:if test="${not empty mensaje}">
						<div class="message">${mensaje}</div>
					</c:if>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
