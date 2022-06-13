<%@page import="com.gaiaconsulting.connection.DbCon" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
h3
{
color:green;
text-align:center;
}</style>
<%@include file="../includes/head.jsp" %>
</head>
<body>
<div style="color:white;text-align:center; font-size:30px;"><i class="fa fa-university"></i></div>
<h4 class="alert">Product added successfully</h4>
<h4 class="alert">Product already exist in your cart ! Quantity increased</h4>
<h4 class="alert">Password change successfully</h4>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th> 
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
           
          </tr>
        </thead>
        <tbody>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><i class="fa fa-inr"></i> </i></td>
            <td><a href="">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>

        </tbody>
      </table>
      <br>
      <br>
      <br>
</body>
<footer><%@include file="../includes/footer.jsp" %></footer>
</html>