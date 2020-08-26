<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ejercicio 1</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="/question1">Ejercicio 1</a>
				<a class="nav-item nav-link active" href="/question2">Ejercicio 2</a>
				<a class="nav-item nav-link active" href="/question3">Ejercicio 3</a>
				<a class="nav-item nav-link active" href="/question4">Ejercicio 4</a>
				<a class="nav-item nav-link active" href="/question5">Ejercicio 5</a>
				<a class="nav-item nav-link active" href="/question6">Ejercicio 6</a>
				<a class="nav-item nav-link active" href="/question7">Ejercicio 7</a>
				<a class="nav-item nav-link active" href="/question8">Ejercicio 8</a>
			</div>
		</div>
	</nav>
	
	
	<div class="row m-0 justify-content-center vh-100 mt-5">
		<div class="col-sm-7">
			<div class="card border-dark">
				<div class="card-header text-center text-light bg-dark">
					<h1>${numEjercicio}</h1>			
				</div>
				<div class="card-body">
					<h5 class="my-3">${descripcion}</h5>
					<table class="table table-bordered table-hover">
						
						<!-- Creacion de las columnas-->
						
						<thead>
			                <c:forEach items="${columns}" var="name">
			                    <th>${name}</th>
			                </c:forEach>
						</thead>
						
						<!-- Insertar Datos a las columnas -->
						
						<tbody>
				            <c:forEach items="${tabla}" var="row">
				                <tr>
				                <c:forEach items="${row}" var="data">
				                    <td>${data}</td>
								</c:forEach>
				                </tr>
				            </c:forEach>
				        </tbody>
				    </table>			
				</div>
			</div>
		</div>
	</div>


	

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>