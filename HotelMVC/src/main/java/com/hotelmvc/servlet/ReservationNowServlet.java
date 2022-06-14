package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.model.Reservation;
import com.hotelmvc.model.Room;
import com.hotelmvc.model.User;
import com.hotelmvc.dao.ReservationDAO;
import com.hotelmvc.dao.RoomDAO;



@WebServlet("/reservation-now")
public class ReservationNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

			Date date = new Date();
			User auth = (User)request.getSession().getAttribute("auth");
			Room ro = new Room();

			Reservation resa = new Reservation();
			RoomDAO rDao = new RoomDAO(DbCon.getConnection());
			Room rPrice = rDao.getSingleRoom(Integer.parseInt(request.getParameter("id")));

			Double priceDAO = rPrice.getRoomPrice();


			
			
			if(auth!=null) {
				String roomId = request.getParameter("id");
				int roomQuantity = Integer.parseInt(request.getParameter("quantity"));
				out.println("Quantity : " + roomQuantity);				
				String lastname = request.getParameter("lastname");
				String firstname = request.getParameter("firstname");
				String email = request.getParameter("email");
				String mobileNumber = request.getParameter("mobileNumber");
				String address = request.getParameter("address");
				String cp = request.getParameter("cp");
				String city = request.getParameter("city");
				String state = request.getParameter("state");
				String country = request.getParameter("country");

				
				if (roomQuantity <= 0) {
					roomQuantity = 1;
				}
				Reservation reservationModel = new Reservation();
				reservationModel.setRoomId(Integer.parseInt(roomId));
				reservationModel.setUid(auth.getIduser());
				reservationModel.setQuantity(roomQuantity);
				reservationModel.setPrice(priceDAO);
				reservationModel.setEmail(email);
				reservationModel.setLastname(lastname);
				reservationModel.setResaFirstname(firstname);
				reservationModel.setMobileNumber(mobileNumber);
				reservationModel.setAddress(address);
				reservationModel.setCp(cp);
				reservationModel.setCity(city);
				reservationModel.setState(state);
				reservationModel.setCountry(country);


						
				ReservationDAO reservationDao = new ReservationDAO(DbCon.getConnection());
				boolean result = reservationDao.insertReservationPending(reservationModel);
				if(result) {
					response.sendRedirect("check-out.jsp");
				} else {
					out.println("Order failed");
				}
				
				}else {
					response.sendRedirect("info-check-out.jsp");
				}
		
		} catch (Exception e) {
			e.printStackTrace();
		}		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
