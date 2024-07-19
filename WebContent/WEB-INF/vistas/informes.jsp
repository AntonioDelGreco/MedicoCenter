<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Medicos</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
<style>
    .adminPanel-container {
    display: flex;
}
.content-container {
	margin-left:280px;
    width: 100%;
}

.titulo-paginas{
		text-align:center;

	}
	.subtitulo-paginas{
		text-align:left;
		 padding: 20px;
		 padding-bottom:0px;
	}
	
	.busqueda,.filtros{
		width:100%;
		padding:20px;
		border: 1px solid #ddd;
		
	}
	.filtros input, .filtros button, .filtros select {
		width:70%;
		text-align:center;
	
	}
	.filtros input[type="date"]{
		width: calc(70% - 8px);
		padding: 8px;
		box-sizing: border-box;
	}
	.resultados{
		width:60%;
		border: 1px solid #ddd;
		padding: 20px;
		background-color: #f2f2f2;
	}
	.resultados-container{
		width:100%;
		padding:20px;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.filtros button[type="submit"]{
		background-color: #007BFF;
		color: white;
		border: none;
		padding: 8px 16px;
		cursor: pointer;
		border-radius: 4px;
	}
	.filtros button[type="submit"]:hover {
		background-color: #0056b3;
	}
	.lineas-resultados{
		line-height:8px;
	}

</style>
</head>
<body>
    <div class="adminPanel-container">
        <%@ include file="sideBarMenu.jsp"%>
        <div class="content-container">
            <%@ include file="header.jsp"%>  
             <h1 class="titulo-paginas">Informes</h1>
             <h2 class="subtitulo-paginas">Estado de Turnos</h2>
            <form action="informeEstadoTurnos.html" method="POST" class="form-busqueda">           
            	<table class="filtros">
            	<tr>
            		<td >Desde: </td>
            		<td><input type="date"  name="fechaInicio" id="fechaInicio" required></td>
            		<td>Hasta: </td>
            		<td><input type="date" name="fechaFin" id="fechaFin" required></td>
            		<td><button type="submit" name="filtrarEstado">Generar</button></td>
            	</tr>         
            </table>   
            </form>
            <div class="resultados-container">
	            <div class="resultados">
	            <c:if test="${not empty resultados1}">
	            	<h3>Resultados</h3>
		            <c:forEach var="resultado" items="${resultados1}">
		                <p class="lineas-resultados">--- ${resultado[0]}% ${resultado[1]} ${resultado[2]}</p> 
		            </c:forEach>		            
		        </c:if>
		        <c:if test="${not empty mensajeEstado}">
		        		<p style="text-align:center">${mensajeEstado}</p>
		        </c:if>
	            	
	            </div>
            </div>
            <h2 class="subtitulo-paginas">Turnos por Especialidad</h2>
          	<form action="informeTurnosEspecialidad.html" method="post" class="form-busqueda">           
            	<table class="filtros">
            	<tr>
            		<td >Desde: </td>
            		<td><input type="date" name="fechaInicio" id="fechaInicio" required></td>
            		<td>Hasta: </td>
            		<td><input type="date" name="fechaFin" id="fechaFin" required></td>
            		<td><button type="submit" name="filtrarEstado">Generar</button></td>
            	</tr>         
            </table>   
            </form>
            <div class="resultados-container">
	            <div class="resultados">
	            	<c:if test="${not empty resultados2}">
		            	<h3>Resultados</h3>
			            <c:forEach var="resultado" items="${resultados2}">
			                <p class="lineas-resultados">--- ${resultado[0]}% ${resultado[1]} ${resultado[2]}</p> 
			            </c:forEach>
		        	</c:if>
		        	<c:if test="${not empty mensajeEstado2}">
		        		<p style="text-align:center">${mensajeEstado2}</p>
		        	</c:if>
	            </div>
            </div>
        </div>
    </div>
</body>
</html>
