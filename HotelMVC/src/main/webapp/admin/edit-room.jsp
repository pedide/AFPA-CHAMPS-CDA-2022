<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="../css/addNewProduct-style.css">
	<%@include file="adminHeader.jsp"%>

<meta charset="UTF-8">
<title>Edit Product</title>
<style>
.black {
	color: black;
	margin-left: 2.5%;
}
</style>
	<script>
	function CustomAlert(){
		this.render = function(dialog){
			var winW = window.innerWidth;
			var winH = window.innerHeight;
			var dialogoverlay = document.getElementById('dialogoverlay');
			var dialogbox = document.getElementById('dialogbox');
			dialogoverlay.style.display = "block";
			dialogoverlay.style.height = winH+"px";
			dialogbox.style.left = (winW/2)-(550 * .5)+"px";
			dialogbox.style.top = (winH/2)-(550 * .5)+"px";
			dialogbox.style.display = "block";
			document.getElementById('dialogboxhead').innerHTML = "Warning Message";
			document.getElementById('dialogboxbody').innerHTML = dialog;
			document.getElementById('dialogboxfoot').innerHTML = '<button class="btn btn-danger" style= "background-color: red; " onclick="Alert.ok()">Delete</button>';
	
		}
		this.ok = function(){
			document.getElementById('dialogbox').style.display = "none";
			document.getElementById('dialogoverlay').style.display = "none";

		}
	}
	var Alert = new CustomAlert();
	</script>
</head>
<body style="margin-top: 8em">
	<h4>
		<a class="black" href="all-rooms-edit.jsp"><i
			class="fas fa-arrow-circle-left">Back</i></a>
	</h4>

	<%
	String id = request.getParameter("id");
	try {
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
		"SELECT roomId, roomName,roomCategory, roomPrice, roomImage, roomIsActive from room where roomId ='" + id + "'");
		while (rs.next()) {
	%>
		<h2 style="text-align: center">Modifier la chambre ID : <%out.println(id);%></h2>
	
	<form action="../edit-room" method="post">
	<input type="hidden" name="id" value="<%out.println(id);%>">
		<div class="left-div">
			<h3 class="black">Id Product</h3>
			<input class="input-style" type="text" name="id" value="<%=rs.getString(1)%>"
				required>
			<hr>
		</div>
		<div class="right-div">
			<h3 class="black">Enter Name</h3>
			<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>"
				required>

			<hr>
		</div>

		<div class="left-div">
			<h3 class="black">Enter Category</h3>
			<input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>"
				required>

			<hr>
		</div>


		<div class="right-div">
			<h3 class="black">Enter Price</h3>
			<input class="input-style" type="text" name="price" value="<%=rs.getString(4)%>"
				required>

			<hr>
		</div>


		<div class="left-div">
			<h3 class="black">Enter Image</h3>
			<input class="input-style" type="text" name="image" value="<%=rs.getString(5)%>"
				required>

			<hr>
		</div>


		<div class="right-div">
			<h3 class="black">Check Status</h3>
			<select class="input-style black" name="active">
				<option value="yes">Yes</option>
				<option  value="no">No</option>
			</select>
			<hr>
		</div>
		<button class="button">Save<i class="far fa-arrow-alt-circle-right"></i></button>
		
	</form>
					
							
 <a  style="margin-top: 10px; color: black; " href="../delete-room?id=<%=rs.getString(1)%>">Delete <i class="fas fa-trash" style="color: white"></i></a> 

	<%
	}

	} catch (Exception e) {
	System.err.println(e);
	}
	%>
</body>
<br>
<br>
<br>
</html>