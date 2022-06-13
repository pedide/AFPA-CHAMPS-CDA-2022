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
<title>Informations</title>
<link rel="stylesheet" href="css/signup-style.css">
<%@include file="includes/head.jsp"%>
<script>
	if (window.history.forwart(1) != null)
		window.history.forward(1);
</script>
<style>
body{
	font:em Helvetiva;
	background-image: url(background/fondEcranPoke.png)!important;
	background-attachment:fixed;
}

.fa-arrow-circle-left{
	color:orange;
}
.table-light{
}
.block2{
	width : 100%;
	text-align:center;
}
.card{
	width : 30%;
	margin-left: 30px;
	display:inline-block;
	text-align:initial;
}
.fa-arrow-circle-left{
	padding-left:50px;
}
.input-style{
	width:100%;
	margin-bottom:5px;
}


</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<br>
	<div class="center">
		<h6><a href="index.jsp"><i class='fas fa-arrow-circle-left'> Retour </i></a></h6>
		
		<%
			String msg = request.getParameter("msg");
			if("done".equals(msg)){ %>
				<h3 class="alert">L'adresse a été mis à jour correctement!</h3>
			<%}
			if("wrong".equals(msg)){%>
				<h3 class="alert">Erreur, essayer de nouveau</h3>
		<%}%>

	<div class = "block2" >
			<div class="card">
				<div class="card-header text-center">Vos informations personnelles</div>
				<div class="card-body" style="width:100%;">
					<form action="info-client" method="post">
					
					<%try {
						String email = session.getAttribute("email").toString();%>
						<input type="hidden" name="email" value="<%out.println(email);%>">
						<%Connection con = DbCon.getConnection();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from user where EMAIL='" + email + "'");
							while (rs.next()) {
								 System.out.println(rs.getString(9));
					%>
					
						<div class="form-group">
							<label>Adresse</label> 
							<input type=text "  class="input-style"name="adress" value="<%=rs.getString(9)%>" placeholder="Entrer votre adresse" required><br>
							<label>Ville</label> 
							<input type="text" class="input-style" name="city" value="<%=rs.getString(10)%>" placeholder="Entrer votre ville" required><br> 
							<label>Code Postal</label> 
							<input type="text" class="input-style" name="cp" value="<%=rs.getString(11)%>" placeholder="Entrer votre code postal" required><br>
							<label>Département</label> 
							<input type="text" class="input-style" name="state" value="<%=rs.getString(12)%>" placeholder="Entrer votre département" required><br> 
							<label>Pays</label> 
							<input type="text" class="input-style" name="country" value="<%=rs.getString(13)%>" placeholder="Entrer votre pays" required><br>
							<label>Télephone</label> 
							<input type="text" class="input-style" name="phone" value="<%=rs.getString(6)%>" placeholder="Entrer votre téléphone" required><br>
							
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-val" value="signup">Modifier</button>
						</div>
					
					<%		}
					}catch(Exception e){
						System.out.println(e.getMessage());
					}%>
					</form>
				</div>
			</div>

	</div>
	</div>

	<div class="boooo" style="display:none">
		<h3>Select way of Payment</h3>

		<h3>Pay online on this btechdays@pay.com</h3>

		<h3 style="color: red">*If you select online Payment then enter
			you transaction ID here otherwise leave this blank</h3>
			
		<h3 style="color: red">*If you enter wrong transaction id then
		your order will we can cancel!</h3>
		<i class='far fa-arrow-alt-circle-right'></i>
		<h3 style="color: red">*Fill form correctly</h3>
	</div>



	<br>
	<br>
	<br>

</body>
<footer>
<%@include file="includes/footer.jsp"%>
</footer>
</html>