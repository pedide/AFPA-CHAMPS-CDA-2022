<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import ="com.projetafpa.model.Cart" %>	
<%@page import ="com.projetafpa.model.User" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
	
	

<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">RATP Connect</a>
    
    <%  
    User auth1 = (User) request.getSession().getAttribute("auth");
    %>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup.jsp">sign up</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Cart.jsp">Cart<span class="badge badge-danger px-1">${cart_list.size()}</span></a> 
        </li>
<% if(auth1 !=null) {	
%>
					<li class="nav-item"><a class="nav-link" href="Orders.jsp">orders</a></li>

					<li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a></li>

					<li class="nav-item"><a href="">About <i
							class="fa fa-address-book"></i></a></li>

					<li class="nav-item"><a href="messageUs.jsp">Message Us <i
							class='fas fa-comment-alt'></i></a></li>

					<li class="nav-item"><a href="">Change Details <i
							class="fa fa-edit"></i></a></li>


					<i class="fa fa-search"></i>

					<%
					} else {
					%>
						<li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a>
						</li>

						<%
						}
						%>
					
				</ul>
    
    </div>
    </div>
  </div>
</nav>