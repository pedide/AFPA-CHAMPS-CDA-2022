<%@page import="com.hotelmvc.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="com.hotelmvc.connection.DbCon"%>


<%
User auth = (User) request.getSession().getAttribute("auth");
List<Chat> messages = null;

if (auth != null) {

	request.setAttribute("person", auth);
	MessageDAO messageDAO = new MessageDAO(DbCon.getConnection());
	messages = messageDAO.getMessageUser(auth.getIduser());
	int currentUser = auth.getIduser();
	System.out.println("Message if != null : " + messages);
	System.out.println("current USER ID : " + currentUser);

} else {
	System.out.println("no user");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--   chat.css  -->
<link rel="stylesheet" href="css/chat-style.css">
<title>Message Us</title>
<script>
	var myDiv = document.getElementById("my_div");
	myDiv.scrollTop = myDiv.scrollHeight;

	function openForm() {
		document.getElementById("myForm").style.display = "block";
	}

	function closeForm() {
		document.getElementById("myForm").style.display = "none";
	}
</script>

</head>
<body>
	<div class="chat-popup" id="myForm"
		style="position: fixed; bottom: 0; right: 1em">
		<form action="send-message-chat" method="post" class="form-container">

			<label class="title" for="msg"><b>Chat Room VIP</b></label>
			<div class="box-message">
				<%
				if (messages != null) {

					for (Chat m : messages) {
						int senderId = m.getSenderIdUser();
						int currentUser = auth.getIduser();

						if (currentUser != senderId) {
				%>
				<div style="margin: 5px; background: white; margin-right:  4em; padding: 0.5em; border-radius: 0.5em;">
					<%
					} else {
					%>
					<div
						style="margin: 5px; background: #98fb98; margin-left: 4em; padding: 0.5em; border-radius: 0.5em;">
						<%
						}
						%>


						<div>
							<%=m.getText()%>

						</div>
					</div>
					<%
					}
					}
					%>
				</div>
				<textarea placeholder="Tapez votre message.." name=message required></textarea>

				<button type="submit" class="btn">Send</button>
				<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>


</body>

</html>