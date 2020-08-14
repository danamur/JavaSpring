<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light">
		<a class="navbar-brand ml-5" href="/dashboard">BuscaLookify</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  		</button>
  		
  		<div class="collapse navbar-collapse">
  			<ul class="navbar-nav mr-auto">
  				<li class="nav-item">
  					<a class="nav-link" href="/songs/new">Nueva Cancion</a>
  				</li>
  				<li>
  					<a class="nav-link" href="/search/topten">Top Canciones</a>
  				</li>
  			</ul>
  			<form class="form-inline mr-5 my-2 my-lg-0" action="/search" method="post">
  				<input class="form-control mr-sm-2" type="search" name="artist" placeholder="Artista">
  				<input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Buscar Artista">
  			</form>
  		</div>
	</nav>
	
	<div class="row m-0 justify-content-center mt-5 vh-100">
		<div class="col-sm-10">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">Rating</th>
						<th scope="col">Titulo</th>
						<th scope="col">acciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${songs}" var="lookify">
					<tr>
						<td><c:out value="${lookify.rating}"/></td>
						<td><a href="songs/<c:out value="${lookify.id}"/>"><c:out value="${lookify.title}"/></a></td>
						<td><a href="/delete/<c:out value="${lookify.id}"/>">Eliminar</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
	</div>

		
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>