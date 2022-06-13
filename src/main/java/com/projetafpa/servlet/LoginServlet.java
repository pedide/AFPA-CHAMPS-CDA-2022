package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projetafpa.connection.DbCon;
import com.projetafpa.dao.UserDao;
import com.projetafpa.model.User;


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.sendRedirect("Login.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()){
			out.print("This is login servlet");
			HttpSession session = request.getSession();
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			out.print("This are the infos servlet "+email+"  "+password);
		
			try {
			UserDao udao = new UserDao(DbCon.getConnection());
			User user = udao.userLogin(email, password);
			
			if ("admin@admin.com".equals(email) && "1234admin".equals(password)) {
				request.getSession().setAttribute("auth", user);
				session.setAttribute("email", email);
				
				System.out.print("User : " + email + "logged in ");
				response.sendRedirect("index.jsp");
				
				
				 }else if (user != null) { out.print("user login");
				 request.getSession().setAttribute("auth", user);
				 response.sendRedirect("index.jsp"); System.out.print("User : " + email +
				 "logged in ");
				 
				
				
			

				// out.print("This are the infos servlet" +user.getName());
			} else {
				System.out.print("There is no user ");
			}
			

		} catch (ClassNotFoundException| SQLException e) {
			e.printStackTrace();

		}
	}
	}

}
