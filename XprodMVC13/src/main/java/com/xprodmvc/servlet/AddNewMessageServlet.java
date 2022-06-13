package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.UserDao;
import com.xprodmvc.model.User;


@WebServlet("/add-new-message")
public class AddNewMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String query;
	private Connection con;
	private PreparedStatement pst1;
	private ResultSet rs;//ajout H
	private String query2;//ajout H
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html;charset=UTF-8");
		
		
		try(PrintWriter out = response.getWriter()){
			out.print("This is add new message servlet. ");
			
			request.setCharacterEncoding("UTF-8");

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(); // ça va donner la date du jour
			
	
			String name = request.getParameter("name");
			String prenom = request.getParameter("prenom");
			String email = request.getParameter("email"); 
			String objetMessage = request.getParameter("objetMessage"); 
			String message = request.getParameter("message");
			String date1 = (formatter.format(date));
			
			query = "insert into messagesuser (nom,prenom,email,objetmessage,message,date) values (?,?,?,?,?,?)";
			 
			con = DbCon.getConnection();
			pst1 = this.con.prepareStatement(query);
			
			pst1.setString(1, name);
			pst1.setString(2, prenom);
			pst1.setString(3, email);
			pst1.setString(4, objetMessage);
			pst1.setString(5, message);
			pst1.setString(6, date1);
			
			pst1.executeUpdate();
			  
			System.out.println(name+ ", votre message a bien été ajouté.");

			//on recupere email de user connecté
			String emailT = (String) request.getSession().getAttribute("email");
			// System.out.println(emailT);

			query2 = "select authorization from user where email=? limit 1"; // limiter le resultat de la liste à une ligne
																				
			pst1 = this.con.prepareStatement(query2);
			pst1.setString(1, emailT);
			rs = pst1.executeQuery();
			String authoriz = null;

			while (rs.next()) {
				authoriz = rs.getString(1);
			}
			// System.out.println(authoriz);

			// une condition en fonction de user à mettre AJOUT H
			if (authoriz.equals("Client")) {
				response.sendRedirect("index.jsp?msg=done");
			}

			if (authoriz.equals("Administrateur")) {
				System.out.println("rentree");
				response.sendRedirect("admin/adminHome.jsp?msg=done");
			}
		 
			
		} catch (Exception e) {
			System.out.println("Le message n'a pas été ajouté.");
			System.out.println(e);
			response.sendRedirect("addNewMessage.jsp?msg=wrong");
		} 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
