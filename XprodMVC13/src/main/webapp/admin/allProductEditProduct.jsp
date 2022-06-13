<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

<meta charset="UTF-8"/>
<title>Admin Home</title>
<style>
h3 {
	color: pink;
	text-align: center;
}
</style>

<%@ include file="adminNavbar.jsp"%>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		Tous les produits et édition des produits <i class="fab fa-elementor"></i>
	</div>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Le produit a été mise à jour correctement.</h3>
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
	<table>
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Référence</th>
				<th scope="col">Nom</th>
				<th scope="col">Descriptif</th>
				<th scope="col">Prix<i class="fas fa-euro-sign"></i></th>
				<th scope="col">Image</th>
				<th scope="col">Actif</th>
				<th scope="col">Edition<i class="fas fa-pen-fancy"></i></th>
				<th scope="col">Supprimer<i class="fas fa-trash"></i></th>
			</tr>
		</thead>
		<tbody>
			<%
			try {
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from produits");

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%> <i class="fas fa-euro-sign"></i></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><a style="color:#94282D"href="editProduct.jsp?id=<%=rs.getString(1)%>">Edition<i class="fas fa-pen-fancy" style="color:#94282D; margin-left: 2%"></i></a></td>
				<td><a style="color:#94282D"href="../delete-product?id=<%=rs.getString(1)%>">Suppression<i class="fas fa-trash" style="color:#94282D; margin-left: 2%"></i></a></td>
				
			</tr>
			<%
				}

			} catch (Exception e) {
				System.out.println(e);
			}
			%>
		</tbody>
	</table>
</body>
<footer>
	<%@ include file="adminFooter.jsp"%>
</footer>
</html>