package com.ab_motors.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ab_motors.connection.dbCon;
import com.ab_motors.dao.vehiculeDAO;
import com.ab_motors.model.cart;
import com.ab_motors.model.cartVehicule;
import com.ab_motors.model.vehicule;

@WebServlet("/get-info-vehicule")
public class GetInfoVehiculeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 
		 try (PrintWriter out = response.getWriter()) {
	            
			 ArrayList<cartVehicule> cartvlist = new ArrayList<cartVehicule>();
	            	int id = Integer.parseInt(request.getParameter("idvehicule"));
	            	cartVehicule cartv = new cartVehicule();
					 HttpSession session = request.getSession();
			            ArrayList<cartVehicule> cartv_list = (ArrayList<cartVehicule>)session.getAttribute("cartv-list");
			            cartv.setIDVEHICULE(id);
			            cartvlist.add(cartv);
			            session.setAttribute("cartv-list", cartvlist);
					 response.sendRedirect("infoVehicule.jsp");
  
	      }

	}
	
}
