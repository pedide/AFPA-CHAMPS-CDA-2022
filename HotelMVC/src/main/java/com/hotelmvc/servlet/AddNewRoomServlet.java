package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.RoomDAO;
import com.hotelmvc.model.Room;


@WebServlet("/add-new-room")
public class AddNewRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			Double price = Double.parseDouble(request.getParameter("price"));
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			RoomDAO rDAO = new RoomDAO(DbCon.getConnection());
			Room product = rDAO.addRoomADMIN(name, category, price, image, active);
			

			response.sendRedirect("admin/add-new-room.jsp?msg=done");
			System.out.println("Method AddProduct called and executed : [ "+ product +", and ID : "+ id + " ] from AddNewProductServlet ligne39");
			
		}	catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("No Product added!");
			response.sendRedirect("admin/add-new-room.jsp?msg=wrong");
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
