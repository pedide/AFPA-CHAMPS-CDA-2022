<%@page import="com.pokepok.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<meta charset="UTF-8">
<title>Edition Produit</title>
<style>
.back {
	color: white;
	margin-left: 2.5%;
}
</style>
<%@include file="/includes/head.jsp"%>
</head>

<body>

	<%@include file="/admin/admin-header.jsp"%>
	<h2>
		<a class="back" href="allProductEditProduct.jsp"><i
			class="fas fa-arrow-circle-left"> Retour</i></a>
	</h2>

	<%
	String id = request.getParameter("id");
	try {
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from produits where IDPRODUIT='" + id + "'");
		while (rs.next()) {
	%>

	<form action="../edit-product" method="post">
		<input type="hidden" name="id" value="<%out.println(id);%>">
		<div class="left-div">
			<h3>Entrer Nom</h3>
			<input class="input-style" type="text" name="name"
				value="<%=rs.getString(3)%>" required>
			<hr>
		</div>

		<div class="left-div">
			<h3>Entrer Catégorie</h3>
			<input class="input-style" type="text" name="category"
				value="<%=rs.getString(2)%>" required>
			<hr>
		</div>

		<div class="left-div">
			<h3>Entrer Prix</h3>
			<input class="input-style" type="text" name="price"
				value="<%=rs.getString(5)%>" required>

			<hr>
		</div>

		<div class="left-div">
			<h3>Entrer Image</h3>
			<input class="input-style" type="text" name="image"
				value="<%=rs.getString(6)%>" required>

			<hr>
		</div>

		<div class="left-div">
			<h3>Actif</h3>
			<select class="input-style" name="active">
				<option value="Yes">Oui</option>
				<option value="No">Non</option>
			</select>
			<hr>
		</div>
		<div>
			<button class="button">Enregistrer<i class="far fa-arrow-alt-circle-right"></i></button>
		</div>
	</form>

	<%
	}
	} catch (Exception e) {
	System.out.println(e.getMessage());
	}
	%>
</body>
<br>
<br>
<br>
</html>