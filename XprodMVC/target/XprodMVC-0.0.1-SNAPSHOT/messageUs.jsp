<%-- 
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>CONTACTEZ-NOUS</title>
<%@include file="includes/head.jsp"%>
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
	ResultSet rs = st.executeQuery("select max(idm) from messageU");
	
	while(rs.next()){
		
		idm=rs.getInt(1);
		idm++;
		
	}
	}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	
	%>



	<form action="message-us" method="post">
    <div class="card-header my-3">comment pouvons nous aider ?</div>
    <div class="contenair ">
    <div class=class="card-header my-3 ">
	
	<input class="input-style" type="text" name="name" placeholder="First Name" required>
	<hr>

</div>

  <div class=class="contenair">
	
	<input class="input-style" type="text" name="email" placeholder="Email" required>
	<hr>

</div>




  <div class=class="contenair">
	
	<input class="input-style" type="text" name="mobileNum" placeholder="phone number" required>
	<hr>
	
	
	
	
	
	<div class="right-div">
            <h3>Objet de votre message: </h3> 
                <br>
                <select name="objetmessage">
                    <option value="Modifier votre commande">Modifier votre commande</option>
                    <option value="Annuler votre commande">Annuler votre commande</option>
                    <option value="Retourner des articles">Retourner des articles</option>
                    <option value="Remboursement des articles">Remboursement des articles</option>
                    <option value="Demande d'informations">Demande d'informations</option>
                    <option value="Autres">Autres</option>
                </select> 
                <hr>
        </div>
	
	
	<div class="right-div">
            <h3>Entrer votre message :</h3>
            <textarea id="story" name="message" rows="5" cols="33"></textarea>
            <hr>
        </div>


<button class="button" type="submit" >Envoyer<i class="far fa-arrow-alt-circle-right"></i></button>




</div>
</div>
</div>
<br><br><br>
</body>
</html>

 --%>




<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Teko:400,700" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	
<style><%@include file="../css/index.css"%></style>

<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>CONTACTEZ-NOUS</title>
<%@include file="includes/head.jsp"%>
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



	




  
<section id="contact">
<form action="message-us" method="post">
			<div class="section-content">
				<h1 class="section-header">comment pouvons nous aider ?<span class="content-header wow fadeIn " data-wow-delay="0.2s" data-wow-duration="2s"> Contactez-nous</span></h1>
				
			</div>
			<div class="contact-section">
			<div class="container">
				<form>
					<div class="col-md-6 form-line">
			  			<div class="form-group">
			  			
			  				<label for="exampleInputUsername">Your name</label>
					    	<input type="text" name="name"  class="form-control" placeholder=" Enter Name">
				  		</div>
				  		<div class="form-group">
					    	<label for="exampleInputEmail">Email Address</label>
					    	<input type="email" name="email" class="form-control"  placeholder=" Enter Email id">
					  	</div>	
					  	<div class="form-group">
					    	<label for="telephone">Mobile No.</label>
					    	<input type="tel" name="mobileNum" class="form-control"  placeholder=" Enter 10-digit mobile no.">
			  			</div>
			  			
			  				<div class="form-group">
					    	<label for="telephone">Objet de votre message:</label>
					    	<select type="tel"  name="objetmessage" class="form-control"  placeholder=" Enter 10-digit mobile no.">
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
			  			
			  		</div>
			  		<div class="col-md-6">
			  			<div class="form-group">
			  				<label for ="description"> Message</label>
			  			 	<textarea  class="form-control" name="message" id="description" placeholder="Enter Your Message"></textarea>
			  			</div>
			  			<div>

			  				<button type="button" class="btn btn-default submit"><i class="fa fa-paper-plane" aria-hidden="true"></i>  Envoyer Message</button>
			  			</div>
			  			
					</div>
				</form>
			</div>
		</section>





</div>
</div>
</div>
<br><br><br>
</body>
</html>







