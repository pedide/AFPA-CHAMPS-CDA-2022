<%@page import="com.xprodmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@page import="com.xprodmvc.model.DataEncryption"%>


<%
String name = request.getParameter("name");//ce qui est entre"" on le recupere de la saisie utilisateur
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String passwordSHA1 = request.getParameter("password");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
// String adresse = request.getParameter("adresse");
// String cp = request.getParameter("cp");
/* String ville = request.getParameter("ville");
String département = request.getParameter("département");
String pays = request.getParameter("pays"); */
String adresse = "";
String cp = "";
String ville = "";
String département = "";
String pays = "";

try{
	String password = DataEncryption.getSHA1(passwordSHA1);
	Connection con = DbCon.getConnection();//on recupere la connection
	PreparedStatement ps = con.prepareStatement("insert into user (username, email, mobileNumber, password, securityQuestion, answer,adresse, cp, ville, département, pays) value(?,?,?,?,?,?,?,?,?,?,?)");
	
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobileNumber);
	ps.setString(4, password);
	ps.setString(5, securityQuestion);
	ps.setString(6, answer);
	ps.setString(7, adresse);
	ps.setString(8, cp);
	ps.setString(9, ville);
	ps.setString(10, département);
	ps.setString(11, pays);
			
	ps.executeUpdate();
	
	response.sendRedirect("login.jsp?msg=valid");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}

%>