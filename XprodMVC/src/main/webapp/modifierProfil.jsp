<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.xprodmvc.model.User"%>
<style><%@include file="../css/modifierProf.css"%></style>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/navbar.jsp"%>
<title>Insert title here</title>
</head>


<body>

	<div class="container rounded bg-white mt-5 mb-5">
		<div class="row">
			<div class="col-md-3 border-right">
				<div
					class="d-flex flex-column align-items-center text-center p-3 py-5">
					<img class="rounded-circle mt-5 "
						src="https://e7.pngegg.com/pngimages/825/720/png-clipart-computer-icons-businessperson-woman-business-love-people-thumbnail.png">
					<span class="font-weight-bold">Client</span> <span
						class="text-black-50">votre compte</span><span> </span>
						 <hr>
				</div>
			</div>

			<div class="col-md-5 border-right">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Profile Settings</h4>
						 <hr>
					</div>

	<%
	User auth = (User) request.getSession().getAttribute("auth");

	if (auth != null) {
		
		request.setAttribute("auth", auth);
	    String email = auth.getEmail();
	
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
	System.out.println("valeur email " + email);
	
	while(rs.next()){
	
	%>

					<form action="profil-edit" method="post">

<% System.out.println("modifier");%>
					
					<div class="row mt-2" >
						<div class="col-md-6">
							<label class="labels">Nom et Prenom</label> <input type="text"
								class="form-control" name="nom" value="<%=rs.getString(2)%>"required>
								 
						</div>
			
						<!--  <div class="col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" value="" placeholder="surname"></div> -->
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">Numero de Téléphone</label> <input
								type="text" class="form-control" name="mobileNum" value="<%=rs.getString(6)%>" required>
								
						</div>
						<div class="col-md-12">
							<label class="labels">Address</label><input type="text"
								class="form-control"name="adress"  value="<%=rs.getString(8)%>"required>
								 
						</div>
						<div class="col-md-12">
							<label class="labels">country </label><input type="text"
								class="form-control" name="country"  value="<%=rs.getString(12)%>" required>
								 
						</div>
					  <div class="form-group">
								<label>question de Securité</label>	<label>Security question</label> 
								<select   name="securityQuestion" value="<%=rs.getString(2)%>" >
								 <option value="what was your first car ?">Quel était votre première voiture ?</option>
								 <option value="what is the name of your first pet ?">Quel est le nom de votre premier animal de compagnie ?</option>
								 <option value="what elementary school did you attend ?">Quelle école primaire as-tu fréquentée ?</option>
								 <option value="what is the name of the town where you were born ?">Quel est le nom de la ville où tu es né ?</option>
							<input type="text" class="form-control" name="answer" value="<%=rs.getString(13)%>" required>
							 
							</div>
					</div>
					
		
					<div class="mt-5 text-center">
						<button class="btn btn-primary profile-button" type="submit">Save
							Profile</button>
					</div>
				</div>
</div>
		

				
			
		<div class="col-md-4">
			<div class="p-3 py-5">
			<span> </span><img class="rounded-circle mt-5 " src="images/logo.jpg">
			<br>
	
			</div>
		</div>
	
</div>
</div>

	
	</form>
	<%}} %>
	
	<br><br><br>
</body>

<%@include file="includes/footer.jsp"%>
</html>