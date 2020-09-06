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

<!--========================================== INFORMACION DEL EVENTO ========================================== -->
		<div class="col-sm-8">
			<div class="card">
				<div class="card-header text-center text-light bg-dark">
					<h3><c:out value="${event.name}"/></h3>
				</div>
				<div class="card-body">
					<h1><c:out value="${event.name}"/></h1>
					<div>
						<h3>Host: <c:out value="${event.user.firstName}"/> <c:out value="${event.user.lastName}"/></h3>
						<h3>Fecha: <fmt:formatDate pattern ="MMMM dd, yyyy" value ="${event.date}"/></h3>
						<h3>Locación: <c:out value="${event.location}"/>, <c:out value="${event.state}"/></h3>
						<h3>Cantidad de persona que asistiran al evento: <c:out value="${event.joinedUsers.size()}"/></h3>
						<table class="table table-striped table-bordered table-hover">
							<thead>
				  				<tr>
				    				<th scope="col">Nombre</th>
								    <th scope="col">Locación</th>
				  				</tr>
							</thead>
							<tbody>
			  					<c:forEach items="${attendees}" var="attendee">
					  				<tr>
								    	<td><c:out value="${attendee.firstName}"/> <c:out value="${attendee.lastName}"/></td>
								    	<td><c:out value="${attendee.location}"/></td>
									<tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="mt-5">
						<h2>Muro de mensajes</h2>
						<div>
			                <c:forEach items="${messages}" var="msg">
			                    <p>${msg.user.firstName} says: ${msg.message}</p>
			                    <p>--*--*--*--*--*--*--</p>
			                </c:forEach>
			            </div>
			                <form:form method="post" action="/events/addmsg" modelAttribute="messageObj">
			                	<h5>
			                		<form:textarea class="form-control col-sm-12" type="textarea" path="message"/>
								</h5>
								<form:hidden path="user" value="${user.id}"/>
								<form:hidden path="event" value="${event.id}"/>
						   		<input class="btn btn-outline-success mt-2" type="submit" value="Enviar Mensaje">          
			                </form:form>
			               	<form:errors cssClass="red" path="message.*"/>
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