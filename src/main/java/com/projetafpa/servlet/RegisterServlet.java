package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.connection.DbCon;
import com.projetafpa.dao.UserDao;
import com.projetafpa.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());		
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()){
			out.print("this is register servlet");
			
			String name = request.getParameter("name");
			String email = request.getParameter("mail");
			String password = request.getParameter("password");
			String mobileNumber = request.getParameter("mobileNumber");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String address = "";
			String cp = "";
			String city = "";
			String state="";
			String country="";
			
	
			try {
			UserDao udao = new UserDao (DbCon.getConnection());
			User user= udao.UserRegister(name,email,password,mobileNumber,securityQuestion,answer,address,cp,city,state,country);
			
			System.out.print("User : "+name+email+ "registred");
			response.sendRedirect("BestLogin.jsp?msg=valid");
			
			
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
