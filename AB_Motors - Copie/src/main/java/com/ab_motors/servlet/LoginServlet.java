package com.ab_motors.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ab_motors.connection.dbCon;
import com.ab_motors.dao.UsersDAO;
import com.ab_motors.model.Users;


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html/charset=UTF-8");
		HttpSession session = request.getSession();
		try(PrintWriter out = response.getWriter()) {
			//out.print("this is login servlet. ");
			
			String email = request.getParameter("login-mail");
			String password = request.getParameter("login-password");
			//out.print("This are the servlet infos: "+email+", "+password);
			UsersDAO udao = new UsersDAO(dbCon.getConnection());
			Users user = udao.userLog(email, password);
			
			if(user!=null) {
				request.getSession().setAttribute("auth",user);
                session.setAttribute("email",email);
				if (user.getAuthorization().equals("admin")) {
                    response.sendRedirect("admin/adminHome.jsp");
                } else{ 
                System.out.print("User logged in " + email +" "+ user.getNOM());
                response.sendRedirect("index.jsp");

                }} else {

                response.sendRedirect("login.jsp?msg=invalid");
                System.out.print("there is no user");

            }
        } catch (Exception e){
            e.printStackTrace();
        }

	}

}
