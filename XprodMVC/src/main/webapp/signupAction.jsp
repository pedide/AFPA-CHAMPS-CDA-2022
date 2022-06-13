<%@page import="com.xprodmvc.model.DataEncryption"%>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@page import="java.sql.*"%>

<%

String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNum = request.getParameter("mobileNumber");
String passwordClair = request.getParameter("logPassword");
//String password = DataEncryption.getSHA1(passwordClair);
String securiteQuest = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String adress = "";
String cp ="";
String city = "";
String state = "";
String contry = "";
String authorization = "";
try{
	String password;
	password = DataEncryption.getSHA1(passwordClair);

	
	Connection con = DBCon.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into user(username,password,authorization,email,mobileNum,securiteQuest,adress,city ,state,cp,contry,answer) values (?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, password);
	ps.setString(3, authorization);
	ps.setString(4, email);
	ps.setString(5, mobileNum);	
	ps.setString(6, securiteQuest);	
	ps.setString(7, adress);
	ps.setString(8, city);
	ps.setString(10, cp);
	ps.setString(9, state);
	ps.setString(11, contry);
	ps.setString(12, answer);
	
	
	ps.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid" );
	
}catch(Exception e) {
	System.out.println();
	response.sendRedirect("signup.jsp?msg=invalid" );
}



%>