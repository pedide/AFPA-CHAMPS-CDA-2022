<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<!-- <link rel="styleSheet" href="../css/addNewProduct-style.css"> -->
<link rel="styleSheet" href="../css/home-style.css">
<title>Add New Product</title>

<%@include file="/includes/head.jsp"%>

<body>
<%@ include file="adminNavbar.jsp"%>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Le produit a été ajouté avec succès !</h3>
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
		ResultSet rs = st.executeQuery("select max(idProduit) from produits"); //Resultset est une table de resultat

		while (rs.next()) {
			id = rs.getInt(1);
			id = id + 1;
		}

	} catch (Exception e) {
		e.getStackTrace();
		System.out.println(e.getMessage());
	}
	%>
	<form action="../add-new-product" method="post">

		<h3 style="color:#000">
			Nouvelle ID Produit :
			<%
		out.println(id);
		%>
		</h3>
		<input type="hidden" name="id" value="<%out.println(id);%>">
		<div class="left-div">
			<h3 style="color:#000">Référence commérciale</h3>
			<input class="input-style" type="text" name="ref"
				placeholder=".........." required>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#000">Nom du produit</h3>
			<input class="input-style" type="text" name="name"
				placeholder=".........." required>
			<hr>
		</div>
		<div class="left-div">
			<h3 style="color:#000">Descriptif du produit</h3>
			<input class="input-style" type="text" name="category"
				placeholder=".........." required>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#000">Prix du produit</h3>
			<input class="input-style" type="number" step="0.1" min="0" max="1000" value="0.00" name="price"
				placeholder=".........." required>
			<hr>
		</div>
		<div class="left-div">
			<h3 style="color:#000">Photo du produit</h3>
			<input class="input-style" type="text" name="image"
				placeholder=".........." required>
			<hr>
		</div>
		<div class="right-div">
			<h3 style="color:#000">Produit Active ?</h3>
			<select class="input-style" name="active">
				<option value="Yes">Oui</option>
				<option value="Non">Non</option>
			</select>
			<hr>
		</div>
		<br>
		<br>
		<br>
		<center><button class="btn btn" type="submit" style="background-color:#FF9999">Enregistrer 
			<i class="far fa-arrow-alt-circle-right"></i>
		</button></center>
	</form>
</body>
<footer>
	<%@ include file="adminFooter.jsp"%>
</footer>
</html>