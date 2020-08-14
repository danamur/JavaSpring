<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Juego Ninja Gold</title>
	
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

</head>
<body>
	<div class="container mt-3">

		<!-- Contador de Oro -->
		
		<div class="row">
			<div class="col-sm-2">
				<h3>Tu Oro:</h3>
			</div>
			<div class="col-sm-1 border">
				<h3 class="text-right"><c:out value="${gold}"/></h3>			
			</div>
		</div>
		
		<!-- Card de juegos -->
		
		<form action="getGold" method="post" class="container text-center h-100 justify-content-center align-items-center mt-3">
			<div class = "card-group">
			
				<div class="card col-sm-4 mr-3 border border-secondary rounded">
					<div class="card-body">
						<h5 class="card-title">Granja</h5>
						<p class=card-text>(gana 10-20 de oro)</p>
						<button type="submit" class="btn btn-outline-warning mt-4" name="button" value="farm"> Conseguir Oro</button>
					</div>
				</div>
			
				<div class="card col-sm-4 mr-3 border border-secondary rounded">
					<div class="card-body">
						<h5 class="card-title">Cueva</h5>
						<p class=card-text>(gana 5-10 de oro)</p>
						<button type="submit" class="btn btn-outline-warning mt-4" name="button" value="cave"> Conseguir Oro</button>
					</div>
				</div>
			
				<div class="card col-sm-4 mr-3 border border-secondary rounded">
					<div class="card-body">
						<h5 class="card-title">Casa</h5>
						<p class=card-text>(gana 2-5 de oro)</p>
						<button type="submit" class="btn btn-outline-warning mt-4" name="button" value="house"> Conseguir Oro</button>
					</div>
				</div>
			
				<div class="card col-sm-4 border border-secondary rounded">
					<div class="card-body">
						<h5 class="card-title">Apostar</h5>
						<p class=card-text>(gana/pierde 0-50 de oro)</p>
						<button type="submit" class="btn btn-outline-warning mt-4" name="button" value="casino"> Apostar Oro</button>						
					</div>
				</div>
			</div>
		</form>			
	</div>
	
	<div class="row h-100 justify-content-center align-items-center mt-3">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="exampleFormControlTextarea1">Registro de actividades</label>
   					<textarea disabled class="form-control" id="exampleFormControlTextarea1" rows="5">
   						<c:forEach items = "${logList}" var = "event">
							<c:out value="${event}"/>
						</c:forEach>
   					</textarea>
			</div>		
		</div>
	</div>
	
	<div class="row h-100 justify-content-center align-items-center mt-3">
	 	<a href="/reset" class="startover"><button type="button" class="btn btn-outline-danger">Comenzar de nuevo</button></a>	
	</div>

	
	
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>