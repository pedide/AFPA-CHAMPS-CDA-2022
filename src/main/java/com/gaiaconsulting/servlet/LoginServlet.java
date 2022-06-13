package com.gaiaconsulting.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.UserDao;
import com.gaiaconsulting.model.DataEncryption;
import com.gaiaconsulting.model.User;



@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("index.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){

			
			
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String passwordSHA1 = DataEncryption.getSHA1(password);
				System.out.print(" email " +email+" password "+ password);
				
				UserDao udao = new UserDao(DbCon.getConnection());
				User user = udao.userLogin(email, passwordSHA1);
				
				System.out.print(" UserDao connection ");
				
				if(user !=null) {
				if(user.getAuthorization().equals("admin")){ 
					request.getSession().setAttribute("auth", user);
					session.setAttribute("email",email);
					System.out.print(" connecté en tant qu'admin");
					response.sendRedirect("admin/adminHome.jsp");
					System.out.print(" redirigé vers adminHome");

				}else  {
					request.getSession().setAttribute("auth", user);
					System.out.print(" User "+email+ " Connecté en tant que client ");
					
					response.sendRedirect("index.jsp");
					System.out.print("redirigé vers l'index ");
				}
				}else {
					System.out.print(" Impossible de se connecter ");
				}
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			
		}
	}


