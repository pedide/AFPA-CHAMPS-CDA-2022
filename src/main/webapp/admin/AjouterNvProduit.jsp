 	  	 	<%@page import="java.sql.*"%>
<%@page import="com.xprodmvc.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Ajouter d'un nouveau produit</title>
 <%@include file="../admin/adminHeader.jsp"%> 
</head>
 
<body>

	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h2 class="alert">Le Produit a été ajouté</h2>
	<%
	}
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Quelque chose s'est mal passé</h3>
	<%
	}
	int id = 1;
	try {
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT MAX(idProd) FROM produits");
		while (rs.next()) {
			id = rs.getInt(1);
			id++;

		}
		 } catch (Exception e) {
			 e.printStackTrace();
		}
	%>
	<form class="oui" action="../add-new-product" method="post">
		<h3 style="color: green;">
			ID PRODUIT :<%out.println(id);%>
		</h3>
		<input type="hidden" name="id" value="<%out.println(id);%>">
		<div class="left-div">
			<h3>Entrez le nom du nouveau Produit :</h3>
			<input class="input-style" type="text" name="nom"
				placeholder="Entrez le nom du nouveau Produit">
			<hr>
		</div>
		<div class="right-div">
			<h3>Entrez la categorie :</h3>
			<input class="input-style" type="text" name="categorie"
				placeholder="Entrez la categorie">
			<hr>
		</div>
		<div class="left-div">
			<h3>Entrez le Prix :</h3>
			<input class="input-style" type="text" name="prix"
				placeholder="Entrez le prix">
			<hr>
		</div>
		<div class="right-div">
			<h3>Entrez le lien de l'image :</h3>
			<input class="input-style" type="text" name="image"
				placeholder="Entrez le lien de l'image">
			<hr>
		</div>
		<div class="left-div">
			<h3>Active</h3>
			<select class="input-style" name="active">
				<option value="yes">Oui</option>
				<option value="no">Non</option>
			</select>
			<hr>
		</div>
		<button type ="submit" class="button">
			Sauvegarder <i class="far fa-arrow-slt-circle-right"></i>
		</button>
	</form>
</body>
	
<br>
<br>
<br>

</html>