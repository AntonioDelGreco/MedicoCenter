<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.sidebar {
	display: flex;
	flex-direction: column;
	width: 250px;
	height: 100vh;
	position:fixed;
	background-color: #4A97FF;
	padding: 0 1em;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.25);
}

.sidebar-title {
	height: 12vh;
	display: flex;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid #000;
}

.sidebar-title h2 {
	font-size: 2.4em;
	filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.25));
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	margin: 1em 0;
}

.sidebar ul li button {
	color: #000;
	background-color: transparent;
	border: none;
	font-size: 1.1em;
	padding: 0.5em;
	width: 100%;
	text-align: left;
	cursor: pointer;
	border-radius: 0.3em;
	transition: background-color 0.3s;
}

.sidebar ul li button:hover {
	background-color: #ACE0FF;
}
</style>

<div class="sidebar">
	<div class="sidebar-title">
		<h2>MedCenter</h2>
	</div>
	<ul>

		<form action="controller.html" method="post">
			<li>
				<button type="submit" name="page" value="adminHome">Inicio</button>
			</li>
			<li>
				<button type="submit" name="page" value="administrarPacientes">Administrar
					pacientes</button>
			</li>
			<li>
				<button type="submit" name="page" value="administrarMedicos">Administrar
					medicos</button>
			</li>
		</form>
		<form action="asignarTurno.html" method="post">
			<li>
				<button type="submit" name="page" value="asignarTurno">Asignar
					turnos</button>

			</li>
		</form>
		<form action="controller.html" method="post">
			<li>
				<button type="submit" name="page" value="informes">Obtener
					informes</button>
			</li>
		</form>
	</ul>
</div>
