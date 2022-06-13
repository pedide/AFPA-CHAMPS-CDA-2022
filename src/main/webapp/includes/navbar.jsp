<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.xprodmvc.model.Users"%>
<%
Users auth1 = (Users) request.getSession().getAttribute("auth");
 
if (auth1 != null) {
	request.setAttribute("auth", auth1);

}
String search = request.getParameter("search");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

	<div class="container">
		<div class="container-fluid">
		
			<a class="navbar-brand" href="#">BigBears</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
 
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<img src="product-image/bigbearslogo.jpg">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link active"
						href="index.jsp">Accueil <span class="sr-only">(current)</span></a></li>

					<%-- 					<li class="nav-item"><a class="nav-link" href="cart.jsp">Panier<span
							class="badge badge-danger px-1">${cart_list.size()}</span></a></li> --%>
					
					<%
					if (auth1 != null) {
					%>
					<li class="nav-item"><a class="nav-link"> Bienvenue : <strong><%=auth1.getEmail()%></strong></a></li>
					<li class="nav-item"><a class="nav-link" href="order.jsp">mes
							Commandes</a></li>



					<li class="nav-item"><a class="nav-link" href="cart.jsp">Mon
							panier</a></li>
							
					<li class="nav-item"><a class="nav-link" href="messageUs.jsp">Contactez
							nous </a></li>
					<li class="nav-item"><a class="nav-link" href="home.jsp">A propos</a></li>
					<li class="nav-item"><a class="nav-link" href="log-out">Deconnexion</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Notre carte</a></li>
					<%
					} else {
					%>

					<li class="nav-item"><a class="nav-link" href="login.jsp">Connexion</a></li>
			
					<li class="nav-item"><a class="nav-link" href="signup.jsp">S'enregistrer</a></li>
					<%
					}
					%>
				</ul>
				<!-- 	<form action="searchHome.jsp" class="form-inline my-2 my-lg-0">
					<input  class="form-control mr-sm-2" type="search"
						placeholder="rechercher" aria-label="rechercher">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Rechercher</button>
				</form> -->
				<!-- <div class="searchHome" action="searchHome.jsp" method="post">
					<input class="navbar w-40" type="text" placeholder="rechercher" name="rechercher">
					<button type="submit">
						<i class="w-40 fa fa-search"></i>
					</button>
				</div>  -->
				<br> <br> <br>
				
			</div>
		</div>
	</div>
	
</nav>
