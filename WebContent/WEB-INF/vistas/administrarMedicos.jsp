<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    justify-content: center; /* Centrar los botones horizontalmente */
    margin-top: 50px;
}

.admin-options > div {
    margin: 10px; /* Espacio entre los contenedores de botones */
    text-align: center;
}

.admin-options button {
    width: 200px;
    height: 100px;
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
                <div>
                    <form action="redireccionar_insertarMedico.html" method="post">
                        <button type="submit" name="page" value="altaMedico">ALTA de Medico</button>
                    </form>
                </div>
                <div>
                    <form action="controller.html" method="post">
                        <button type="submit" name="page" value="bajaMedico">BAJA de Medico</button>
                    </form>
                </div>
                <div>
                    <form action="controller.html" method="post">
                        <button type="submit" name="page" value="busquedaMedicoEdicion">MODIFICAR Medico</button>
                    </form>
                </div>
                <div>
                    <form action="redireccionar_listarMedicos.html" method="post">
                        <button type="submit" name="redireccionar_listarMedico" value="listarMedico">LISTAR Medico</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
