<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inicio</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">

<style>
        .adminPanel-container {
            display: flex;
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.25);   
        }

        .content-container {
        	margin-left:280px;
            width: 100%;
            height: 100%;
        }

        .content-box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 1em; 
        }

        .content-box h2 {
            font-size: 2.5em;
        }

        .description-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }

        .description-text {
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            border: 1px solid #000;
            border-radius: 1em;
            padding: 2em 4em;
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.25);
        }

        .description-text p {
            font-size: 1.5em;
            font-weight: bold;
            border-bottom: 1px solid #000;
        }
        
        .description-text li {
            font-size: 1.2em;
            padding: .5em;
        }

        .button {
            padding: .5em;
            margin: .5em;
            font-size: 1.4em;
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
	<div class="adminPanel-container">
		<%@ include file="sideBarMenu.jsp"%>
		<div class="content-container">
			<%@ include file="header.jsp"%>
			<div class="content-box">
				<h2>Bienvenido Admin</h2>
				<div class="description-container">
                    <img src="https://cdn.iconscout.com/icon/free/png-256/free-administrator-2166550-1836773.png" alt="">
					<div class="description-text">
						<p>Recorda que como administrador podes:</p>
						<ul>
							<li>Dar de alta, baja, modificar y ver los pacientes</li>
							<li>Dar de alta, baja, modificar y ver los medicos</li>
							<li>Asignar turnos</li>
							<li>Obtener informes sobre los turnos existentes</li>
						</ul>
						<form action="controller.html" method="post">
							<button type="submit" name="page" value="adminHome" class="button">Comenzar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	var user = {
		username : '${username}',
		userType : '${userType}' // Aca puede ser "medico" o "admin"
	};

	// Convertir userData a JSON
	var userDataJSON = JSON.stringify(user);

	localStorage.setItem('userData', userDataJSON);
</script>
</html>