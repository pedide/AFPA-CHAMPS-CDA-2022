package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.UsersDao;
import com.xprodmvc.model.Users;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	/*protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.sendRedirect("index.jsp");
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
		//	out.print("This is login servlet ");

			String email = request.getParameter("email");
			String mot_de_passe = request.getParameter("mot_de_passe");
			// String authorizations = request.getParameter("authorizations");
			out.print("Essayer une autre combinaison mot de passe + identifiant");
			UsersDao udao = new UsersDao(DbCon.getConnection());
			Users user = udao.userlogin(email, mot_de_passe);
			if (user != null) {
				if("thibaultsene1@gmail.com".equals(email)&&"non".equals(mot_de_passe)) {
				request.getSession().setAttribute("auth", user);
				 session.setAttribute("email",email);
				response.sendRedirect("admin/adminHome.jsp");

			} else {
				request.getSession().setAttribute("auth", user);
				System.out.print("User logged in," + " Nom de l'utilisateur: " + user.getNom());
				response.sendRedirect("index.jsp");
			}}else {
				System.out.println("there is no user");
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		}
	}
}
