package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
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

@WebServlet("/reponse-admin")
public class ReponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			out.print("This is login servlet!!! ");
		
			String id = request.getParameter("idRep");
			String name = request.getParameter("nameRep");
			String email = request.getParameter("emailRep");
			String message = request.getParameter("messageRep");
			System.out.println("l'id recup avant le try:"+id);
			System.out.println("le nom recup avant le try:"+name);
			Date date = new Date();
			try{
				Connection con = DbCon.getConnection();
				PreparedStatement ps = con.prepareStatement("insert into messages (idAdmin, idClient, nomClient, emailClient, date, message, reponse) values (?,?,?,?,?,?,?)");
				ps.setString(1,"0");
				ps.setString(2,null);
				ps.setString(3,name);
				ps.setString(4,email);
				ps.setString(5,(new Date().toString()));
				ps.setString(6,message);
				ps.setString(7,null);
				ps.execute();
				
				String oui = "oui";
				System.out.println("le nom recup :"+id);
				Statement st = con.createStatement();
				st.executeUpdate("update messages set  reponse ='"+oui+"' where idMessage='"+id+"'");
				
				response.sendRedirect("admin/messageAdmin.jsp?msg=done");
				
			}catch(Exception e){
				System.out.println(e.getMessage());
				response.sendRedirect("admin/messageAdmin.jsp?msg=wrong");	
			}
		
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
