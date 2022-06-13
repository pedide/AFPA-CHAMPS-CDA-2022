<%@page import="java.sql.*"%>
<%@page import="com.ab_motors.connection.dbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="../css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<title>Ajouter d'un nouveau produit</title>


<%@include file="../admin/adminHeader.jsp"%>
</head>
<body>
	<br>
	<br>
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
    %>
	<%
    int id = 1;
    try {
        Connection con = dbCon.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select max (id) from products");
        while (rs.next()) {
            id = rs.getInt(1);
            id++;

        }
    } catch (Exception E) {
    }
    %>
	<form action="../add-new-product" method="post">

		<input type="hidden" name="id" value="<%out.println(id);%>">
		<div class="left-div">
			<h3>Entrez nom du produit</h3>
			<input class="input-style" type="text" name="nom"
				placeholder="Entrez votre nome">
			<hr>
		</div>
		<div class="right-div">
			<h3>Entrez la categorie</h3>
			<input class="input-style" type="text" name="categorie"
				placeholder="Entrez la categorie">
			<hr>
		</div>
		<div class="right-div">
			<h3>Entrez le Prix</h3>
			<input class="input-style" type="text" name="prix"
				placeholder="Entrez le prix">
			<hr>
		</div>
		<div class="left-div">
			<h3>Entrez l'image</h3>
			<input class="input-style" type="text" name="image"
				placeholder="Entrez l'image">
			<hr>
		</div>
		<div class="center">
			<h3>Active</h3>

			<select class="input-style" name="active">
				<option value="Yes">Oui</option>
				<option value="No">Non</option>
			</select>

			<hr>
		</div>

		<button type="submit" class="button">
			Save <i class="far fa-arrow-slt-circle-right"></i>
		</button>
	</form>
</body>
<br>
<br>
<br>
<footer>
	<%@include file="/incloudes/footer.jsp"%>
</footer>
</html>