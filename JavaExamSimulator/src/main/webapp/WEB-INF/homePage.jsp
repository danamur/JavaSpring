<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pagina Inicial</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
	<div class="row justify-content-center">
		<div>
			<h1>
				Bienvenido, <c:out value="${user.name}"/>
			</h1>
		</div>
		<div class="col-sm-12 text-center">
			Courses <a href="/lowhigh">Low Sign Up</a> | <a href="/highlow">High Sign Up</a> | <a href="/logout">Logout</a>
		</div>
		
		<div>
			<table class="table table-bordered table-hover mt-4">
				<thead>
					<tr>
						<td>Curso</td>
						<td>Instructor</td>
						<td>Inscripciones</td>
						<td>Acción</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${course}" var="course">
						<tr>
							<td><a href="/courses/${course.id}">${course.name}</a></td>
							<td>${course.instructor}</td>
							<td>${course.getUsers().size()} / ${course.capacity}</td>
							<td>
								<c:choose>
									<c:when test="${course.getUsers().indexOf(user)!= -1}">
										Estas agregado
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${course.getUsers().size()== course.capacity}">
												Lleno
											</c:when>
											<c:otherwise>
												<a href="/courses/add/${course.id}/">Agregar</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="text-center mt-4">
				<a href="/courses/new" class="btn btn-outline-success">Agregar Curso</a>
			</div>
			
		</div>
	</div>
	
	
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>