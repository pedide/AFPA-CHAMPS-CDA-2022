 <%@page import="java.sql.*"%>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

<title>ACCUEIL ADMIN</title>
<Style>
h3 {
	color: green;
	text
}
</Style>
<%-- <%@include file="/includes/navbar.jsp"%> --%>
<%@include file="adminHeader.jsp"%>
</head>
<body>
	<div style="color: white; text-align: center; font-sise: 30px;">
		EDITER PRODUIT<i class="fab fa-elementor"></i>
	</div>
	
	<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
	%>
<h3 class="alert">produit mis à jour avec succès !</h3>
<% }%>
<%

if("wrong".equals(msg)){
	%>

	<h3 class="alert">Quelque chose s'est mal passé ! Réessayer!</h3>
	<% }%>
	
	<table>
		<thead>
			<tr>
				<th scoope="col">ID</th>
				<th scoope="col">Nom</th>
				<th scoope="col"><i class="fas fa-euro-sign"></i>Categorie</th>
				<th scoope="col">Prix</th>
				<th scoope="col">Image</th>
				<th scoope="col">Status</th>
				<th scoope="col">Modifier <i class="fas fa-pen-fancy"></i></th>
			</tr>
		</thead>
		<tbody>
		<%
		try{
			Connection con = DBCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from products");
			while(rs.next()){ 
		
		
		%>
		
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%><i class="fas fa-euro-sign"></i></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Modifier <i class="fas fa-pen-fancy"></i></a></td>
				
			</tr>
			<%}
			}catch(Exception e){
				System.out.println(e);
			}
			%>
		</tbody>
	</table>
</body>
<%@include file="/includes/footer.jsp"%>
</html>