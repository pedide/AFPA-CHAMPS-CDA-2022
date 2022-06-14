<%@page import="com.hotelmvc.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	int id = auth.getIduser();
	System.out.println("id user get parameter"+id);
	
	MessageDAO md = new MessageDAO(DbCon.getConnection());
	List<MessageContact> messages = md.getMessageForADMIN(id);
%>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

	<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />      

<title>Inbox Formulaire Contact</title>
	<%@include file="adminHeader.jsp"%>

</head>
<body style="margin-top: 8em
">
	<table style="text-align: center;">
		<thead>
			<th style="background: white; text-align: center" colspan="5">
				<div class="search-container" colspan="9">
					<form action="searchAdminOrders.jsp" method="post">
						<input type="text" placeholder="search" name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</th>
		</thead>
		<thead style="position: sticky;  text-align: center">
			<tr>
				<th scope="col">Id Message</th>
				<th scope="col">Object</th>
				<th scope="col">Message</th>
				<th scope="col">User ID</th>

				<th scope="col">Read<i class="glyphicon glyphicon-envelope"></i></th>

			</tr>
		</thead>
		<tbody>
			<%
				if (!messages.isEmpty()) {
					for (MessageContact m : messages) {
			%>
			<tr style=" margin-top: 10em">
				<td><%=m.getIdMessage()%></td>
				<td><%=m.getObject()%></td>
				<td style="white-space: nowrap; overflow: hidden;"><%=m.getText()%></td>
				<td><%=m.getSenderIdUser()%></td>




				<td><a href="openMessageClient.jsp?id=<%=m.getSenderIdUser()%>">Read
						<i class="fas fa-pen"></i>
				</a></td>

			</tr>
			<%
			}


			}
			%>
		</tbody>

	</table>

</body>
</html>