<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<meta charset="UTF-8">
<title>Edit and new Message Admin</title>
<style>
.back {
	color: #FFFAF0;
	margin-left: 2.5%;
}
button[type=submit]
{
    display: block;
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
</style>
<%@include file="/includes/head.jsp"%>

</head>
<body>
<%@ include file="adminNavbar.jsp"%>
	<h2>
		<a class="back" href="adminHome.jsp" style="color:#FF9999">
			<i class="fas fa-arrow-circle-left" style="color:#FF9999"></i>Retour</a>
	</h2>
	<%
	String id = request.getParameter("id");
	try{
		Connection con = DbCon.getConnection();//creer la connexion
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from messagesuser where idMessageUser='"+id+"'"); 

		while (rs.next()) {
	%>
	<form action="../edit-message" method="post">
		<input type="hidden" name="id" value="<%out.println(id);%>">
		
		<div class="left-div">
			<h3 style="color:#94282D">Date du message</h3>
			<input class="input-style" type="text" name="date"
				value="<%=rs.getString(7)%>" DISABLED>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#94282D">Nom du client</h3> 
			<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" DISABLED>
			<hr>
		</div>
		<div class="left-div">
			<h3 style="color:#94282D">Email du client</h3>
			<input class="input-style" type="email" name="email"
				value="<%=rs.getString(4)%>" DISABLED>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#94282D">Objet du message</h3>
			<input class="input-style" type="text" name="objetMessage"
				value="<%=rs.getString(5)%>" DISABLED>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#94282D">Message</h3>
			<input class="input-style" type="text" name="message"
				value="<%=rs.getString(6)%>" DISABLED>
			<hr>
		</div>
	 </form>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	<%
		}
	} catch (Exception e) {
		System.out.println(e);
	}%>
	
	
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
	int id2 = 1;
	try {
		Connection con = DbCon.getConnection();//creer la connexion
		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery("select max(idMessageUser) from messagesuser"); //Resultset est une table de resultat

		while (rs2.next()) {
			id2 = rs2.getInt(1);
			id2 = id2 + 1;
		}

	} catch (Exception e) {
		e.getStackTrace();
		System.out.println(e.getMessage());
	}
	%>
	<form action="../add-new-message" method="post">
		<br>
		<h3 style="color:#000">Répondre au client</h3>
		<br>
		<br>
		<input type="hidden" name="id" value="<%out.println(id);%>">

		<div class="left-div">
			<h3 style="color:#000">Entrez votre nom :</h3>
			<input class="input-style" type="text" name="name"
				placeholder="Merci de saisir votre nom" required>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#000">Objet de votre message:</h3> 
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
			<h3 style="color:#000">Entrez votre email :</h3>
			<input class="input-style" type="email" name="email"
				placeholder="Entrer votre email" required>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#000">Entrez votre message :</h3>
			<textarea name="message" rows="5" cols="33"></textarea>
		</div>
		<br>
		<br>
		<br>
		<br>
		<button class="btn btn" type="submit" style="background:#FF9999">Envoyez votre Message
			<i class="far fa-arrow-alt-circle-right" ></i>
		</button>
	</form>
	
</body>
<footer>
<%@ include file="adminFooter.jsp"%> 
</footer> 
</html>