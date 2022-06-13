package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.connection.DbCon;


@WebServlet("/message-us")
public class MessageUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	
	try(PrintWriter out = response.getWriter()){
		out.print("Message bien envoyé servlet");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String numeroTel = request.getParameter("numeroTel");
		String numeroCmd = request.getParameter("numeroCmd");
		String nmessage = request.getParameter("message");
		String pieceJointe = request.getParameter("pieceJointe");
			
		/*
		 * query
		 * ="insert into messages (nom, prenom, numeroTel, numeroCmd, message, pieceJointe)values (?,?,?,?,?,?)"
		 * ; pst = this.con.prepareStatement(query);
		 * 
		 * pst.setString(1, nom); pst.setString(2, prenom); pst.setString(3, numeroTel);
		 * pst.setString(4, numeroCmd); pst.setString(5, message1); pst.setString(6,
		 * pieceJointe);
		 * 
		 * pst.executeUpdate();
		 */
		
		
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		
		//Message mdao = new Message (DbCon.getConnection());
		
		System.out.print("Votre message : "+nom+", "+prenom+" a bien été envoyé !");
	}catch (Exception e) {
		e.printStackTrace();
		
		
	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
