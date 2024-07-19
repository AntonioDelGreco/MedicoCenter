<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Administración</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">

<style>
html, body {
	padding: 0;
	margin: 0;
}

.header, .header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #ACE0FF;
	width: 100%;
	height: 12vh;
}

.header img {
	height: 3em;
	padding-right: 1em;
	filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.25));
}

.username {
	display: flex;
	align-items: center;
	justify-content: space-between;
	font-size: 1.2em;
	padding-left: 1em;
	color: black;
}

.username p {
	font-weight: bold;
	font-size: 1.5em;
	filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.25));
}

.logout-button {
	padding-right: 1em;
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
</style>

</head>
<body>

	<div class="header-container">
		<div class="header">
			<div class="username">
				<img
					src="https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png"
					alt="Descripción ">
				<p id="usernameDisplay">
					<c:if test="${medicoLogueado!=null}"><c:out value="${medicoLogueado.apellido }, ${medicoLogueado.nombre}"/></c:if>
					<c:if test="${medicoLogueado==null}">Admin</c:if>
				</p>
			</div>
			<div class="logout-button">
				<form action="cerrar_sesion.html" method="post">
					<button class="button" type="submit">Cerrar
						Sesión</button>
				</form>
			</div>
		</div>
	</div>

</body>


</html>
