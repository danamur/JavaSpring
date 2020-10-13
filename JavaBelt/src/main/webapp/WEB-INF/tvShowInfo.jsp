<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
 <a class="navbar-brand" href="/tvshows">Programa de Televisión</a>
	<a href="/logout"><button class="btn btn-danger right">Salir</button></a>
</nav>
	
		<div class="container mt-5">
			<h4 class="text-center">Programa: <c:out value="${tvshow.title}" /></h4>
			<h4 class="text-center">Network: <c:out value="${tvshow.network}" /></h4>
			
			<div class="row justify-content-center">
				<div class="col-sm-8 mt-5">
					<h4>Calificaciones de usuarios</h4>
					<table class="table table-bordered">
						<thead>
							<tr class="bg-secondary">
								<th>Nombre</th>
								<th>Rating</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				
				<a href="/tvshows/${tvshow.id}/edit"><button class="btn btn-outline-warning">Editar</button></a>
				<a href="/tvshows"><button class="btn btn-outline-danger">Cancel</button></a>
			</div>
			
			<div class="col-sm-8 mt-5">
				<h4>Califica este programa!</h4>
				<form:form method="POST" action="" modelAttribute="rating">
					<div class="form-group">
				        <form:label path="value" for="value">Tu calificación:</form:label>
				        <form:input type="number" path="value" class="form-control"/>
				    </div>
			        <button type="submit" class="btn btn-outline-success">Calificar</button>
				</form:form>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>