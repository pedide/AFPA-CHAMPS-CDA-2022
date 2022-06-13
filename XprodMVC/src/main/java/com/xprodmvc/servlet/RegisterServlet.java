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


@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()) {
		
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobileNum = request.getParameter("mobileNumber");
		String passwordClair = request.getParameter("logPassword");
		//String password = DataEncryption.getSHA1(passwordClair);
		String securiteQuest = request.getParameter("securityQuestion");
		String answer = request.getParameter("answer");
		String adress = request.getParameter("adress");
		String cp ="";
		String city = "";
		String state = "";
		String contry = request.getParameter("contry");
		String authorization = "";
		
		UserDao udao = new UserDao(DBCon.getConnection());
		User user = udao.userRegister(name,email,passwordClair,"",mobileNum,securiteQuest,answer,adress,cp,city,state,contry);
	
		System.out.print("User:"+name+email+"registred !");
	response.sendRedirect("login.jsp?msg=valid");
		
		
		}catch(ClassNotFoundException |SQLException e) {
			System.out.println("No user registred !");
			response.sendRedirect("signup.jsp?msg=invalid" );
			
		
		}
		
		
		
	}
	
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
