	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" text/html; charset=ISO-8859-1">
<title>Administrar Medicos</title>
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
                <form action="redireccionar_altaPaciente.html" method="post">
                    <button type="submit" name="redireccionar_altaPaciente" value="altaPaciente">ALTA de Paciente</button>
                </form>
                <form action="redireccionar_bajaPaciente.html" method="post">
                    <button type="submit" name="redireccionar_bajaPaciente" value="bajaPaciente">BAJA de Paciente</button>
                </form>
                <form action="redireccionar_modificarPaciente.html" method="post">
                    <button type="submit" name="redireccionar_modificarPaciente" value="modificarPaciente">MODIFICAR Paciente</button>
                </form>
                <form action="redireccionar_listarPaciente.html" method="post">
                    <button type="submit" name="redireccionar_listarPaciente" value="listarPaciente">LISTAR Paciente</button>
                </form>
            </div>
		</div>
	</div>
</body>
</html>