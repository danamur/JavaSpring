<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${course.name} con ${course.instructor}</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
	<div class="row justify-content-center mt-5">
		<div class="col-sm-5">
			<div class="card">
				<div class="card-header text-light bg-dark text-center">
					<h2>
						<c:out value="${course.name}"/>
					</h2>
				</div>
				<div class="card-body">
					<div>
						<h3>
							Instructor: <c:out value="${course.instructor}"/>
						</h3>
						<h3>Resgistrarse: ${course.getUsers().size()}</h3>
					</div>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<td>Nombre Estudiante</td>
								<td>Fecha de resgistrado</td>
								<td>Acción</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${course.getUsers()}" var="user">
								<tr>
									<td>${user.name}</td>
									<td><fmt:formatDate value="${user.createdAt}" pattern="dd/MM/yyyy HH:mm a"/></td>
									<c:choose>
										<c:when test="${user.getId() == currentUser.getId()}">
											<c:choose>
												<c:when test="${course.getUsers().indexOf(currentUser)!= -1}">
													<td><a href="/courses/remove/${course.id}">Remover</a></td>
												</c:when>
												<c:otherwise>
													<td><a href="/courses/${course.id}/add">Agregar</a></td>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="text-center">
						<a href="/courses/edit/${course.id}" class="btn btn-outline-success">Editar Curso</a> 
						<a href="/courses/delete/${course.id}" class="btn btn-outline-danger">Eliminar Curso</a>
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