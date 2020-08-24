<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Question Profile</title>
	    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<div class="row m-0 justify-content-center vh-100 mt-5">
		<div class="col-sm-10">
			<div class="card">
				<div class="card-header text-center text-light bg-dark">
					<h1>${question.question}</h1>					
				</div>
				<div class="card-body">
					<h4>
						<c:forEach items="${question.tags}" var="tag">
							<button class="btn btn-outline-success">${tag.subject}</button>
						</c:forEach>
					</h4>
				</div>
			</div>
		</div>	

	</div>
	
	<div class="row m-0 justify-content-center vh-100 mt-5">
		<div class="col-sm-10">
			<table class="table table-hover table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>Respuestas</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${question.answer}" var="answer">
						<tr>
							<td>${answer.answer}</td>		    
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-10">				
			<form:form action="/questions/${question.id}" method="POST" modelAttribute="addTheAnswer">
				<form:errors path="answer"/>
					<p>
						<form:label class="col-sm-6 mt-5" path="answer">Nueva Respuesta</form:label>
						<form:textarea class="form-control" path="answer"/>
					</p>
					<p class="text-right">
						<button type="submit" class="btn btn-outline-success">Nueva Respuesta</button>
					</p>
			</form:form>
			<a href="/" class="btn btn-primary btn-lg">Inicio</a>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</body>
</html>