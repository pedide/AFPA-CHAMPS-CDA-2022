<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Room</title>
	<%@include file="adminHeader.jsp"%>

</head>

<body style="margin-top: 8em">
	

	<%
	String msg = request.getParameter("msg");

	if ("done".equals(msg)) {
	%>

	<h3 class="alert">Product Added successfully</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Something went wrong, please try again</h3>
	<%
	}
	%>
	<%
	int id = 1;
	try {
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select max(roomId) from room");
		while (rs.next()) {
			id = rs.getInt(1);
			id++;
		}
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	%>


	<form action="../add-new-room" method="post" ">
		<h3  style="color: black;">
			Product ID :
			<%
		out.println(id);
		%>
		</h3>
		<input type="hidden" name="id" value="<%out.println(id);%>">

		<div class="left-div">
			<h3 style="color: black;">Enter Name</h3>
			<input class="input-style" type="text" name="name"
				placeholder="Enter name" required>
			<hr>
		</div>

		<div class="right-div">
			<h3 style="color: black;">Enter Category</h3>
			<input class="input-style" type="text" name="category"
				placeholder="Enter category" required>

			<hr>
		</div>
		<div class="left-div">
			<h3 style="color: black;">Enter Price</h3>
			<input class="input-style" type="number" name="price"
				placeholder="Enter price" required>

			<hr>
		</div>
		<div class="right-div">
			<h3 style="color: black;">Enter Image</h3>
			<input class="input-style" type="text" name="image" placeholder=image
				required>

			<hr>
		</div>

		<div class="left-div" style="display: block; margin: auto">
			<h3 v>Active</h3>
			<select class="input-style" name="active">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
			</select>

			<hr>
		</div>
		<div style="width: 300px; display: block; margin: auto">
			<button type="submit" class="button">
				Save<i class="far fa-arrow-alt-circle-right"></i>
			</button>

		</div>



	</form>
</body>

</html>