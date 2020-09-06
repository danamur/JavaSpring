<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><c:out value="${event.name}"/></title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
	<div class="row justify-content-center mt-5">

<!--========================================== CERRAR SESION ========================================== -->
	<a class="col-sm-12 text-right mr-5" href="/logout"><h2>Logout</h2></a>

<!--========================================== EDITAR INFORMACION DEL EVENTO ========================================== -->	
	<div class="col-sm-7">
		<div class="card">
			<div class="card-header text-center text-light bg-dark">
				<h1><c:out value="${event.name}"/></h1>
			</div>
			<div class="card-body">
				<h3>Editar Evento</h3>
				<form:form method="post" action="/events/${id}/edit" modelAttribute="event">
					<input type="hidden" name="_method" value="put">
					<h4>
						<form:label class="col-sm-12 mt-3" path="name">Nombre:</form:label>
						<form:input class="form-control col-sm-11 ml-3" type="text" path="name"/>

						<form:label class="col-sm-10 mt-3" path="date">Fecha:</form:label>
						<form:input class="form-control col-sm-11 ml-3" type="date" path="date"/>
					</h4>
					
					<div class="row">
						<div class="col-sm-12 mt-3">
							<h4>
								<form:label class="col-sm-10" path="location">Locación:</form:label>							
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
								<form:input class="form-control col-sm-11" type="text" path="location"/>
							</h4>
						</div>
					</div>
					<h4>
						<form:hidden path="user" value="${user.id}"/>
						<input class="btn btn-outline-success ml-3 mt-3" type="submit" value="Editar Evento"/>
					</h4>
				</form:form>
				<form:errors class="text-danger" path="event.*"/>
			</div>
		</div>	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>