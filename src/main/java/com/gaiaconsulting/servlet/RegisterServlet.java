package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.UserDao;
import com.gaiaconsulting.model.User;


@WebServlet("/register-user")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("hello");
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwordSHA1 = request.getParameter("password");
			String mobileNumber = request.getParameter("mobileNumber");
			
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String adress = "";
			String city = "";
			String cp = "";
			String country = "";
			String state = "";
			String authorization = "Client";
			
			UserDao udao = new UserDao (DbCon.getConnection());
			User user = udao.userRegister(name,email,mobileNumber,adress,city,cp,country,state,passwordSHA1,authorization,securityQuestion,answer);
			System.out.print("User : "+name +email+"registered !");
			response.sendRedirect("login.jsp?msgvalid");
			
			
			
		}catch (ClassNotFoundException | SQLException e) {
			System.out.print("No user registered !");
			response.sendRedirect("signup.jsp?msg=invalid");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
