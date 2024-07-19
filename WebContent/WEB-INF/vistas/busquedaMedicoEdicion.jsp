<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buscar Medico</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
</head>
<style>
.adminPanel-container {
	display: flex;
}

.content-container {
	width: 100%;
	margin-left: 280px;
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

.form-title {
	text-align: center;
	margin-bottom: 20px;
}

.action-buttons {
	text-align: center;
	margin-top: 20px;
}
</style>
<body>

	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="form-container">
				<form action="redireccionar_editarMedico.html" method="get">
					<div class="form-title">
						<h2>Buscar Médico</h2>
					</div>
					<div style="text-align: center;">
						<a>Inserte el Legajo del Médico:</a> <input type="text"
							name="legajo" required>
						<button type="submit" class="search-button">Buscar</button>
					</div>
				</form>
			</div>
		</div>
</body>
</html>

