package com.pokepok.servlet;

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

import com.pokepok.connection.DbCon;
import com.pokepok.dao.UserDao;
import com.pokepok.model.DataEncryption;
import com.pokepok.model.User;


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {}
	
	/**
	 
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}*/

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			out.print("This is login servlet!!! ");
		
			
			String email = request.getParameter("login-mail");
			String password = request.getParameter("login-password");
			String passwordSHA1 = DataEncryption.getSHA1(password);
			out.print("Erreur!! Voici les données qui ont été rentrées "+email+" " +password);
			UserDao udao = new UserDao (DbCon.getConnection());
			User user = udao.userLogin(email, passwordSHA1);
			System.out.println(passwordSHA1);
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			if(user != null) {
				if(user.getAuthorization().equals("Administrateur")) {
					request.getSession().setAttribute("auth", user);
					session.setAttribute("email",email);
					response.sendRedirect("admin/adminHome.jsp"); 
				}else {	 
					request.getSession().setAttribute("auth", user);
					session.setAttribute("email",email);
					System.out.print("User logged in " +email +" "+ user.getName());
					response.sendRedirect("index.jsp");
			}}else {
				System.out.print("There is no user");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}

