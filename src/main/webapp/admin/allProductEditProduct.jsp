<%@page import="java.sql.Statement"%>
<%@page import ="com.projetafpa.connection.DbCon" %>
<%@page import="java.sql.ResultSet"%>
<%@page import ="java.sql.*" %>	

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>Admin Home</title>
<style>
h3
{
color:green;
text-align:center;
}

</style>
<%-- <%@ include file="/includes/navbar.jsp" %>--%>
 <%@ include file="adminHeader.jsp" %>
</head>
<body>
		
<div style="color: white; text-align: center; font-size:30px;">All products & Edit Products<i class="fab fa-elementor"></i></div>
<div>
</div>

<% 
String msg =request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product successfully Updated !</h3>
<%}%>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Something went wrong ! Try again !</h3>
<%}%>

	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price<i class="fa fa-euro-sign"></i></th>
				<th scope="col">Image</th>
				<th scope="col">Status</th>
				<th scope="col">Edit<i class="fas fa-pen-fancy"></i></th>
			</tr>
		</thead>
		<tbody>
			<%
		try{
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery ("select * from products");
			
			while(rs.next()){
			
			%>
			<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%><i class="fa fa-euro-sign"></i></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit<i
						class="fas fa-pen-fancy"></i></a></td>
			</tr>
			<%
			}
		
		}catch(Exception e){
			System.out.println(e);
		}		
		%>
		</tbody>
	</table>
</body>
<footer>
<%@include file="/includes/footer.jsp" %>
</footer>
</html>