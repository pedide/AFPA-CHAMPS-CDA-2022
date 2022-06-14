<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	

<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<title>ADMIN HOME</title>
	<%@include file="adminHeader.jsp"%>

<style >
 
	 h3 {
	color: green;
	text-align: center;
}
</style>
</head>
<body style="margin-top: 8em">


	<div class="sticky" style=" color: black; text-align: center; font-size: 30px;">
		Edit Rooms <i class="fab fa-elementor"></i>
	</div>
	<%
	String msg = request.getParameter("msg");

	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Product Successfully Updated</h3>

	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Something went wrong! Please try again!</h3>
	<%
	}
	%>

	<table>
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price <i class="fas fa-euro-sign"></i></th>
				<th scope="col">Image</th>
				<th scope="col">Status</th>
				<th scope="col">Edit<i class="fas fa-pen-fancy"></i></th>

			</tr>
		</thead>
		<tbody>
			<%
		try {
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
/* 			Besoin de strocker la requete dans un resort set
 */			
			ResultSet rs = st.executeQuery("select roomId, roomName, roomCategory, roomPrice, roomImage, roomIsActive from room");
			while(rs.next()){			
	
		%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%> <i class="fa fa-euro-sign"></i></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				

				<td><a href="edit-room.jsp?id=<%=rs.getString(1)%>">Edit <i class="fas fa-pen-fancy"></i></a></td>

			</tr>
			<%
			}

			} catch (Exception e){
				System.out.println(e);
			}
			%>
		</tbody>

	</table>

</body>
</html>