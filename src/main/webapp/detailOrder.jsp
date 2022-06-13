<%-- <%@page errorPage="error.jsp" %> --%>
<%@page import="com.pokepok.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page import="com.pokepok.model.*"%>
<%@ page import="com.pokepok.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<%@include file="includes/head.jsp"%>
<script>
	if (window.history.forwart(1) != null)
		window.history.forward(1);
</script>
<style>
.fa-arrow-circle-left{
	color:orange;
}
.table-light{
}
.block{
	width:65%;
	float:left;
	margin-left: 30px;
}
.block2{
	float:left;
	width : 30%;
	margin-left: 30px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<br>
	<div class="block">
	
	
			<%
			String id = request.getParameter("id");
			int total = 0;
			int sno = 0;
			try {
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs1 = st.executeQuery("select sum(total) from orders where idOrders = '" + id + "'");
				while (rs1.next()) {
					total = rs1.getInt(1);
			%>
				<h3>Informations Commandes</h3>
				<h6><a href="index.jsp"><i class='fas fa-arrow-circle-left'> Back </i></a></h6>
				<h5 style="background-color: red; color:white;">Montant Total:<i class="fa fa-inr" style="color:white;"></i> <%out.println(total);%></h5>
			
				<%
			}

			} catch (Exception e) {
				System.out.println(e);
			}
			%>
			
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">S.No</th>
					<th scope="col">Product Name</th>
					<th scope="col">Category</th>
					<th scope="col"><i class="fa fa-inr"></i> price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Sub Total</th>
				</tr>
			</thead>
		
		<tbody>

				<%
				
				try {
					Connection con = DbCon.getConnection();
					Statement st = con.createStatement();
					ResultSet rs2 = st.executeQuery("select * from produits inner join orders on produits.IDPRODUIT = orders.idProduct where idOrders = '" + id + "'");
					while (rs2.next()) {
				%>
						<tr>
							<%sno = sno + 1;%>
							<td><%out.println(sno);%></td>
							<td><%=rs2.getString(4)%></td>
							<td><%=rs2.getString(2)%></td>
							<td><i class="fa fa-inr"></i><%=rs2.getString(5)%></td>
							<td><%=rs2.getString(11)%></td>
							<td><i class="fa fa-inr"></i> <%=rs2.getString(14)%></td>
						</tr>
				<%
					}
				} catch (Exception e) {
					System.out.println(e);
				}
				%>
			<br>
		</tbody>
	</table>
	</div>
		
		
</body>
<footer>
<%@include file="includes/footer.jsp"%>
</footer>
</html>