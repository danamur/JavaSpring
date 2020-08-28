<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
	<div class="row m-0 justify-content-center vh-100 mt-5">
		<div class="col-sm-4">
			<div class="card">
				<div class="card-header text-center text-light bg-dark">
					<h1>Registro</h1>
				</div>
				<div class="card-body">
					<p><form:errors path="user.*"/></p>
    
					<form:form method="POST" action="/registration" modelAttribute="user">
						<p>
			            	<form:label class="col-sm-10" path="email">Email:</form:label>
			            	<form:input class="form-control col-sm-11 ml-3" type="email" path="email" required="required"/>
			        	</p>
			        	<p>
			            	<form:label class="col-sm-10" path="password">Password:</form:label>
			            	<form:password class="form-control col-sm-11 ml-3" path="password" required="required"/>
			        	</p>
			        	<p>
			            	<form:label class="col-sm-10" path="passwordConfirmation">Password Confirmation:</form:label>
			            	<form:password class="form-control col-sm-11 ml-3" path="passwordConfirmation" required="required"/>
						</p>
				        	<input class="btn btn-outline-success ml-3 mt-3" type="submit" value="Registrar!"/>
				    </form:form>
				</div>
			</div>
		</div>
	</div>
    

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>