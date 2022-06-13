<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.sql.*"%>
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
<title>Admin Message Users</title>
<style>
h3 {
	color: pink;
	text-align: center;
}
</style>

<%@ include file="adminNavbar.jsp"%>
</head>
<body>
	<br>
	<div style="color: #B39188; text-align: center; font-size: 30px;">
		Tous les messages et édition des messages <i class="fab fa-elementor"></i>
	</div>
	<br>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Le message a été mise à jour correctement.</h3>
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
				<th scope="col">Id Message</th>
				<th scope="col">Nom</th>
				<th scope="col">Email</th>
				<th scope="col">Objet de Message</th>
				<th scope="col">Messages</th>
				<th scope="col">Date</th>
				<th scope="col">Ouvrir <i class="fas fa-pen-fancy"></i></th>
			</tr>
		</thead>
		<tbody>
			<%
			try {
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from messagesuser");

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><a style="color:#94282D" href="editMessage.jsp?id=<%=rs.getString(1)%>">Ouvrir<i class="fas fa-pen-fancy" style="color:#94282D"></i></a></td> 
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