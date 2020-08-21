<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Categorias</title>
	
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Inicio</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" >
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="/new/product">Nuevo Producto</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/new/category">Nuevo Categoria</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/categories/4">Ps4</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/categories/5">Pc</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="row m-0 justify-content-center vh-100 mt-5">
		<div class="col-sm-3">
			<div class="card border-dark">
				<div class="card-header text-center text-light bg-dark">
					<h1><c:out value="${category.name}"/></h1>				
				</div>
			</div>
			<div class="card-body">
				<h2>Productos</h2>
				<c:forEach items="${category.products}" var="prod">
					<h3>-<c:out value="${prod.name}"/></h3>
				</c:forEach>							
			</div>
			<div>
				<form:form action="/addpro" method="post" modelAttribute="categoryProductObj">
				    <h2>
				        <form:label class="mt-2 col-sm-12" path="product">Agregar Productos</form:label>
	   			    	<form:select class="form-control mt-2 col-sm-10 ml-3" path="product">
	   			    		<c:forEach items="${product}" var="prod">
	   			    			<form:option value="${prod.id}"><c:out value="${prod.name}"/></form:option>
			    			</c:forEach>
	 			    	</form:select>
				    </h2>
				    <form:hidden path="category" value="${category.id}" />
				    <input class="btn btn-outline-success ml-3 mt-3" type="submit" value="Agregar"/>	 
				</form:form>
			</div>
		</div>
	</div>	

	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>