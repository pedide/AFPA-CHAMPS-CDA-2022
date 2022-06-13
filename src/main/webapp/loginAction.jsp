<%@page import ="com.projetafpa.model.User" %>
<%@page import="com.projetafpa.dao.*"%>
<%@ page import="com.projetafpa.connection.DbCon"%>
<%@ page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if("admin@admin.com".equals(email) && "1234admin".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("DashboardAdmin.jsp");
	
}

else {
	int z=0;
	try{
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"'and password='"+password+"'");
		while(rs.next()){
		response.sendRedirect("DashboardUser.jsp");
		
		}
	
		if (z==0){
			response.sendRedirect("Login.jsp?msg=notexist");
		} 
	} catch(Exception e){
		System.out.println(e);
		//response.sendRedirect("login.jsp?msg=invalid");
	}
} 
%>