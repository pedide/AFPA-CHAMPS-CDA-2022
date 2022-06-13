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
import com.xprodmvc.dao.ProductsDao;
import com.xprodmvc.model.Produits;



@WebServlet("/add-info-order")
public class AddInfoOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		private String query;
		private Connection con;
		private PreparedStatement pst1;
		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
	
		try(PrintWriter out = response.getWriter()){
			request.setCharacterEncoding("UTF-8");
			
			out.print("This is add new information order servlet. ");
		

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(); // ça va donner la date du jour
			
	
			String name = request.getParameter("name");
			String prenom = request.getParameter("prenom");
			String email = request.getParameter("email"); 
			String nomberMobile = request.getParameter("nomberMobile"); 
			String adresse = request.getParameter("adresse");
			String cp = request.getParameter("cp");
			String ville = request.getParameter("ville");
			String pays = request.getParameter("pays");
			String date1 = (formatter.format(date));
			
			query = "insert into orders (username,dateOrders,adresse,ville,cp,pays,mobileNumber,email) values (?,?,?,?,?,?,?,?)";
			 
			con = DbCon.getConnection();
			pst1 = this.con.prepareStatement(query);
			 
			
			pst1.setString(4, name);
			//pst1.setString(2, prenom);
			pst1.setString(6, date1);
			pst1.setString(9, adresse);
			pst1.setString(10, ville);
			pst1.setString(11, cp);
			pst1.setString(12, pays);
			pst1.setString(13, nomberMobile);
			pst1.setString(19, email);
			
			pst1.executeUpdate();
			  
			System.out.println(name+ ", vos informations ont bien été ajouté.");
			response.sendRedirect("index.jsp?msg=done");
			 
		
		} catch (Exception e) {
			System.out.println("Les informations n'ont pas été ajouté.");
			response.sendRedirect("addressPaymentForOrder.jsp?msg=wrong");
		} 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
