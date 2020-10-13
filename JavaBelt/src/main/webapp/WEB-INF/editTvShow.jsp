<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Editar Programa</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
 <a class="navbar-brand" href="/tvshows">Programa de Televisión</a>
	<a href="/logout"><button class="btn btn-danger right">Salir</button></a>
</nav>

	<div class="row justify-content-center mt-5">
		<div class="col-sm-5">
			<div class="card">
				<div class="card-header text-light bg-dark text-center">
					<h2>
						Editar Programa
					</h2>
				</div>
				<div class="card-body">
					<form:form method="POST" action="/tvshows/${tvshow.id}/update" modelAttribute="tvshow">
						<table>
							<tr>
						        <form:label path="title" for="title">Programa:</form:label>
						        <form:errors path="title"/>
						        <form:input path="title" class="form-control" placeholder="Inserte el titulo" />
							</tr>
							<tr>
						        <form:label path="network" for="network">Network: </form:label>
						        <form:errors path="network"/>
						        <form:input path="network" class="form-control" placeholder="Insert network" />
							</tr>
						</table>
						<input class="btn btn-outline-success mt-3 ml-3" type="submit" value="Actualizar"/>
					</form:form>
					<a href="/tvshows/${tvshow.id}/delete"><button class="btn btn-outline-danger mt-3 ml-3">Eliminar Programa</button></a>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>