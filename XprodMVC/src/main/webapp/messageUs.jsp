<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<html>
<head>
<style><%@include file="../css/modifierProf.css"%></style>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>CONTACTEZ-NOUS</title>

</head>

<body>
<%@include file="includes/navbar.jsp"%>

<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
	%>
	<h3 class="alert">Produit ajouté avec succès</h3>
<% }%>
<%


if("wrong".equals(msg)){
	%>
	<h3 class="alert">Quelque chose s'est mal passé essaie encore</h3>
	<% }%>
	<%
	int idm=1;
	
	try{
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(idm) from messageu");
	
	while(rs.next()){
		
		idm=rs.getInt(1);
		idm++;
		
	}
	}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	
	%>

<body>

	<div class="container rounded bg-white mt-3 mb-3">
		<div class="row">
			

			<!-- <div class="col-md-5 border-right"> -->
				<div class="p-3 py-3">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">comment pouvons nous aider ?</h4>
						<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Contactez-nous</h4>
						 <hr>
					</div>
</div>


					<form action="message-us" method="post">

<% System.out.println("modifier");%>
					
					<div class="row mt-2" >
						<div class="col-md-6">
						<label for="exampleInputUsername">Your name</label>
					    	<input type="text" name="name"  class="form-control" placeholder>
								 
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label for="exampleInputEmail">Email Address</label>
					    	<input type="email" name="email" class="form-control"  placeholder >
								
						</div>
						<div class="col-md-12">
							<label for="telephone">Mobile No.</label>
					    	<input type="tel" name="mobileNum" class="form-control"  placeholder>
								 
						</div>
						<div class="col-md-12">
							<label for="telephone">Objet de votre message:</label>
					    	<select type="tel"  name="objetmessage" class="form-control"  placeholder>
								 	    	  <br>
               
                    <option value="Modifier votre commande">Modifier votre commande</option>
                    <option value="Annuler votre commande">Annuler votre commande</option>
                    <option value="Retourner des articles">Retourner des articles</option>
                    <option value="Remboursement des articles">Remboursement des articles</option>
                    <option value="Demande d'informations">Demande d'informations</option>
                    <option value="Autres">Autres</option>
                </select> 
                <hr>
						</div>
					  <div class="form-group">
								<label for ="description"> Message</label>
			  			 	<textarea  class="form-control" name="message" id="description" placeholder></textarea>
							 
							</div>
					</div>
					
		
					<div class="mt-5 text-center">
						<button type="submit" class="btn btn-default submit center" ><i class="fa fa-paper-plane" aria-hidden="true"></i>  Envoyer Message</button>
					</div>
				</div>

		

				

	
</div>
</div>

	
	</form>
	
	
	<br><br><br>
<%@include file="includes/footer.jsp"%>
</html>







