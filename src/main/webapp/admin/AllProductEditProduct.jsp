<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@page import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="adminHeader.jsp"%>
<link rel="stylesheet" href="../css/addNewProduct-style.css"> 
<link rel="stylesheet" href="../css/home-style.css"> 

<title>Admin Home</title>
 
<style>
h3 {
	color: black;
	text-align: center;
}
</style>

</head>
<body>
	<div style="color: white; test-align: center; font-size: 30px">
		All Products & Edit Products</div>
	<h3 class="alert">Products Successfully Updated</h3>
	<h3 class="alert">Some thing went wrong try again</h3>
	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fas fa-euro-sign"></i>Price</th>
				<th scope="col">Image</th>
				<th scope="col"><i class="fas fa-pen-fancy"></i>Status</th>
					<th scope="col"><i class="fas fa-pen-fancy"></i>Edit</th>
			</tr>
		</thead>
		
		<tbody>
		<%
		try{
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from produits");
			while(rs.next()){
				
		%>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(3)%></td>
		<td><i class="fas fa-euro-sign"><%=rs.getString(5)%></i></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%></td>
		
		<td><a href="editProduct.jsp?id= <%=rs.getString(1)%>">Edit<i class="fas fa-pen-fancy"></i></a></td>
		</tr>
		<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			
		} %>
	
		</tbody>
		
	</table>
</body>
<footer><%@include file="../includes/footer.jsp"%></footer>
</html>