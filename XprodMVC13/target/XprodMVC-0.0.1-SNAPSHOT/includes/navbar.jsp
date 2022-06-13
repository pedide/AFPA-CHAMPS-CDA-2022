<%@ page import="com.xprodmvc.model.User"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
  <div class="container-fluid">
  <%
  	User auth1 = (User)request.getSession().getAttribute("auth");
  %>
    <a class="navbar-brand" href="#">Xprod</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fas fa-home" style="color:#FF9999"></i> Accueil</a>
        </li>
        <li class="nav-item">
                  <a class="nav-link" href="cart.jsp"><i class='fas fa-shopping-cart' style="color:#FF9999"></i> Mon Panier
                  <span class="badge badge-danger">${cart_list.size()}</span></a>
        </li>   
        <%if (auth1 != null){
        %> 
        <li class="nav-item">
          <a class="nav-link" href="orders.jsp">Achats</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="log-out">Se déconnecter</a>
        </li>
        <li class="nav-item">
        	<a class="nav-link" href=""><i class="fa fa-edit" style="color:#FF9999"></i> Change Details </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="addNewMessage.jsp"><i class='fas fa-comment-alt' style="color:#FF9999"></i> Nous Contacter </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href=""><i class="fa fa-address-book" style="color:#FF9999"></i> About </a>
        </li>
        
        <%}else{%>
        
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Se Connecter</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup.jsp">Inscription</a>
        </li>  
        
        <% }%>
        
      </ul>  
      <div class="search-container">
			<form action="searchHomeUser.jsp" method="post">
				<input type="text" placeholder="Rechercher" name="search">
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
    </div>
    </div>
  </div>
</nav>