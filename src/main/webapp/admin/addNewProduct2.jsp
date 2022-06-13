<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Product Added Successfully</h3>
	<%
	}
	%>

	<%
	if ("wrong".equals(msg)) {
	%>


	<h3 class="alert">Some thing went wrong! Try again</h3>
	<%
	}
	%>
	<%
	int id = 1;
	try {
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select max(IDPRODUIT) from produits");

		while (rs.next()) {
			id = rs.getInt(1);
			id++;
		}

	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	%>
	    <div class="form">
      <div class="title">Editer une formation</div>
    
      <div class="input-container ic1">
        <input id="firstname" class="input" type="text" placeholder=" " />
        <div class="cut"></div>
        <label for="firstname" class="placeholder">First name</label>
      </div>
      <div class="input-container ic2">
        <input id="lastname" class="input" type="text" placeholder=" " />
        <div class="cut"></div>
        <label for="lastname" class="placeholder">Last name</label>
      </div>
      <div class="input-container ic2">
        <input id="email" class="input" type="text" placeholder=" " />
        <div class="cut cut-short"></div>
        <label for="email" class="placeholder">Email</>
      </div>
      <button type="text" class="submit">submit</button>
    </div>
	<form action="../add-new-product" method="post">

		<h3 style="color: green:">
			Product ID:
			<%
		out.println(id);
		%>
		</h3>
		<input type="hidden" name="id" value="<%out.println(id);%>">

		<div class="left-div">
			<h4>Name</h4>
			<input class="input-style" type="text" name="name"
				placeholder="Enter Name" required>
			<hr>
		</div>
		<div class="right-div">
			<h4>Category</h4>
			<input class="input-style" type="text" name="category"
				placeholder="Enter Category" required>
			<hr>
		</div>
		<div class="left-div">
			<h4>Price</h4>
			<input class="input-style" type="number" name="price"
				placeholder="Enter Price" required>
			<hr>
		</div>
		<div class="right-div">
			<h4>Image</h4>
			<input class="input-style" type="text" name="image"
				placeholder="Enter Image" required>
			<hr>
		</div>
		<div class="left-div">
			<h4>Active</h4>
			<select class="input-style" name="active">
				<option value="Yes">Yes</option>
				<option value="Yes">No</option>
			</select>
			<hr>
		</div>
		<button class="button">
			Save<i class="far fa-arrow-alt-circle-right"></i>
		</button>
	</form>
</body>
<br>
<br></br>
<footer><%@include file="/includes/footer.jsp"%></footer>

</html>