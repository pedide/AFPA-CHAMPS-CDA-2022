package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.UserDao;
import com.xprodmvc.model.User;


@WebServlet("/forgot-password")
public class forgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()) {
			
			
			String email = request.getParameter("email");
			String mobileNum = request.getParameter("mobileNumber");
			//String password = DataEncryption.getSHA1(passwordClair);
			String securiteQuest = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String newpasswordClair = request.getParameter("newPassword");
			
			
			UserDao udao = new UserDao(DBCon.getConnection());
			User user = udao.userForgotPassword(email,newpasswordClair,mobileNum,securiteQuest,answer);
		System.out.print("User:"+email+"password changed !");
		response.sendRedirect("forgotPassword.jsp?msg=done");
			
		
		}catch(Exception e) {
			System.out.println("No user registred !");
			response.sendRedirect("forgotPassword.jsp?msg=No user password changed" );
			
		
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
