<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet href="/css/addNewProduct-style"> -->
<%@include file="adminHeader.jsp"%>

<meta charset="UTF-8">
<title>Edit Product</title>
<style>
.back {
	color: white;
	margin-left: 2.5%;
}
</style>
</head>
<body>
	<h2>
		<a class="back" href="AllProductEditProduct.jsp"><i class="fas
			fa-arrow-circle-left"></i>Back</a>
	</h2>
	<%
	String id = request.getParameter("id");
	try{
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from produits where IDPRODUIT='"+id+"'");
		while(rs.next()){
	
	%>
	<form action="../edit-product" method="post">
	<input type="hidden" name="id" value="<% out.println(id);%>">
	<div class="left-div"> 
		<h3>Enter ID</h3>
		<input class="input-style" type="text" name="id" value="<%=rs.getString(1)%>"required>
		<hr>
	</div>
	<div class="right-div"> 
		<h3>Enter Name</h3>
		<input class="input-style" type="text" name="name" value="<%=rs.getString(4)%>"required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Enter Category</h3>
		<input class="input-style" type="text" name="category" value="<%=rs.getString(2)%>"required>
		<hr>
	</div>

	<div class="right-div">
		<h3>Enter Price</h3>
		<input class="input-style" type="text" name="price" value="<%=rs.getString(5)%>"required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Enter Image</h3>
		<input class="input-style" type="text" name="image" value="<%=rs.getString(6)%>"required>
		<hr>
	</div>

	<div class="right-div">
		<h3>Active</h3>
		<select class="input-style" name="active">
		<option value="Yes">Yes</option>
			<option value="No">No</option>
		</select>
		
		<hr>
	</div>
	<button class="button">Save<i class="far fa-arrow-circle-right"></i></button>
	</form>
<%
}
}catch (Exception e) {
		System.out.println(e);
		}
%>
</body>
<br><br><br>
<footer><%@include file="../includes/footer.jsp"%></footer>
</html>