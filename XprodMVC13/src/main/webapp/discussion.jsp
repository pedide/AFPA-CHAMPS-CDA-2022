<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.dao.*"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="../css/home-style.css">
<meta charset="UTF-8">
<title>Discussion</title>
<%@include file="includes/head.jsp"%>
<style>
.back {
	color: #FFFAF0;
	margin-left: 2.5%;
}
button[type=submit]
{
    display: block;
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
h6 {
	text-align: center;
}
</style>
<body>
	<%@include file="includes/navbar.jsp"%>
	<h2>
		<a class="back" href="index.jsp" style="color:#FF9999">
			<i class="fas fa-arrow-circle-left" style="color:#FF9999"></i>Retour</a>
	</h2>
	<%
	User auth = (User)request.getSession().getAttribute("auth"); 
	if(auth != null){
		request.setAttribute("auth", auth);
	}
	String email = (String) request.getSession().getAttribute("email");

	try{
		Connection con = DbCon.getConnection();//creer la connexion
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from messagesuser where email='"+email+"'"); 

		while (rs.next()) {
	%>
	<form action="edit-message" method="post">
	<br>
		<input type="hidden" name="id" value="<%rs.getString(1);%>">
		
		<div class="left-div">
			<h6 style="color:#94282D">Date du message</h6>
			<input class="input-style" type="text" name="date"
				value="<%=rs.getString(7)%>" DISABLED>
			<hr>
		</div>
		<div class="right-div">
			<h6 style="color:#94282D">Nom du client</h6> 
			<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" DISABLED>
			<hr>
		</div>
		<div class="left-div">
			<h6 style="color:#94282D">Email du client</h6>
			<input class="input-style" type="email" name="email"
				value="<%=rs.getString(4)%>" DISABLED>
			<hr>
		</div>
		<div class="right-div">
			<h6 style="color:#94282D">Objet du message</h6>
			<input class="input-style" type="text" name="objetMessage"
				value="<%=rs.getString(5)%>" DISABLED>
			<hr>
		</div>
		<div class="right-div">
			<h6 style="color:#94282D">Message</h6>
			<input class="input-style" type="text" name="message"
				value="<%=rs.getString(6)%>" DISABLED>
			<hr>
		</div>
	 </form>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 
	 	<%
		}
	} catch (Exception e) {
		System.out.println(e);
	}%>
</body>
<br>
<br>
<footer>
	<%@ include file="/includes/footer.jsp"%>
</footer>
</html>