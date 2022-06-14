<%@page errorPage="error.jsp" %>
<%@page import="com.hotelmvc.model.User"%>
<%
User auth1 = (User) request.getSession().getAttribute("auth");
if (auth1 != null) {
	request.setAttribute("auth", auth1);
	System.out.println("Navbar Authentification Id User: [ " + auth1.getIduser() + " ] from navbarProjet.jsp ligne8");
}
%>
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" >
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="../css/navbar-style.css">	 
	<script>   
	    window.onscroll = function() {scrollFunction()};
		function scrollFunction() {
		  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {  
		    document.getElementById("navbar").style.background = "#ffffff";
		    document.getElementById("navbar-brand").style.color = "#000000";
		    document.getElementById("navbar-menu").style.color = "#000000";
		    document.getElementById("navbar").style.height = "50px";
		  } 
		  else {   
		    document.getElementById("navbar").style.background = "rgba(0, 0, 0, 0.50)";
		    document.getElementById("navbar").style.height = "80px";
		    document.getElementById("navbar-brand").style.color = "#ffffff";
		    document.getElementById("navbar-menu").style.color = "#ffffff";
		  }
		}
	</script>
</head>
<body>
	<div class="navbar navbar-fixed-top container-fluid" id="navbar">
	  	<div class="navbar-header">
	    	<button type="button" class="navbar-toggle navbar-default" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" id="navbar-brand">Barrière ADMIN</a>
	    </div>
	    <div class="collapse navbar-right navbar-collapse" id="myNavbar">
	    	<ul class="nav navbar-nav" id="navbar-menu">
	    		    		<%
					if (auth1 != null) {
				%>
				<li style="text-align: center" >AMIN <%=auth1.getUsername()%></li>
					<%
					}
				%>

	    		<%
					
					if (auth1 != null) {
				%>
				<li onclick="location.href='admin-home.jsp'">Home</li>
	    		<li  onclick="location.href='add-new-room.jsp'">Ajouter une nouvelle chambre</li>
	    		<li onclick="location.href='all-clients-orders.jsp'">Les réservations</li>
	    		<li onclick="location.href='all-rooms-edit.jsp'">Modifier une chambre</li>
	    		<li  onclick="location.href='inbox-chat.jsp'">Inbox Chat</li>  
	    		<li onclick="location.href='inbox-contact-admin.jsp'">Inbox formulaire contact</li>		
	    		<li onclick="location.href='log-out'">Logout</li>
				<%
					} else {
				%>
	    		<li onclick="location.href='../login.jsp'">Login</li>
	    		<li onclick="location.href='../register.jsp'">Register</li>
	    		<%
					}
				%>
	    	</ul>
	    </div>
	</div>
</body>