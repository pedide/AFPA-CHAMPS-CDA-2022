package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hotelmvc.model.Favorites;


@WebServlet("/add-to-favorites")
public class AddToFavoritesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Favorites> favList = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			
			Favorites fav = new Favorites();
			fav.setRoomId(id);
			fav.setFavQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Favorites> favBySession = (ArrayList<Favorites>) session.getAttribute("fav-list");
			
			
			
			if(favBySession==null) {
				if(request.getSession().getAttribute("auth")==null) {
					
					out.println("<h3 style='color:crimon; text-align:center'><a href='login.jsp'>Login or register to save your fav list</a></h3><h3 "
							+ "style='color:crimon; text-align:center'>Go to Favorite page<a href='room.jsp'>Go to Favorites</a></h3>");
					favList.add(fav);
					session.setAttribute("fav-list", favList);
				}else {
					
					favList.add(fav);
					session.setAttribute("fav-list", favList);
					out.println("<h3 style='color:crimon; text-align:center'><a href='room.jsp'>Continue your shopping</a></h3><h3 "
							+ "style='color:crimon; text-align:center'>Go to Favorite page<a href='favorites.jsp'>Go to Favorites</a></h3>");					}


			} else {
				favList = favBySession;
				boolean exist = false;
				
				for(Favorites f  : favBySession) {		

					if(f.getRoomId()==id) {
						exist=true;	
						/*
						 * out.
						 * println("<h3 style='color:crimon; text-align:center'>Item already in your favorite's page.<a href='favorites.jsp'>"
						 * + "Go to Favorites page</a></h3>");
						 */
						System.out.println("product exist");
						response.sendRedirect("favorites.jsp");		

					}
				} if(!exist) {
					favList.add(fav);
					
					out.println("<h3 style='color:crimon; text-align:center'><a href='room.jsp'>Continue your shopping</a></h3><h3 style='color:crimon;"
							+ " text-align:center'>Go to Favorites<a href='favorites.jsp'>Go to Favorite's page</a></h3>");
				}
		
			}
			for(Favorites f : favBySession) {
				out.println(f.getRoomId());
			}
		}
	}	

}
