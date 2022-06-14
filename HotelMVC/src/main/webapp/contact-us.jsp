<%@page import="com.hotelmvc.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="com.hotelmvc.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
User auth = (User) request.getSession().getAttribute("auth");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<%@include file="includes/navbar.jsp"%>
<link rel="stylesheet" href="css/contact-style.css">
</head>
<body style="margin-top: 8em">

	<div
		style="display: flex; align-items: center; justify-content: center;">

		<div class="container"
			style="display: flex; justify-content: center; text-align: center; vertical-align: middle;">
			<img
				style="display: inline-block; vertical-align: middle; align-items: center;"
				src="images/room_view_eiffel.png"></img>



			<div class="row">
				<div class="text-center mt-5">
					<h1 class="font-germania">Formulaire de contact</h1>
						<div class="font-germania" >
							<%
							String msg = request.getParameter("msg");
							if ("valid".equals(msg)) {
							%>
							<h3 style="color: #7fe04f">Votre message a bien été envoyé. Vous recevrez rapidement une réponse de notre part.</h3>
							<h4>Retournez dans la page <a href='home.jsp'>Home</a> </h4>
							
							<%
							}
							%>
							<%
							if ("invalid".equals(msg)) {
							%>
							<h3 style="color: red">Un problème est survenu. Votre message n'a pas été envoyé. Veuillez réessayé.</h3>
							<%
							}
							%>
					
						</div>
				</div>
				<div class="col-lg-7 mx-auto">
					<div class="card mt-2 mx-auto p-4 bg-light">
						<div class="card-body bg-light">

							<div class="container">
								<form action="contact-form" role="form">



									<div class="controls">

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="form_name" class="subtitle">Prénom *</label> <input
														id="form_name" type="text" name="firstname"
														class="form-control font-germania"
														placeholder="Entrez votre prénom *" required="required"
														data-error="Firstname is required.">

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="form_lastname" class="subtitle">Nom *</label> 
													<input id="form_lastname" type="text" name="lastname" class="form-control font-germania" placeholder="Entrez votre nom *" required="required" data-error="Lastname is required.">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="form_email" class="subtitle">Email *</label> <input id="form_email" type="email" name="email" class="form-control font-germania" placeholder="Entrez votre adresse email *" required="required" data-error="Valid email is required.">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="form_need" class="subtitle">Merci de préciser votre besoin *</label> <select id="form_need" name="object" class="form-control font-germania" required="required" data-error="Please specify your need.">
														<option class="font-germania" value="" selected disabled>--Sélectionnez votre besoin--</option>
														<option>Demander une facture pour votre réservation</option>
														<option>Request order status</option>
														<option>Haven't received cashback yet</option>
														<option>Autres</option>
													</select>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="form_message" class="subtitle">Message *</label>
													<textarea id="form_message" name="message" class="form-control font-germania" placeholder="Ecrivez votre message ici." rows="8" required="required" data-error="Please, leave us a message."></textarea>
												</div>

											</div>


											<div class="col-md-12">

												<input type="submit" class="btn button-message pt-2 btn-block" value="Envoyer le message">

											</div>

										</div>


									</div>
								</form>
							</div>
						</div>


					</div>
					<!-- /.8 -->

				</div>
				<!-- /.row-->

			</div>
		</div>
	</div>




</body>
</html>