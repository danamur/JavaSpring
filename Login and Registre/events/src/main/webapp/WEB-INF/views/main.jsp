<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Eventos</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
	<div>
		
		<!-- Cabecera -->
		
		<div class="row">
			<div class="col-sm-10 ml-3">
				<h1>Bienvenido <c:out value="${user.firstName} ${user.lastName}"/>!</h1>
				<a href="/logout"><h2>Logout</h2></a>
			</div>			
		</div>
		
<!--==========================================  EVENTOS EN TU REGION ========================================== -->
		<div class="row justify-content-center mt-4">
			<div class="col-sm-11">
				<div class="card">
					<div class="card-header text-light bg-dark text-center">
						<h2>Los eventos que estan en tu ciudad</h2>
					</div>
					<div class="card-body">
						
						<!-- Si no hay eventos en la ciudad arrojara este mensaje (array se encuentra en UserController.dashboard)-->
						<c:if test="${instate.size() == 0}"><h5>Actualmente no hay eventos en tu región...</h5></c:if>
						
						
<!--==========================================  TABLA EVENTO REGIONAL ========================================== -->						
						<!-- Si hay eventos en la Region mostrara la siguiente tabala (array se encuentra en UserController.dashboard) -->
						<c:if test="${instate.size() > 0}">
							<table class="table table-striped table-bordered table-hover">
								<thead>
					  				<tr>
					    				<th scope="col">Nombre</th>
									    <th scope="col">Fecha</th>
									    <th scope="col">Ciudad</th>
									    <th scope="col">Región</th>
									    <th scope="col">Host</th>
									    <th scope="col">Estado</th>
					  				</tr>
								</thead>
								<tbody>
									<c:forEach items="${instate}" var="in">
					  				<tr>
					  					<td><a href="/events/${in.id}"><c:out value="${in.name}"/></a></td>
									    <td><fmt:formatDate pattern ="MMMM dd, yyyy" value ="${in.date}"/></td>
									    <td><c:out value="${in.location}"/></td>
									    <td><c:out value="${in.user.firstName}"/></td>
				                        <c:choose>
				                        <c:when test="${in.user == user}">
				                            <td>*Asistiendo* | <a href="/events/${in.id}/edit">Editar</a> | <a href="events/${in.id}/delete">Eliminar</a></td>
				                        </c:when>
				                        <c:otherwise>
				                            <c:set var="attending" value="${false}"/>
				                            <c:forEach items="${in.getJoinedUsers()}" var="attendee">
				                                <c:if test="${attendee == user}">
				                                    <c:set var="attending" value="${true}"/>
				                                </c:if>
				                            </c:forEach>
				                            <c:choose>
				                                <c:when test="${attending == false}">
				                                    <td><a href="/events/${in.id}/join">Unirse</a></td>
				                                </c:when>
				                                <c:otherwise>
				                                    <td>*Asistiendo* | <a href="events/${in.id}/cancel">Cancelar Asistencia</a></td>
				                                </c:otherwise>
				                            </c:choose>
				                        </c:otherwise>
				                        </c:choose>  
					  				</tr>
					  				</c:forEach>
								</tbody>
							</table>
						</c:if>
<!--==========================================  FIN DE LA TABLA EVENTO REGIONAL ==========================================-->						
						
					</div>
				</div>
			</div>
		</div>
<!--==========================================  FIN DEL EVENTO REGIONAL ==========================================-->		
		

<!--========================================== EVENTOS EN OTRAS REGIONES ==========================================-->		
		<div class="row justify-content-center mt-4">
			<div class="col-sm-11">
				<div class="card">
					<div class="card-header text-light bg-dark text-center">
						<h2>Estos son los eventos en otras Regiones:</h2>
					</div>
					<div class="card-body">
						<table class="table table-striped table-bordered table-hover">
							<thead>
				  				<tr>
				    				<th scope="col">Nombre</th>
								    <th scope="col">Fecha</th>
								    <th scope="col">Ciudad</th>
								    <th scope="col">Región</th>
								    <th scope="col">Host</th>
								    <th scope="col">Estado</th>
				  				</tr>
							</thead>
							<tbody>
								<c:forEach items="${outofstate}" var="out">
				  				<tr>
				  					<td><a href="/events/${out.id}"><c:out value="${out.name}"/></a></td>
								    <td><fmt:formatDate pattern ="MMMM dd, yyyy" value ="${out.date}"/></td>
								    <td><c:out value="${out.location}"/></td>
								    <td><c:out value="${out.state}"/></td>
								    <td><c:out value="${out.user.firstName}"/></td>
									<c:choose>
				                        <c:when test="${out.user == user}">
				                            <td>*Asistiendo* | <a href="/events/${out.id}/edit">Editar</a> | <a href="events/${out.id}/delete">Eliminar</a></td>
				                        </c:when>
				                        <c:otherwise>
				                            <c:set var="attending" value="${false}"/>
				                            <c:forEach items="${out.getJoinedUsers()}" var="goer">
				                                <c:if test="${goer == user}">
				                                    <c:set var="attending" value="${true}"/>
				                                </c:if>
				                            </c:forEach>
				                            <c:choose>
				                                <c:when test="${attending == false}">
				                                    <td><a href="/events/${out.id}/join">Unirse</a></td>
				                                </c:when>
				                                <c:otherwise>
				                                    <td>*Asistiendo* | <a href="events/${out.id}/cancel">Cancel</a></td>
				                                </c:otherwise>
				                            </c:choose>
				                        </c:otherwise>
				                    </c:choose>
				  				</tr>
				  				</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
<!--========================================== FINAL DE LA TABLA EVENTOS OTRAS REGIONES. ==========================================-->		
		
		
<!--========================================== CREADOR DE EVENTOS PARA USUARIOS ========================================== -->		
		<div class="row justify-content-center mt-5">
			<div class="col-sm-5">
				<div class="card">
					<div class="card-header text-light bg-dark text-center">
						<h2>Crear un evento</h2>
					</div>
					<div class="card-body">
						<form:form method="post" action="/addevent" modelAttribute="eventObj">
							<h4>
								<form:label class="col-sm-10" path="name">Nombre:</form:label>
								<form:input class="form-control col-sm-10 ml-3" type="text" path="name"/>

								<form:label class="col-sm-10 mt-2" path="date">Fecha:</form:label>
								<form:input class="form-control col-sm-10 ml-3" type="date" path="date"/>
							</h4>
							
							<div class="row">
								<div class="col-sm-12">
									<h4>
										<form:label class="col-sm-10 mt-2" path="location">Region:</form:label>
									</h4>								
								</div>

								<div class="col-sm-5">
									<h4>
										<form:select class="form-control ml-3" path="state">
											<c:forEach items="${states}" var="state">
												<form:option class="form-control ml-3" value="${state}"><c:out value="${state}"/></form:option>
											</c:forEach>
										</form:select>
									</h4>
								</div>
								<div class="col-sm-7">
									<form:input class="form-control col-sm-9 ml-2" type="text" path="location"/>
								</div>
							</div>
							<form:hidden path="user" value="${user.id}"/>
							<input class="btn btn-outline-success ml-3 mt-2" type="submit" value="Crear Evento"/>
						</form:form>
						<form:errors class="text-danger" path="eventObj.*"/>
					</div>
				</div>
			</div>
		</div>
<!--========================================== FINAL DE CREACION DE EVENTO USUARIOS. ==========================================-->		
		
	</div>
	

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>