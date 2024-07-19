<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Iniciar sesión</title>
    <link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #4A97FF;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 300px;
	max-width: 90%;
	text-align: center;
}

.login-container h2 {
	color: #333;
	filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.25));
}

.login-container input[type="text"], .login-container input[type="password"]
	{
	width: calc(100% - 20px);
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
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

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 400px;
	border-radius: 5px;
	text-align: center;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="login-container">
		<h2>Iniciar sesión</h2>
		<form action="procesar_login.html" method="post">
			<input type="text" name="username" placeholder="Usuario" required><br>
			<input type="password" name="clave" placeholder="Contraseña" required><br>
			<button type="submit" class="button">Ingresar</button>
		</form>


		<div id="errorModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeModal()">&times;</span>
				<p id="errorMessage"></p>
			</div>
		</div>
	</div>

</body>

<script>
	//Modal para los mensajes de error
    function displayErrorModal(message) {
        var modal = document.getElementById('errorModal');
        var errorMessage = document.getElementById('errorMessage');
        errorMessage.textContent = message;
        modal.style.display = 'block';
        
        
        setTimeout(function() {
            closeModal();
        }, 1500);
    }


    function closeModal() {
        var modal = document.getElementById('errorModal');
        modal.style.display = 'none';
    }

    // Verifica si hay mensaje de error y muestra el modal al cargar la página
    var errorMessage = '${mensaje}';
    if (errorMessage) {
        displayErrorModal(errorMessage);
    }
    


</script>
</html>
