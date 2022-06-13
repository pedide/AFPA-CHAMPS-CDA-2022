<%@page import="java.sql.*"%>
<%@page import="com.ab_motors.connection.dbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<meta charset="UTF-8">

<title>Liste des produits et modifications</title>

<%@ include file="/admin/adminHeader.jsp"%>
</head>
<body>
	<div class="container">
		<br>
		<br>
		<h4>
			<div class="card-header my-3 lineaire-simple" align="center">Liste des produits et modifications</div>
		</h4>
		<% String msg = request.getParameter("msg");
    if("done".equals(msg)){
    %>
		<h3 class="alert">Le produit a bien été modifié</h3>
		<%
    }
    if("wrong".equals(msg)){
    %>
		<h3 class="alert">Quelque chose s'est mal passé! Reessayer</h3>
		<%
    }
    %>

		<table>
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Nom</th>
					<th scope="col">Categorie</th>
					<th scope="col">Prix</th>
					<th scope="col">Image</th>
					<th scope="col">Active</th>
					<th scope="col">Modifier<i class="fas fa-pen-fancy"></i></th>
				</tr>
			</thead>
			<tbody>
				<%
      try{
    	  Connection con = dbCon.getConnection();
    	  Statement st = con.createStatement();
    	  ResultSet rs = st.executeQuery("select * from products");
    	     while(rs.next()){
      %>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><i class="fas fa-euro-sign"></i><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><a href="editproducts.jsp?idproducts=<%=rs.getString(1)%>">Modifier<i
							class="fas fa-pen-fancy"></i></a></td>
				</tr>
				<%}
      }catch(Exception e){
    	  System.out.println(e);
      }
    	     %>
			</tbody>
		</table>
		<br><br>
	</div>
	<div class="container">
	<h4>
			<div class="card-header my-3 lineaire-simple" align="center">Liste des voitures en ventes</div>
		</h4>
		<% String msg1 = request.getParameter("msg");
    if("done".equals(msg1)){
    %>
		<h3 class="alert">Le produit a bien été modifié</h3>
		<%
    }
    if("wrong".equals(msg1)){
    %>
		<h3 class="alert">Quelque chose s'est mal passé! Reessayer</h3>
		<%
    }
    %>

		<table>
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Modele</th>
					<th scope="col">Categorie</th>
					<th scope="col">Prix</th>
					<th scope="col">Image</th>
					<th scope="col">Kilométrage</th>
					<th scope="col">Modifier<i class="fas fa-pen-fancy"></i></th>
				</tr>
			</thead>
			<tbody>
				<%
      try{
    	  Connection con = dbCon.getConnection();
    	  Statement st = con.createStatement();
    	  ResultSet rs = st.executeQuery("select * from vehicule");
    	     while(rs.next()){
      %>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><i class="fas fa-euro-sign"></i><%=rs.getString(5)%></td>
					<td><%=rs.getString(11)%></td>
					<td><%=rs.getString(7)%></td>
					<td><a href="editvehicule.jsp?idvehicule=<%=rs.getString(1)%>">Modifier<i
							class="fas fa-pen-fancy"></i></a></td>
				</tr>
				<%}
      }catch(Exception e){
    	  System.out.println(e);
      }
    	     %>
			</tbody>
		</table>
		<br><br>
	</div>
		</div>
</body>
</html>