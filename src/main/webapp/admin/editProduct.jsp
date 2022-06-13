<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.projetafpa.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<meta charset="UTF-8">
<title>Edit Product</title>
<style>
.back {
	color: white;
	margin-left: 2.5;
}
</style>
<%@ include file="/includes/navbar.jsp"%>
<%@ include file="adminHeader.jsp"%>
</head>
<body>
	<h2>
		<a class="back" href="allProductEditProduct.jsp"><i
			class="fas fa-arrow-circle-left">Back</i></a>
	</h2>
	<%
String id =request.getParameter("id");
try
{
	Connection con = DbCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from produit where idProd='"+id+"'");// creation d'une table de resultat
	while(rs.next()){

%>
	<form action="../edit-product" method="post">
		<input type="hidden" name="id" value="<%out.println(id);%>">
		<div class="left-div">
		<h3 class="black">Id product</h3>
		<input class="input-style" type="text" name="id" value="<%=rs.getString(1)%>"required>
		</div>
		
		<div class="right-div">
			<h3>Enter name</h3>
			<input class="input-style" type="text" name="name"
				value="<%=rs.getString(3) %>" required>

			<hr>
		</div>

		<div class="left-div">
			<h3>enter category</h3>
			<input class="input-style" type="text" name="category"
				value="<%=rs.getString(4) %>" required>

			<hr>
		</div>

		<div class="right-div">
			<h3>enter price</h3>
			<input class="input-style" type="text" name="price"
				value="<%=rs.getString(5) %>" required>

			<hr>
		</div>

		<div class="left-div">
			<h3>enter image</h3>
			<input class="input-style" type="text" name="image"
				value="<%=rs.getString(6) %>" required>

			<hr>
		</div>

		<div class="right-div">
			<h3>active</h3>
			<select class="input-style" name="active">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
			</select>
			<hr>
		</div>
		<button class="button">
			Save<i class="far fa-arrow-alt-circle-right"></i>
		</button>
	</form>
	<%
}	
		}catch(Exception e){
			System.out.println(e);
		}		
		%>
</body>
<br><br><br>
<footer>
<%@ include file="/includes/footer.jsp" %>
</footer>
</html>