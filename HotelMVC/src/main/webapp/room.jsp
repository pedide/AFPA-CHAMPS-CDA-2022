<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="com.hotelmvc.model.User"%>
<%@page import="com.hotelmvc.model.Room"%>
<%@page import="com.hotelmvc.model.Favorites"%>
<%@page import="com.hotelmvc.dao.UserDAO"%>
<%@page import="com.hotelmvc.dao.RoomDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
	System.out.println("AUTH INDEX: User ID = [ "+auth.getIduser()+" ], username = [ "+auth.getUsername()+" ] from index.jsp ligne14");
}  
  
RoomDAO rDAO = new RoomDAO(DbCon.getConnection());
List<Room> rooms = rDAO.getAllRooms();



%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet"/> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet"/> -->

		<!-- icon --> 
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	    <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>    
	
		<title>Chambres & Suites</title>
		<%@include file="includes/navbar.jsp"%>
		
		<link rel="stylesheet" href="css/room-style.css">
						<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
	</head>
	<body >		
		<div class="container-fluid" style="width: 80%; margin: auto; ">
			<div class="text-black" style="border: 1px solid #d3d3d3; padding-left : 0.5em" >Les chambres & suites</div>
			<div class="row">
				<%
					if (!rooms.isEmpty()) {
						for (Room r : rooms) {
							int i = r.getRoomName().indexOf(' ');
				%>
				<div class="col-md-6" style="margin-top: 2em; margin: auto; padding: 1em" >
					<div class="containerIMG mt-3"style=" display: block; border: solid 1px #d3d3d3; padding: 1em;">
							<img class="card-img-top" style="max-width: 100%; max-height: 100%; width: 100%"  src="images/<%=r.getRoomImage()%>" alt="Card image cap">
						<div class="card-body" >
							<h3 class="card-title text-black-medium" style="height: 1.5em;"><%=r.getRoomName()%></h3>
							<h4 class="text-black-medium"><%=r.getRoomPrice()%> € /nuit</h4>
							<h4 class="text-black-medium" ><%=r.getRoomTitleDescription()%></h4>							
							<h5 class=" ellipsis text-black-medium" style=""><%=r.getRoomDescription()%></h5>
							
							<div class="mt-5 d-flex justify-content-between" style="text-align: right; margin-top: 1.5em">
							<!-- <div class="mt-3 d-flex justify-content-between" style="display: flex; justify-content: space-between; "> -->
								<a href="add-to-cart?id=<%=r.getRoomId()%>" class="btn button" style="display: inline-block; margin: auto; 	font-size: 1.3em;"><span class="bi bi-calendar3"></span></a> 
								<a href="add-to-favorites?id=<%=r.getRoomId()%>" class="btn button" style="display: inline-block; margin: auto; 	font-size: 1.3em;"><span class="bi bi-star"></span></a> 
								<a href="order-now?quantity=1&id=<%=r.getRoomId()%>" class="btn button-book" style="display: inline-block; margin: auto" >Réservez la  <%=r.getRoomName().toLowerCase()%> <i class="bi bi-arrow-right-circle""></i></a>
							</div>
					</div>
						</div>

				</div>
				<%
				}
				}
				%>
			</div>
		</div>



	</body>
</html>