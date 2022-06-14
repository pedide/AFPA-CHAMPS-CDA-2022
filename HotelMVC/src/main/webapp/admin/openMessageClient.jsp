<%@page import="com.hotelmvc.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
User auth = (User) request.getSession().getAttribute("auth");
List<Chat> messages = null;
int id = Integer.parseInt(request.getParameter("id"));
request.setAttribute("id", id);
String idClient = request.getParameter("id");

if (auth != null) {

	MessageDAO messageDAO = new MessageDAO(DbCon.getConnection());
	messages = messageDAO.getMessageUser(id);
	int currentUser = auth.getIduser();
	System.out.println("Message if != null : " + messages);
	System.out.println("current USER ID : " + currentUser);

} else {
	System.out.println("no user");
}
%>
<html>
<head>
<%@include file="adminHeader.jsp"%>
<link rel="stylesheet" href="css/messageUs.css">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

	
	
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message</title>

</head>
<body style="margin-top: 8em">

	<div class="container" style="margin-top: 30px; border: 1px solid black; max-width: 40em; padding: 1.5em">
		<div class="card w-50 mx-auto my-50">
			<div class="card-header text-center">
				<div style="color: blue; text-align: center; font-size: 30px;">
					Chat <i class='fas fa-comment-alt'></i>
				</div>
			</div>

			<div class="card-body">

				<form action="../admin-send-chat-message" method="post">

					<div  style="display: flex; flex-direction: row; justify-content: center; margin-bottom: 20px; ">
						<div id="my_div" style="width: 500px; height: 600px; overflow: auto;">
							<%
							if (messages != null) {

								for (Chat m : messages) {
									int senderId =m.getSenderIdUser();
									int currentUser = auth.getIduser();

									if(currentUser !=senderId){
									
							%>
							<div style="background: white; margin: 10px; border-radius: 10px; border: 1px solid gray; margin-right: 150px; ">
							<%} else {%>
								<div style="background: #98fb98; margin: 10px; border-radius: 10px; border: 1px solid gray; margin-left: 150px; ">
							<%} %>
								<div style="margin: 15px">
						
							
									<div >
									<input style="background: none; border: none" type="text" class="form-control" name="idClient"  value ="<%=m.getSenderIdUser()%>" readonly>
									
									</div>
									<div>
										<%=m.getText()%>

									</div>
						

								</div>

							</div>

							<%
							}
							}
							%>
						</div>
							</div>


					</div>

					<div class="form-group"
						style="height: 50px; display: flex; flex-direction: row; justify-content: center; margin: auto; margin-bottom: 20px">
						<input  type="text" class="form-control" name="message"
							placeholder="Enter your message" style="width: 400px" required>
						<button type="submit" class="btn btn-primary"
							style="margin-left: 10px">Envoyer</button>
						<div class="text-center"></div>
					</div>

				</form>

			</div>
		</div>
	</div>


	<br>
	<br>
	<br>
</body>

</html>