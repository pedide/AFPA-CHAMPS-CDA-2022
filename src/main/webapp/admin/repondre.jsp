<%@page import="com.pokepok.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="../css/addNewProduct-style.css"> -->
<meta charset="UTF-8">
<title>Répondre Message</title>
<style>
.container{
}
.back {
	color: white;
	margin-left: 2.5%;
}
.btn{
	background-color : aqua;
	margin-top:10px;
}
.btn:hover{
	background-color : mediumaquamarine;
}

.left-div
{
	width: 30%;
	border: black;
	border-style: dotted;
	padding: 10px;
	margin-left:20px;
	margin-top:50px;
}
.block{
	
}
</style>
<%@include file="/includes/head.jsp"%>
</head>

<body>
	<%@include file="/admin/admin-header.jsp"%>
	<h2>
		<a class="back" href="messageAdmin.jsp"><i class="fas fa-arrow-circle-left"> Retour</i></a>
	</h2>


	<%
	String id = request.getParameter("id");
	String mail = request.getParameter("mail");
	
	%>
	
	<div classe="container" style="width:95%; padding-left:3%;">
		<div class="card-header text-center">Message <i class='fas fa-comment-alt'></i></div>
	
		
		<div class="block">
			<div class = "left-div ">
			<%	try {
					Connection con = DbCon.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from user inner join messages on user.EMAIL = messages.emailClient where emailClient = '"+mail+"' order by date asc");
					
				%>
					<h2><label class="lab"><i class='fas fa-comment-alt'></i> Conversation: </label></h2>
				
				<% 		while (rs.next()) {
							if(rs.getString(15)!=null){%>
								<p><%=rs.getString(19)%></p>
								<h5>Admin</h5>
								<p><%=rs.getString(20)%></p><br>
						<% }else if(rs.getString(16)!= null){ %>	
								<p><%=rs.getString(19)%></p>
								<h5><%=rs.getString(2)%></h5>
								<p><%=rs.getString(20)%></p><br>
				<%			}
						}
			%>		<%	} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			%>
			
			</div>	
		</div>
		
		<div class = "block"  style="width:auto;">
			<form action="../reponse-admin" method="post" style="margin:10px;">
				<div class="form-group">
					<h2><label class="lab"><i class='fas fa-comment-alt'></i> Répondre : </label></h2>
					<input  type = "text" style="height:300px; width: 800px; float:left;" name = "messageRep" placeholder = "Ecrivez votre message" required>
				</div>	
				<div>
					<button type = "submit" class = "btn btn-send" style="margin-left:20px;">Envoyé</button>	
				</div>
				<%try{
					Connection con = DbCon.getConnection();
					Statement st = con.createStatement();
					ResultSet rs2 = st.executeQuery("select * from messages where idMessage = '"+id+"'");
					while (rs2.next()) {%>
					<input type="hidden" name="nameRep" value="<%=rs2.getString(4)%>">
					<input type="hidden" name="emailRep" value="<%=rs2.getString(5)%>">
					<input type="hidden" name="idRep" value="<%=rs2.getString(1)%>">
				<%
				}
				}catch(Exception e){
					System.out.println(e.getMessage());
				}%>
			</form>
		</div>
		
	</div>

</body>
<br>
<br>
<br>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
</html>