<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<%@ include file="/includes/navbar.jsp"%>
<%@ include file="adminHeader.jsp"%>
</head>
<body>
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

		<h3 style="color: green">
			ID de Produit :
			<%
		out.println(id);
		%>
		</h3>
		<input type="hidden" name="id" value="<%out.println(id);%>">
		<div class="left-div">
			<h3>Entrer la référence du produit</h3>
			<input class="input-style" type="text" name="ref"
				placeholder="Merci de saisir la référence du produit" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Entrer le nom</h3>
			<input class="input-style" type="text" name="name"
				placeholder="Merci de saisir le nom" required>
			<hr>
		</div>
		<div class="left-div">
			<h3>Entrer le catégorie</h3>
			<input class="input-style" type="text" name="category"
				placeholder="Merci de saisir le catégorie" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Entrer le prix</h3>
			<input class="input-style" type="number" name="price"
				placeholder="Merci de saisir le prix" required>
			<hr>
		</div>
		<div class="left-div">
			<h3>Ajouter l'image</h3>
			<input class="input-style" type="text" name="image"
				placeholder="Merci d'ajouter l'image" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Status du produit : Active</h3>
			<select class="input-style" name="active">
				<option value="Yes">Oui</option>
				<option value="Non">Non</option>
			</select>
			<hr>
		</div>
		<button class="button" type="submit">
			Enregistrer <i class="far fa-arrow-alt-circle-right"></i>
		</button>
	</form>
</body>
<br>
<br>
<br>
<footer>
	<%@ include file="/includes/footer.jsp"%>
</footer>
</html>