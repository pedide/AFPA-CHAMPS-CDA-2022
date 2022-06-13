<%@page import="java.sql.*"%>
<%@page import="com.xprodmvc.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <%@include file="adminHeader.jsp"%> 
<meta charset="UTF-8">
<title>Edit product</title>

</head>
<body>
	<h2>
		<a class="black" href="AllProductEditProduct.jsp"><i
			class="fas fa-arrow-circle-left">Retour</i></a>
	</h2>
	<%
	String id = request.getParameter("id");
	try {
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
				"select idProd,nom,categorie,prix,image,active from produits where idProd='" + id + "'");
		while (rs.next()) {
	%>
	<form action="../edit-product" method="post">
		<input type="hidden" name="id" value="<%out.println(id);%>">
		
		<div class="left-div">
			<h3>ID du produit :</h3>
			<input class="input-style" type="text" name="id"
				value="<%=rs.getString(1)%>" required>
				<hr>
		</div>
		<div class="right-div">
			<h3>Nom du produit :</h3>
			<input class="input-style" type="text" name="nom"
				value="<%=rs.getString(2)%>" required>
				<hr>
		</div>

		<div class="left-div">
			<h3>Catégorie du produit :</h3>
			<input class="input-style" type="text" name="categorie"
				value="<%=rs.getString(3)%>" required>
				<hr>
		</div>

		<div class="right-div">
			<h3>Prix du produit :</h3>
			<input class="input-style" type="text" name="prix"
				value="<%=rs.getString(4)%>" required>
				<hr>
		</div>

		<div class="left-div">
			<h3>Lien de l'image :</h3>
			<input class="input-style" type="text" name="image"
				value="<%=rs.getString(5)%>" required>
				<hr>
		</div>

		<div class="right-div">
			<h3>Active</h3>
			<select class="input-style" name="active">
				<option value="yes">Oui</option>
				<option value="no">Non</option>
			</select>
			<hr>
		</div>
		<button class="button">Sauvegarder</button>
		<i class="far fa-arrox-alt-circle-right"></i>
	</form>
	<%
		}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
	
</body>
<br>
<br>
<br>

</html>