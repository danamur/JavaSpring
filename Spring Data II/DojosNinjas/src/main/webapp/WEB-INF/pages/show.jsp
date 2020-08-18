<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nuevo Dojo</title>
	
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	
</head>
<body>
	<div class="row m-0 justify-content-center vh-100 mt-5">
		<div class="col-sm-6">
			<div class="card broder-dark">
				<div class="card-header text-center text-light bg-dark">
					<h1><c:out value="${dojo.name}"/> Ninja</h1>
				</div>
				<div class="card-body">
					<table class="col-sm-12 table table-hover mt-3">
						<thead>
							<tr>
								<th scope="col">Nombre</th>
								<th scope="col">Apellido</th>
								<th scope="col">Edad</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dojo.ninjas}" var="ninjas">
							<tr>
								<th><c:out value="${ninjas.firstName}"/></th>
								<th><c:out value="${ninjas.lastName}"/></th>
								<th><c:out value="${ninjas.age}"/></th>
							</tr>
							</c:forEach>
						</tbody>
					</table>
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