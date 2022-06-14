package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.UserDAO;
import com.hotelmvc.model.EncryptionPassword;
import com.hotelmvc.model.User;


@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("test/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String userEmail = request.getParameter("login-mail");
			String mobileNumber = request.getParameter("mobileNumber");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String password = request.getParameter("newPassword");
			String newPassword = EncryptionPassword.getSHA1(password);

			UserDAO udao = new UserDAO(DbCon.getConnection());
			User user = udao.userForgotPassword(userEmail, mobileNumber, securityQuestion, answer, newPassword);
			
			System.out.print("User : "+user+" password changed ! ///forgotpassworServlet");
			response.sendRedirect("login.jsp?.msg=done");

		} catch (Exception e) {
			System.out.print("No user password changed !");
			response.sendRedirect("forgotPassword.jsp?msg=invalid");

		}	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
