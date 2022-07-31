
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.pokepok.connection.DbCon"%>
<%@ page import="com.pokepok.model.*"%>
<%@ page import="com.pokepok.dao.ProductDao"%>


<!DOCTYPE html>
<html>
<head>
<title>Edit Product Admin</title>
<link rel="stylesheet" href="../css/admin-style.css">
<style type="text/css">

.titre{
text-align : center;
margin-top : 20px;
font-size : 100px;
font-weight: bold;
}

</style>
<%@include file="/includes/head.jsp"%>
</head>
<body>
	<%@include file="/admin/admin-header.jsp"%>
	
<div style = "color:black; text-align:center; font-size:30px;"> Tous les produits & Editer les produits<i class ="fab fa-elementor"></i>	
</div>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){ %>
	<h3 class="alert">Le produit a été mis à jour correctement!</h3>
<%}
if("wrong".equals(msg)){%>
	<h3 class="alert">Erreur, essayer de nouveau</h3>
<%}%>

<table>
	<thead>
		<tr>
			<th scope = "col">ID</th>
			<th scope = "col">NOM</th>
			<th scope = "col">CATEGORIE</th>
			<th scope = "col">PRIX <i class="fas fa-euro-sign fa-pulse fa-spin fa-3x'"></i></th>
			<th scope = "col">IMAGE</th>
			<th scope = "col">STATUT</th>
			<th scope = "col">EDITER <i class="fas fa-pen-fancy"></i></th>
		</tr>
	</thead>
	<tbody>
	<%
	try{
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from produits");
		while(rs.next()){
	%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(5)%> 	<i class="fas fa-euro-sign fa-pulse fa-spin fa-1x"></i></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><a href = "editProduct.jsp?id=<%=rs.getString(1)%>">Editer <i class="fas fa-pen-fancy"></i></a></td>
			
		</tr>
		<%}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	%>
		
	</tbody>
	</table>
</body>
</html>