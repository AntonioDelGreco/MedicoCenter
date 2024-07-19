<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Listar Pacientes</title>
    <link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .adminPanel-container {
            display: flex;
        }

        .content-container {
            width: 100%;
            box-sizing: border-box;
            margin-left:280px;
        }

        .table-medicos {
            width: 100%;
            border-collapse: collapse;
        }

        .table-medicos th, .table-medicos td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .table-medicos th {
            background-color: #f2f2f2;
        }

        .table-medicos tr:hover {
            background-color: #f1f1f1;
        }

        .table-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .titulo-paginas {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .subtitulo-paginas {
            text-align: left;
            padding: 20px;
            padding-bottom: 0px;
        }

        a {
            text-decoration: none;
        }

        .action-buttons {
            text-align: center;
            margin-top: 20px;
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

        .message {
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            font-weight: bold;
            color: #f44336;
        }
        
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0;
            margin-left: 4px;
            margin-right: 4px;
            display: inline-block;
            border: none;
            background: transparent;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            color: white !important;
            background: #007BFF !important;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            padding: 0;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.disabled {
            background: transparent;
            color: grey;
        }

        .dataTables_wrapper .dataTables_info {
            padding-top: 0;
        }

        .dataTables_wrapper .dataTables_length {
            padding-bottom: 10px;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: #ddd;
            color: black;
            border-radius: 50%;
        }

        .dataTables_wrapper .dataTables_filter {
            float: right;
        }

        .header {
            width: 100%;
            background-color: #8ecae6;
            padding: 20px;
            box-sizing: border-box;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <div class="adminPanel-container">
        <%@ include file="sideBarMenu.jsp"%>
        <div class="content-container">
            <%@ include file="header.jsp"%>
            <div class="form-container" style="padding: 20px;">
                <h1 class="titulo-paginas">Listado de Pacientes</h1>
                <form action="buscarPaciente.html" method="post">
                    <div style="text-align: center;">
                        <label for="dni">Buscar por DNI:</label>
                        <input type="number" id="dni" name="dni" min="1" required>
                        <input type="hidden" name="viewName" value="listarPaciente">
                        <button type="submit" class="search-button">Buscar</button>
                    </div>
                    <c:if test="${not empty mensaje}">
                        <div class="message">${mensaje}</div>
                    </c:if>
                    <c:if test="${not empty mensaje2}">
                        <div class="message-confirmation">${mensaje2}</div>
                    </c:if>
                </form>
                <c:choose>
                    <c:when test="${empty pacienteBuscado and empty mensaje}">
                        <table id="tablaPacientes" class="table-medicos display">
                            <thead>
                                <tr>
                                    <th>DNI</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Fecha de Nacimiento</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="paciente" items="${pacientes}">
                                    <tr>
                                        <td>${paciente.dni}</td>
                                        <td>${paciente.nombre}</td>
                                        <td>${paciente.apellido}</td>
                                        <td>${paciente.fechaNacimiento}</td>
                                        <td>${paciente.estado ? 'Activo' : 'Inactivo'}</td>
                                        <td class="table-actions">
                                            <form action="buscarPaciente.html" method="post">
                                                <input type="hidden" name="dni" value="${paciente.dni}">
                                                <input type="hidden" name="viewName" value="listarPaciente">
                                                <input type="submit" value="Ver" name="btnVer">
                                            </form>
                                            <form action="buscarPaciente.html" method="post">
                                                <input type="hidden" name="dni" value="${paciente.dni}">
                                                <input type="hidden" name="viewName" value="modificarPaciente">
                                                <input type="submit" value="Editar" name="btnVer">
                                            </form>
                                            <form action="buscarPacienteEliminar.html" method="post">
                                                <input type="hidden" name="dni" value="${paciente.dni}">
                                                <input type="hidden" name="viewName" value="bajaPaciente">
                                                <input type="submit" value="Eliminar" name="btnVer">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </c:when>
                    <c:when test="${not empty pacienteBuscado}">
                        <table class="table-medicos">
                            <h2 class="subtitulo-paginas">Detalles del Paciente</h2>
                            <tr>
                                <th>DNI</th>
                                <td>${pacienteBuscado.dni}</td>
                            </tr>
                            <tr>
                                <th>Nombre</th>
                                <td>${pacienteBuscado.nombre}</td>
                            </tr>
                            <tr>
                                <th>Apellido</th>
                                <td>${pacienteBuscado.apellido}</td>
                            </tr>
                            <tr>
                                <th>Fecha de Nacimiento</th>
                                <td>${pacienteBuscado.fechaNacimiento}</td>
                            </tr>
                            <tr>
                                <th>Dirección</th>
                                <td>${pacienteBuscado.direccion}</td>
                            </tr>
                            <tr>
                                <th>Localidad</th>
                                <td>${pacienteBuscado.localidad.nombre}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${pacienteBuscado.email}</td>
                            </tr>
                            <tr>
                                <th>Teléfono</th>
                                <td>${pacienteBuscado.telefono}</td>
                            </tr>
                            <tr>
                                <th>Estado</th>
                                <td>${pacienteBuscado.estado ? 'Activo' : 'Inactivo'}</td>
                            </tr>
                        </table>
                        <div class="action-buttons">
                            <a href="redireccionar_listarPaciente.html" class="submit-button">Volver a la lista</a>
                        </div>
                    </c:when>
                    <c:when test="${empty pacienteBuscado and not empty mensaje}">
                        <div class="action-buttons">
                            <a href="redireccionar_listarPaciente.html" class="submit-button">Volver a la lista</a>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#tablaPacientes').DataTable({
                language: {
                    url: 'https://cdn.datatables.net/plug-ins/1.11.4/i18n/es-ES.json'
                },
                "dom": '<"top"lf>rt<"bottom"ip><"clear">',
            });
        });
    </script>
</body>
</html>
