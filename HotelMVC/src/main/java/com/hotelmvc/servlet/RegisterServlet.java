package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.UserDAO;
import com.hotelmvc.model.EncryptionPassword;
import com.hotelmvc.model.User;

@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
	
			
		String userFirstname = request.getParameter("firstname");
		String userLastname = request.getParameter("lastName");
		String userEmail = request.getParameter("login-mail");
		String password = request.getParameter("login-password");
		String userPassword = EncryptionPassword.getSHA1(password);
		String userName = request.getParameter("firstname");
		String mobileNumber = request.getParameter("mobileNumber");
	
		String securityQuestion = request.getParameter("securityQuestion");
		String answer = request.getParameter("answer");
		String address = "";
		String cp = "";
		String city = "";
		String state = "";
		String country = "";
		String authorization = "client";
		
		UserDAO udao = new UserDAO(DbCon.getConnection());
		User user = udao.userRegister(userFirstname, userLastname, userEmail, userPassword, userName, mobileNumber, securityQuestion, answer, address, cp, city, state, country, authorization);
		
		System.out.print("User : " + userName + userEmail + user + " registered ! ");
		response.sendRedirect("login.jsp?msg=valid");
		}catch (ClassNotFoundException | SQLException e) {
			System.out.print("No user registered ! ");
			response.sendRedirect("signup.jsp.msg=invalid");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
