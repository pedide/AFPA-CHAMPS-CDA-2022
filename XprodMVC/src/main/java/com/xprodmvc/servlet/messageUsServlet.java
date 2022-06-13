package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.UserDao;
import com.xprodmvc.model.User;

/**
 * Servlet implementation class messageUs
 */
@WebServlet("/message-us")
public class messageUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()) {
	    
			System.out.println("ça rentre 0000!" );
			
	   
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			 Date date = new Date();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobileNum = request.getParameter("mobileNum");
		String objetmessage = request.getParameter("objetmessage");
		String message = request.getParameter("message");
		String date1=(formatter.format(date));
		//date.getDate();
		
		System.out.println("ça rentre!" );
		
		UserDao udao = new UserDao(DBCon.getConnection());
		User user = udao.insertMessage(name,email,mobileNum,objetmessage,message,date1);
		
	System.out.print("User:"+name+email+"registred !");
	response.sendRedirect("messageUs.jsp?msg=valid");
		
		
		}catch(ClassNotFoundException |SQLException e) {
			System.out.println("No user registred !");
			response.sendRedirect("home.jsp?msg=invalid" );

		}

	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
