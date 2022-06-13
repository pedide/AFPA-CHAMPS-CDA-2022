package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pokepok.connection.DbCon;
import com.pokepok.dao.OrderDao;
import com.pokepok.dao.UserDao;
import com.pokepok.model.DataEncryption;
import com.pokepok.model.User;


@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			
			String email = request.getParameter("EMAIL");
			String Password = request.getParameter("newPassword");
			String newPassword = DataEncryption.getSHA1(Password);
			String mobileNumber = request.getParameter("mobileNumber");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			
			UserDao udao = new UserDao (DbCon.getConnection());
			User user = udao.userForgotPassword(email, mobileNumber, securityQuestion, answer, newPassword);
			if(user != null) {
			System.out.print("User logged in " +email +" mot de passe changé ");
			response.sendRedirect("forgotPassword.jsp?msg=valid");
			}else {
				System.out.println("Impossible de changer le Mot de Pass");
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
