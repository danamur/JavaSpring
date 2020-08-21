<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nueva Categoria</title>
	
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
					<h1>Nuevo Producto</h1>
				</div>
				<div class="card-body">
					<form:form action="/addproduct" method="post" modelAttribute="productObject">
					    <h2>
					    	<!-- Nombre Producto -->
					        <form:label class="mt-2 col-sm-12" path="name">Nombre Producto</form:label>
					        <form:input class="form-control mt-2 col-sm-10 ml-3" path="name"/>

							<!-- Descripcion Producto -->
					        <form:label class="mt-2 col-sm-12" path="description">Description:</form:label>
					        <form:input class="form-control mt-2 col-sm-10 ml-3" path="description"/>
					        
					        <!-- Precio Producto -->
					        <form:label class="mt-2 col-sm-12" path="price">Price:</form:label>
					        <form:input class="form-control mt-2 col-sm-10 ml-3" path="price"/>
					    </h2>
					    <input class="btn btn-outline-success ml-3 mt-2" type="submit" value="Crear"/>	 
					</form:form>					
				</div>
			</div>
		</div>
		<div>
		<form:errors path="productObject.*"/>
		</div>
	</div>


	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>