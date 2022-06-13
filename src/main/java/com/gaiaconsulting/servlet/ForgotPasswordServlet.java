package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.UserDao;
import com.gaiaconsulting.model.DataEncryption;
import com.gaiaconsulting.model.User;


@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
			String email = request.getParameter("email");
			String mobileNumber = request.getParameter("mobileNumber");
			String password = request.getParameter("password");	
			String newPassword = DataEncryption.getSHA1(password);
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			//String newPassword = request.getParameter(DataEncryption.getSHA1("newPassword"));

			//String newPassword = request.getParameter("newPassword");
			

			UserDao udao = new UserDao (DbCon.getConnection());
			User user = udao.userForgotPassword(email,mobileNumber,newPassword,securityQuestion,answer);
			System.out.print("User : " +email+" password changed !");
			response.sendRedirect("forgotPassword.jsp?msg=done");
			
			
		} catch (Exception e) {
			System.out.print("No user password changed !");
			response.sendRedirect("forgotPassword.jsp?msg=invalid");

			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
