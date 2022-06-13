<%@ page import="com.projetafpa.connection.DbCon"%>
<%@ page import="java.sql.*"%>

<%

String name = request.getParameter("username");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String adress = "";
String city = "";
String state = "";
String cp = "";
String country = "";
String authorization ="";

try {

Connection con = DbCon.getConnection();
PreparedStatement ps = con.prepareStatement("insert into users(username,email,mobileNumber,password,securityQuestion,answer,adress,city,state,cp,country,authorization)values(?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, mobileNumber);
ps.setString(4, password);
ps.setString(5, securityQuestion);
ps.setString(6, answer);
ps.setString(7, adress);
ps.setString(8, city);
ps.setString(9, state);
ps.setString(10, cp);
ps.setString(11, country);
ps.setString(12, authorization);
ps.executeUpdate();

response.sendRedirect("signup.jsp?msg=valid");

}
catch(Exception e){
	
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}


%>



