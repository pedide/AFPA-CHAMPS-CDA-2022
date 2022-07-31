<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Livraison</title>
<link rel="stylesheet" href="css/signup-style.css">
<%@include file="includes/head.jsp"%>
<style type="text/css">
.btn-insc {
	font-size: 1rem;
	background-color: orange;
	margin-left: 10px;
	color: white;
	border-color: #007bff;
}

.btn-insc:hover {
	background-color: #007bff;
	color: white;
}
</style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
	<div id="container">
		<div class="whysign w-100 text-center">
		<p>
				Veuillez enregistrer votre adresse de livraison pour terminer votre achat
			</p>
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Inscription réussie</h1>

			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Ouups, une erreur s'est produite ! Try again</h1>
			<%
			}
			%>


			
		</div>
		<div class="signup">
			<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center">Adresse de livraison</div>
				<div class="card-body">
					<form action="cart-check-out" method="post">
						<div class="form-group">
							<label>Adresse</label> <input type=text "  class="form-control"
								name="adress" placeholder="Entrer votre adresse" required>
							<label>Ville</label> <input type="text"
								class="form-control" name="city"
								placeholder="Entrer votre ville" required> 
							<label>Code Postal</label> <input type="text" class="form-control" name="cp"
								placeholder="Entrer votre code postal" required>
							<label>Département</label> <input type="text"
								class="form-control" name="state"
								placeholder="Entrer votre département" required> 
							<label>Pays</label> <input type="text" class="form-control" name="country"
								placeholder="Entrer votre pays" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-insc" value="signup">Valider</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</div>
</body>
</html>