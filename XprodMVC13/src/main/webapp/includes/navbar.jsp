<%@ page import="com.xprodmvc.model.User"%>
<%@ page import="com.xprodmvc.dao.UserDao"%>

<style><%@include file="../css/home-style.css"%></style>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
 	  <img src="images/toque.jpg" alt="Logo Toque" />
		<h3 style="margin-left: 2% ; vertical-align:middle">Diablement Bon</h3>
		
 	<%
  	User auth1 = (User)request.getSession().getAttribute("auth");
	%>
 	<%if (auth1 != null){%> 
 	
    <%	String email = session.getAttribute("email").toString();
		String username = auth1.getName();
	%>
		<h6 style="color:#FFFAF0 ; margin-left: 2%"><i class="fas fa-user-alt" style="color:#FF9999">
			</i> Bienvenue 
			<%//out.print(email);
				out.print(username);%> 
		</h6>   
     <% }%>

	<div class="container-nav">

		<div class="container-fluid">
<%-- <%
  	User auth1 = (User)request.getSession().getAttribute("auth");
%> --%>


			<div class="d-flex">
				<style>
				.container-nav {
					max-width: 1800px;
				}

				a {
					font-size: 18px;
				}
				</style>


				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">

						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp" style="color: #FFFAF0"><i
								class="fas fa-home" style="color: #FF9999"></i> Accueil</a></li>
						<li class="nav-item"><a class="nav-link" href="cart.jsp"
							style="color: #FFFAF0"><i class='fas fa-shopping-cart'
								style="color: #FF9999"></i> Mon Panier <span
								class="badge badge-light">${cart_list.size()}</span></a></li>
						<%if (auth1 != null){
        %>

						<li class="nav-item"><a class="nav-link" href="orders.jsp"
							style="color: #FFFAF0"><i class="fas fa-list-alt"
								style="color: #FF9999"></i> Commande</a></li>

						<!-- <li class="nav-item">
        	<a class="nav-link" href="" style="color:#FFFAF0"><i class="fa fa-edit" style="color:#FF9999"></i> Change Details </a>
        </li> -->
						<li class="nav-item"><a class="nav-link"
							href="addNewMessage.jsp" style="color: #FFFAF0"><i
								class="fa fa-edit" style="color: #FF9999"></i> Nous Contacter</a></li>
						<li class="nav-item"><a class="nav-link"
							href="discussion.jsp" style="color: #FFFAF0"><i
								class="fa fa-address-book" style="color: #FF9999"></i> Message
								reçu</a></li>
						<li class="nav-item"><a class="nav-link" href="log-out"
							style="color: #FFFAF0"><i class="fas fa-share-square"
								style="color: #FF9999"></i> Déconnexion</a></li>



						<%}else{%>

						<li class="nav-item"><a class="nav-link" href="login.jsp"
							style="color: #FFFAF0"><i class="fas fa-user-alt"
								style="color: #FF9999"></i> Connexion</a></li>
						<!--   <li class="nav-item">
          <a class="nav-link" href="signup.jsp" style="color:#FFFAF0">Inscription</a>
        </li>   -->

						<% }%>
						<li class="nav-item">
							<div class="search-container">
								<form action="searchHomeUser.jsp" method="post">
									<input type="text" placeholder="Rechercher" name="search">
									<button type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>

							</div>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>

</nav>