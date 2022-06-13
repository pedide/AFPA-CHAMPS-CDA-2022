<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.dao.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- <link rel="styleSheet" href="css/addNewProduct-style.css"> -->
<title>Add New Message</title>

<%@include file="includes/head.jsp"%>

<body>
	<%@include file="includes/navbar.jsp"%>
	
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Votre message a bien été ajouté !</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Il y a une erreur ! Merci d'assayer à nouveau !</h3>
	<%
	}
	%>
	<%
	int id = 1;
	try {
		Connection con = DbCon.getConnection();//creer la connexion
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select max(idMessageUser) from messagesuser"); //Resultset est une table de resultat

		while (rs.next()) {
			id = rs.getInt(1);
			id = id + 1;
		}

	} catch (Exception e) {
		e.getStackTrace();
		System.out.println(e.getMessage());
	}
	%>
	<form action="add-new-message" method="post">
		<br>
		<h3 style="color:#FF9999">Nous Contacter</h3>
		<br>
		<br>
		<input type="hidden" name="id" value="<%out.println(id);%>">

		<div class="left-div">
			<h3>Entrer votre nom</h3>
			<input class="input-style" type="text" name="name"
				placeholder="Merci de saisir votre nom" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Objet de votre message: </h3> 
				<br>
				<select name="objetMessage">
					<option value="Modifier votre commande">Modifier votre commande</option>
					<option value="Annuler votre commande">Annuler votre commande</option>
					<option value="Retourner des articles">Retourner des articles</option>
					<option value="Remboursement des articles">Remboursement des articles</option>
					<option value="Demande d'informations">Demande d'informations</option>
					<option value="Autres">Autres</option>
				</select> 
				<hr>
		</div>
		<div class="left-div">
			<h3>Entrer votre prénom</h3>
			<input class="input-style" type="text" name="prenom"
				placeholder="Entrer votre prénom" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Entrer votre message :</h3>
			<textarea name="message" rows="5" cols="33"></textarea>
		</div>
		<div class="left-div">
			<h3>Entrer votre email</h3>
			<input class="input-style" type="email" name="email"
				placeholder="Entrer votre email" required>
			<hr>
		</div>
		<br>
		<br>
		<br>
		<button class="btn btn" type="submit" style="background-color:#FF9999 ; display: block; position: relative; margin-left: auto;margin-right: auto">Envoyer votre Message
			<i class="far fa-arrow-alt-circle-right" ></i>
		</button>
	</form>
</body>
<br>
<br>
<footer>
	<%@ include file="/includes/footer.jsp"%>
</footer>
</html>