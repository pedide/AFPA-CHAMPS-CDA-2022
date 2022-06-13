package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.UserDao;
import com.xprodmvc.dao.ShoppingDao;
import com.xprodmvc.model.User;
import com.xprodmvc.model.Shoppingsession;
import com.xprodmvc.model.DataEncryption;
import java.sql.*;
import java.util.Date;


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;cherset=utf-8");
		HttpSession session = request.getSession();
		
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		  Date date = new Date();
		
		try (PrintWriter out = response.getWriter()) {
			out.print("this is loginservlet2");
			
			
			String email = request.getParameter("log-mail");
			String passwordClair = request.getParameter("log-password");
			String password= (DataEncryption.getSHA1(passwordClair));
			/* out.print("this are the infos servlet" + email + "" + passwordClair); */ 
			UserDao udao = new UserDao(DBCon.getConnection());
			User user = udao.userLogin(email, password);
			
			
			if (user != null ) {
			
				if (user.getAuthorization().equals("Administrateur")) {
					request.getSession().setAttribute("auth",user);
					session.setAttribute("email",email);
					response.sendRedirect("admin/adminHome.jsp");
						
				} else{
				request.getSession().setAttribute("auth", user);
				System.out.print("User logged in " + email +" "+ user.getName());
				System.out.print("bobobo");
				
				
				
				ShoppingDao shopdao = new ShoppingDao(DBCon.getConnection());
				Shoppingsession shopS = shopdao.checkShoppingS(user.getId());
				if (shopS == null) {
				
				SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				Date date1 = new Date();
				String formattedDate=(formatter1.format(date1));
				shopS = shopdao.insertshoppingSession(user.getId(), formattedDate);
				request.getSession().setAttribute("shoppingcard", shopS);
				System.out.println("Shop session" + shopS.getId());
				

				
				} else {
					request.getSession().setAttribute("shoppingcard", shopS);
					System.out.println("Test Shop id pendant login" + shopS.getId());
				}
				response.sendRedirect("index.jsp");
				
				}
				
			
			} else {
				
				response.sendRedirect("login.jsp?msg=invalid");
				System.out.print("there is no user");
				
			}
		} catch (NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	}
	

