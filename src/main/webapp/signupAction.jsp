<%@ page import="com.gaiaconsulting.connection.DbCon"%>
<%@ page import="java.sql.*"%>


<%
String name = request.getParameter ("name");
String email = request.getParameter ("email");
String mobileNumber = request.getParameter ("mobileNumber");
String adress = "";
String city = "";
String cp = "";
String country ="" ;
String state = "" ;
String password = request.getParameter ("password");
String authorization ="client" ;
String securityQuestion = request.getParameter ("securityQuestion");
String answer = request.getParameter ("answer");

try{
	Connection con = DbCon.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into users(name,email,mobileNumber,adress,city,cp,country,state,password,authorization,securityQuestion,answer) values(?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobileNumber);
	ps.setString(4, adress);
	ps.setString(5, city);
	ps.setString(6, cp);
	ps.setString(7, country);
	ps.setString(8, state);
	ps.setString(9, password);
	ps.setString(10, authorization);
	ps.setString(11, securityQuestion);
	ps.setString(12, answer);
	ps.executeUpdate();
	
	response.sendRedirect("signup.jsp?msg=valid");
}

catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}

%>