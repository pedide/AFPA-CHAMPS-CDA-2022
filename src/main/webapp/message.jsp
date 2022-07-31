<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pokepok.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.pokepok.model.User"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth == null) {
	response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enregistrement</title>
<link rel="stylesheet" href="css/signup-style.css">
<%@include file="includes/head.jsp"%>
<style type="text/css">
.container{
max-width :95% !important;
}
.block1{
background-color: #ffffffc4;
float:left;
border : solid 1px;
padding : 10px;
margin:0.5%;
width : 49%;
}
.card-header{
background-color: #ffffffc4;
margin:5px;
}
h5{
color:red !important;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	
	<div id="block1">
		<div class="whysign w-100 text-center">
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Message Envoyé</h1>

			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Ouups, une erreur s'est produite ! Try again</h1>
			<%
			}
			%>


			
		</div>
	</div>	
		<div class="container">
	
						
			<div class="card-header text-center">Message Us <i class='fas fa-comment-alt'></i></div>
			
				<% try{
					String mail = auth.getEmail();
					Connection con = DbCon.getConnection();
					Statement st = con.createStatement();
					 ResultSet rs2 = st.executeQuery("select * from user inner join messages on user.EMAIL COLLATE utf8mb4_unicode_ci = messages.emailClient where emailClient = '"+mail+"' order by date asc");
					 
					 /*ResultSet rs2 = st.executeQuery("select * from messageClient2 where emailClient = '"+mail+"' order by date asc");
					*/if(rs2 != null){
						
						%><div class="block1">
							<h3>Précédent messages :</h3>
							
							<%while (rs2.next()) {
								if(rs2.getString(16)!=null){
								%>
									
									<p><%=rs2.getString(19)%></p>
									<h5>Vous</h5>
									<p><%=rs2.getString(20)%></p><br>
								<%}else if(rs2.getString(15)!= null){ %>	
									<p><%=rs2.getString(19)%></p>
									<h5>Admin</h5>
									<p><%=rs2.getString(20)%></p><br>
								<%}
								}%>
						</div>
						<div class="block1">
							<h3>Messages :</h3>
							<div class="card w-100">
							
								<form action="message-us" method="post">
									<input  type = "text" style="height:300px; width: 100%; float:left;" name = "message" placeholder = "Ecrivez votre message" required>	
									<div class="button" style="text-align:center;">
										<button type = "submit" class = "btn btn-send">Envoyé</button>	
									</div>				
									<input type="hidden" name="name" value="<%=rs2.getString(2)%>">
									<input type="hidden" name="email" value="<%=rs2.getString(3)%>">
								</form>	
							
							</div>
						</div>
						<%}else{ %>
						<div class="block1">
							<h3>Messages :</h3>
							<div class="card w-100">
							
								<form action="message-us" method="post">
									<input  type = "text" style="height:300px; width: 100%; float:left;" name = "message" placeholder = "Ecrivez votre message" required>	
									<div class="button" style="text-align:center;">
										<button type = "submit" class = "btn btn-send">Envoyé</button>	
									</div>				
									<input type="hidden" name="name" value="<%=rs2.getString(2)%>">
									<input type="hidden" name="email" value="<%=rs2.getString(3)%>">
								</form>	
							
							</div>
						</div>
						
					<%}
			}catch(Exception e){
				System.out.println(e.getMessage());	
	 		}%>
	</div>
</body>	
<%-- <footer>
<%@include file="includes/footer.jsp"%>
</footer> --%>
</html>