package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.dao.UserDao;
import com.xprodmvc.connection.DbCon;
import com.xprodmvc.model.User;


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
			request.setCharacterEncoding("UTF-8");
			
			String name = request.getParameter("name");//ce qui est entre"" on le recupere de la saisie utilisateur
			String email = request.getParameter("login-mail");
			String mobileNumber = request.getParameter("mobileNumber");
			String passwordSHA1 = request.getParameter("login-password");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String adresse = "";
			String cp = "";
			String ville = "";
			String departement = "";
			String pays = "";
			String authorization = "Client";

			//connecter à la base de données
			//composant d'accès aux données
			UserDao udao = new UserDao(DbCon.getConnection());
			User user = udao.userRegisterB(name, email, mobileNumber, passwordSHA1,authorization ,securityQuestion,
					answer,adresse, cp, ville, departement, pays);
			System.out.println("L'utilisateur "+name+ " s'est enregistré et son adresse mail est "+email);
			response.sendRedirect("login.jsp?msg=valid");
			
		}catch (ClassNotFoundException | SQLException e) {
			System.out.println("L'utilisateur ne s'est pas enregistré !");
			response.sendRedirect("signup.jsp?msg=invalid");
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				doGet(request, response);
	}

}
