<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" text/html; charset=ISO-8859-1">
<title>Inicio</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">

<style>
.adminPanel-container {
	display: flex;
}

.content-container {
	margin-left:280px;
	width: 100%;
}

.admin-options {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: flex-start;
    margin-top: 50px;
}

.admin-options button {
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

.admin-options button:hover {
    background-color: #219ebc;
    color: white;
}
</style>

</head>
<body>
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
            <div class="admin-options">
                <form action="controller.html" method="post">
                    <button type="submit" name="page" value="administrarPacientes">Administrar pacientes</button>
                </form>
                <form action="controller.html" method="post">
                    <button type="submit" name="page" value="administrarMedicos">Administrar medicos</button>
                </form>
                <form action="controller.html" method="post">
                    <button type="submit" name="page" value="asignarTurno">Asignar turnos</button>
                </form>
                <form action="controller.html" method="post">
                    <button type="submit" name="page" value="informes">Obtener informes</button>
                </form>
            </div>
		</div>
	</div>
</body>
</html>