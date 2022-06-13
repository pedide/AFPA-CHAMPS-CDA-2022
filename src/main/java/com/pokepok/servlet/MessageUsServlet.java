package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@WebServlet("/message-us")
public class MessageUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		User auth = (User) request.getSession().getAttribute("auth");
		try(PrintWriter out = response.getWriter()){
			out.print("This is login servlet!!! ");
		
			int id = auth.getId();
			String name = auth.getName();
			String email = auth.getEmail();
			String message = request.getParameter("message");
			String reponse = "non";
			Date date = new Date();
	
			System.out.println(name);
			System.out.println(email);
			try{
				Connection con = DbCon.getConnection();
				PreparedStatement ps = con.prepareStatement("insert into messages (idAdmin,idClient, nomClient, emailClient, date, message, reponse) values (?,?,?,?,?,?,?)");
				ps.setString(1,null);
				ps.setInt(2,id);
				ps.setString(3,name);
				ps.setString(4,email);
				ps.setString(5,(new Date().toString()));
				ps.setString(6,message);
				ps.setString(7,reponse);
				ps.execute();
				response.sendRedirect("message.jsp?msg=valid");

				
			}catch(Exception e){
				System.out.println(e.getMessage());
				response.sendRedirect("message.jsp?msg=invalid");	
			}
		
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
