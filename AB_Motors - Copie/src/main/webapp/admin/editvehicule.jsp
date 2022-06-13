<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ab_motors.connection.dbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit product</title>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="../css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<%@include file="../admin/adminHeader.jsp"%>
</head>
<body>
	<h2>
		<a class="back" href="../admin/AllProductEditProduct.jsp"><i
			class="fas fa-arrox-circle-left">Retour</i></a>
	</h2>
	<%
	String id = request.getParameter("idvehicule");
	try {
		Connection con = dbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
		"select idvehicule,modele,categorie,prix,img1,kilometrage from vehicule where idvehicule='" + id + "'");

		while (rs.next()) {
	%>
	<form action="../edit-vehicule" method=post>
		<input type="hidden" name="idvehicule" value="<%=rs.getString(1)%>">
		<div class="left-div">
			<h3>Entrez nom</h3>
			<input class="input-style" type="text" name="modele"
				value="<%=rs.getString(2)%>" required>
			<hr>
		</div>

		<div class="right-div">
			<h3>Entrez categorie</h3>
			<input class="input-style" type="text" name="categorie"
				value="<%=rs.getString(3)%>" required>
			<hr>
		</div>

		<div class="left-div">
			<h3>Entrez prix</h3>
			<input class="input-style" type="text" name="prix"
				value="<%=rs.getString(4)%>" required>
			<hr>
		</div>

		<div class="right-div">
			<h3>Entrez image</h3>
			<input class="input-style" type="text" name="img1"
				value="<%=rs.getString(5)%>" required>
			<hr>
		</div>

		<div class="center">
			<h3>Entrez kilometrage</h3>
			<input class="input-style" type="text" name="kilometrage"
				value="<%=rs.getString(6)%>" required>
			<hr>
			<hr>
		</div>
		<button class="button">Save</button>
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