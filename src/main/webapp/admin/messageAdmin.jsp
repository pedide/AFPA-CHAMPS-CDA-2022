
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
<title>Message Admin</title>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<style type="text/css">

.titre{
text-align : center;
margin-top : 20px;
font-size : 100px;
font-weight: bold;
}
.scope{
width:20px;
}
</style>
<%@include file="/includes/head.jsp"%>
</head>
<body>
	<%@include file="/admin/admin-header.jsp"%>
	
<div style = "color:black; text-align:center; font-size:30px;"> Messages<i class ="fab fa-elementor"></i>	
</div>
<%
String msg = request.getParameter("msg");
String non = "non";
if("done".equals(msg)){ %>
	<h3 class="alert">Message Envoyé</h3>
	
<%}
if("wrong".equals(msg)){%>
	<h3 class="alert">Erreur, essayer de nouveau</h3>
<%}%>


<table>
	<thead>
		<tr>
			<th scope = "col">DATE</th>
			<th scope = "col">NOM CLIENT</th>
			<th scope = "col">EMAIL </th>
			<th scope = "col">MESSAGE</th>
			<th scope = "col">REPONDRE</th>
		</tr>
	</thead>
	<tbody>
	<%
	try{
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from messages where idClient is not null");
		while(rs.next()){
	%>
		<tr>
			<td> <%=rs.getString(6)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(7)%> </td>
			<%if(rs.getString(8).equalsIgnoreCase(non)){ %>
				<td><a href = "repondre.jsp?id=<%=rs.getString(1)%>&mail=<%=rs.getString(5)%>">Répondre <i class="fas fa-pen-fancy"></i></td>
			<%}else{ %>
				<td>Déja répondu</td>
			<%} %>
		</tr>
		<%}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	%>
		
	</tbody>
	</table>
</body>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
</html>