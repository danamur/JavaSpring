<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>

	<div class="row justify-content-center">
	
<!--========================================== FORMULARIO DE REGISTRO ========================================== -->
		<div class="col-sm-5 mt-5">
			<div>
				<div class="card">
					<div class="card-header text-center text-light bg-dark">
						<h1>
							Registrate
						</h1>
					</div>
					<div class="card-body">
				    	<p><form:errors path="user.*"/></p>
					    <form:form method="POST" action="/registration" modelAttribute="user">
					        <p>
					            <form:label path="name">Nombre:</form:label>
					            <form:input type="text" path="name" class="form-control" />
					        </p>
					        <p>
					            <form:label path="email">Email:</form:label>
					            <form:input type="email" path="email" class="form-control" />
					        </p>
					        <p>
					            <form:label path="password">Contraseña:</form:label>
					            <form:password path="password" class="form-control"/>
					        </p>
					        <p>
					            <form:label path="passwordConfirmation">Confirmar contraseña:</form:label>
					            <form:password path="passwordConfirmation" class="form-control"/>
					        </p>
					        <button type="submit" class="btn btn-outline-success">Registrar</button>
					    </form:form>						
					</div>
				</div>
			</div>
		</div>

<!--========================================== FORMULARIO DE INICIO DE SESIÓN ========================================== -->
		<div class="col-sm-5 mt-5 ml-5">
			<div>
				<div class="card">
					<div class="card-header text-center text-light bg-dark">
						<h1>
							Iniciar Sesión
						</h1>
					</div>
					<div class="card-body">
					    <p><c:out value="${error}" /></p>
					    <form method="post" action="/login">
					        <p>
					            <label for="email">Email</label>
					            <input type="email" id="email" name="email" class="form-control"/>
					        </p>
					        <p>
					            <label for="password">Contraseña</label>
					            <input type="password" id="password" name="password" class="form-control"/>
					        </p>
					        <button type="submit" class="btn btn-outline-success">Log in</button>
					    </form>
					</div>
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