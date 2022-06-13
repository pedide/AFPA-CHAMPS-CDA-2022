<%@page errorPage="error.jsp" %>
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>