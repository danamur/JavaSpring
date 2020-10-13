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

	<div class="container">
		<div class="text-center mt-5">
			<h1>Bienvenido! <c:out value="${user.name}" /></h1>
		</div>
		
		<table class="table table-bordered table-hover mt-4">
			<thead>
				<tr>
					<th>Programa Tv</th>
					<th>Network</th>
					<th>Calificación</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tvshows}" var="tvshow">
					<tr>
						<td><a href="/tvshows/${tvshow.id}"><c:out value="${tvshow.title}"/></a></td>
						<td><c:out value="${tvshow.network}"/></td>
						<td>Calificacion</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<a href="/tvshows/new"><button class="btn btn-outline-success mt-5">Agregar Programa</button></a>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>