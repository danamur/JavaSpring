<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Crear Curso</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
	<div class="row justify-content-center mt-5">
		<div class="col-sm-5">
			<div class="card">
				<div class="card-header text-light bg-dark text-center">
					<h2>Crear Curso</h2>
				</div>
				<div class="card-body">
					<form:form method="POST" action="/courses/new" modelAttribute="course">
						<h4>
							<form:label class="col-sm-10" path="name">Nombre</form:label>
							<form:input class="form-control col-sm-10 ml-3" type="text" path="name"/>
							<form:errors path="name"/>
							
							<form:label class="col-sm-10" path="instructor">Instructor</form:label>
							<form:input class="form-control col-sm-10 ml-3" path="instructor"/>
							<form:errors path="instructor"/>
							
							<form:label class="col-sm-10" path="capacity">Capacidad</form:label>
							<form:input class="form-control col-sm-10 ml-3" path="capacity"/>
							<form:errors path="capacity"/>					
						</h4>
						
						<input class="btn btn-outline-success ml-3 mt-2" type="submit" value="Crear Curso"/>
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