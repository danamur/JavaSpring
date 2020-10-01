<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Editar Curso</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
	<div class="row justify-content-center mt-5">
		<div class="col-sm-5">
			<div class="card">
				<div class="card-header text-light bg-dark text-center">
					<h2>
						Editar curso <c:out value="${course.name}"/>
					</h2>
				</div>
				<div class="card-body">
					<form:form method="POST" action="/courses/update" modelAttribute="course">
						<form:input path="id" type="hidden"/>
						<form:input path="users" type="hidden"/>
						<table>
							<tr>
								<td><form:label class="col-sm-12 mt-3" path="name">Nombre:</form:label></td>
								<td><form:input class="form-control col-sm-11 ml-3" type="text" path="name"/></td>
								<td><form:errors path="name"/></td>
							</tr>
							<tr>
								<td><form:label class="col-sm-12 mt-3" path="instructor">Instructor:</form:label></td>
								<td><form:input class="form-control col-sm-11 ml-3" type="text" path="instructor"/></td>
								<td><form:errors path="instructor"/></td>
							</tr>
							<tr>
								<td><form:label class="col-sm-12 mt-3" path="capacity">Capacidad:</form:label></td>
								<td><form:input class="form-control col-sm-11 ml-3" path="capacity"/></td>
								<td><form:errors path="capacity"/></td>
							</tr>
						</table>
						<input class="btn btn-outline-success mt-3 ml-3" type="submit" value="Actualizar"/>
					</form:form>
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