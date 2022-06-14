package com.hotelmvc.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.model.Favorites;


@WebServlet("/remove-from-favorites")
public class RemoveFromFavoritesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roomId = request.getParameter("id");

		if (roomId != null) {
			ArrayList<Favorites> fav_list = (ArrayList<Favorites>) request.getSession().getAttribute("fav-list");
			if (fav_list != null) {
				for (Favorites f : fav_list) {
					if (f.getRoomId() == Integer.parseInt(roomId)) {
						fav_list.remove(fav_list.indexOf(f));
						break;
					}
				}
			}
			response.sendRedirect("favorites.jsp");
		} else {
			response.sendRedirect("favorites.jsp");
		}

	}
}
