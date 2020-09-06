<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

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
						<form:form method="post" action="/register" modelAttribute="userObj">
							<h4>
								<form:label class="col-sm-10" path="firstName">Nombres:</form:label>
								<form:input class="form-control col-sm-11 ml-3" type="text" path="firstName"/>

								<form:label class="col-sm-10 mt-3" path="lastName">Apellidos:</form:label>
								<form:input class="form-control col-sm-11 ml-3" type="text" path="lastName"/>

								<form:label class="col-sm-10 mt-3" path="email">Email:</form:label>
								<form:input class="form-control col-sm-11 ml-3" type="email" path="email"/>
							</h4>
							
							<div class="row">
								<div class="col-sm-12 mt-3">
									<h4>
										<form:label class="col-sm-10" path="city">Locación:</form:label>
									</h4>
								</div>
								
								<div class="col-sm-7">
									<h4>
										<form:select class="form-control col-sm-11 ml-3" path="state">
											<c:forEach items="${states}" var="state">
												<form:option value="${state}"><c:out value="${state}"/></form:option>
											</c:forEach>
										</form:select>
									</h4>
								</div>
								<div class="col-sm-5">
									<h4>
										<form:input class="form-control col-sm-11" type="text" path="city"/>
									</h4>	
								</div>
							</div>

							<h4>
								<form:label class="col-sm-10 mt-3" path="password">Contraseña:</form:label>
								<form:password class="form-control col-sm-11 ml-3" path="password"/>
							</h4>
							<h4>
								<form:label class="col-sm-10 mt-3" path="confirmPassword">Confirmar Contraseña:</form:label>
								<form:password class="form-control col-sm-11 ml-3" path="confirmPassword"/>
							</h4>
							<input class="btn btn-outline-success ml-3 mt-3" type="submit" value="Registrar"/>
						</form:form>
						<form:errors class="text-danger" path="userObj.*"/>						
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
						<form action="/login" method="post">
							<h4>Email:<input class="form-control col-sm-11 mt-3" type="email" name="email"></h4>
							<h4>Contraseña:<input class="form-control col-sm-11 mt-3" type="password" name="password"></h4>
							<input class="btn btn-outline-success mt-3" type="submit" value="Ingresar">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>