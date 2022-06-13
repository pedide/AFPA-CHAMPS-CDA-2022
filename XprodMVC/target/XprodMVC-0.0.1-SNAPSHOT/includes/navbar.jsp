<%@page import="com.xprodmvc.model.*"%>


<style><%@include file="../css/home-style.css"%></style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" /> 


<nav class="navbar navbar-expand-lg navbar-light bg-light">
<!-- <div class="topnav sticky">
	<div class="contenair"> -->
		<div class="container-fluid"  style=" background-color:#F6E1CF" >
			<a class="navbar-brand" href="#">BAGS BOUTIQUE</a>

			<%
			User auth1 = (User) request.getSession().getAttribute("auth");
			%>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse " id="navbarSupportedContent">
<!-- 				<ul class="navbar-nav ml ml-auto "> -->
				    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">ACCUEIL<i class="fa fa-home" style=" color: #ff7f50 	"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="card.jsp">PANIER<i class="fas fa-shopping-cart"  style=" color: #ff7f50 	"></i><span
							class="badge badge-danger px-4">${cart_list.size()}</span></a></li>
				

					<%
					if (auth1 != null) {
					%>
					<li class="nav-item"><a class="nav-link" class="nav-link" href="orders.jsp">ACHATS</a>
					</li>
							<li class="nav-item">
							<a class="nav-link" href="">Change Details<i class="fa fa-edit" style=" color: #ff7f50 	"></i></a></li>
            <!-- <li class="nav-item"><a class="nav-link"  href="messageUs.jsp">CONTACTEZ-NOUS <i class='fas fa-comment-alt' style=" color: #ff7f50 	"></i></a></li> -->
           <!-- <li class="nav-item"> <a class="nav-link" href="">QUI NOUS SOMME <i class="fa fa-address-book" style=" color: #ff7f50 	"></i></a></li> -->
							</li>
					<li class="nav-item"><a class="nav-link" href="log-servlet">LOGOUT<i class="fas fa-sign-out-alt" style=" color: #ff7f50" ></i></a>
					</li>

					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="login.jsp">LOGIN<i class="fa fa-sign-in" style=" color: #ff7f50" ></i></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="signup.jsp">SIGNUP <i class="fa fa-sign-in" style=" color: #ff7f50" ></i></a>
						<%
						}
						%>
							
				</ul>
			<!-- 	<div class="search-container"> -->
					<!-- <form class="d-flex" action="searchClient.jsp" method="post">
					<input class="form-control me-2"   aria-label="Search"> <input type="search" placeholder="search" name="search">
					<button class="btn btn-outline-success" type="submit"><i class="fa fa-search"></i>Search</button>  -->

					<form class="form-inline my-2 my-lg-0 ml-auto" action="searchClient.jsp" method="post">
						<input class="form-control" type="text" placeholder="search" name="search">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
			<!-- 	</form> -->
		<!-- 	</div> -->
<!-- 		</div>
		</div> -->
</nav>