<%@page import="com.xprodmvc.model.DataEncryption"%>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@page import="java.sql.*"%>

<%
String email=request.getParameter("log-mail");

String passwordClair=request.getParameter("log-password");

if("iman@hotmail.com".equals(email)&&"1230".equals(passwordClair)){
session.setAttribute("email",email);
response.sendRedirect("admin/adminHome.jsp");



}else{
	int z=0; //z est un compteur
	try{
		String password;
		password = DataEncryption.getSHA1(passwordClair);
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
		
		while(rs.next()){
			response.sendRedirect("index.jsp");
		}
		if(z==0){
			response.sendRedirect("login.jsp?msg=notexist");
			
			
		}
		
		
	}catch(Exception e){
		System.out.println(e);
		/* response.sendRedirect("login.jsp?msg=invalid"); */
		
		
	}
}


%>