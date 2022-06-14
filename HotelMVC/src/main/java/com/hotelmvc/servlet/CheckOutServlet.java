package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.ReservationDAO;

import com.hotelmvc.model.Reservation;
import com.hotelmvc.model.User;


@WebServlet("/check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

			Date date = new Date();
			User auth = (User)request.getSession().getAttribute("auth");		
			Double total = Double.parseDouble(request.getParameter("id"));

			HttpSession session = request.getSession();
			String t =  (String) session.getAttribute("total2");
			System.out.println("total servlet : " + t) ;
			ReservationDAO resaDao = new ReservationDAO(DbCon.getConnection());
			Reservation resa = new Reservation();
			Reservation rPDAO = resaDao.getSingleResa((auth.getIduser()));

			String to = (String) request.getAttribute("total");

			
			if(auth!=null) {
				int uidP = rPDAO.getUid();
				int roomIdP = rPDAO.getRoomId();
				int qtyP = rPDAO.getQuantity();
				int numResaP = rPDAO.getNumReservation();
				String dateArrivalP = rPDAO.getDateArrival();
				String dateDeparture = rPDAO.getDateDeparture();
				Double priceP = rPDAO.getPrice();
				Double totalP = rPDAO.getTotal();
				String emailP = rPDAO.getEmail();
				String lastnameP = rPDAO.getLastname();
				String firstnameP = rPDAO.getResaFirstname();
				String mobileNumberP = rPDAO.getMobileNumber();
				String addressP = rPDAO.getAddress();
				String cpP = rPDAO.getCp();
				String cityP = rPDAO.getCity();
				String stateP = rPDAO.getState();
				String countryP = rPDAO.getCountry();
				String firstnameCIP = rPDAO.getCheckInFirstname();
				String lastnameCIP = rPDAO.getCheckInLastname();
				String emaiCIP = rPDAO.getCheckInEmail();
				String mobileNumberCIP = rPDAO.getcheckInMobileNumber();
				
				ReservationDAO rDao = new ReservationDAO(DbCon.getConnection());


				if (qtyP <= 0) {
					qtyP = 1;
				}
				Reservation reservationModel = new Reservation();
				reservationModel.setRoomId(roomIdP);
				reservationModel.setUid(auth.getIduser());
				reservationModel.setQuantity(qtyP);
				reservationModel.setPrice(priceP);
				reservationModel.setTotal(total);
				reservationModel.setEmail(emailP);
				reservationModel.setLastname(lastnameP);
				reservationModel.setResaFirstname(firstnameP);
				reservationModel.setMobileNumber(mobileNumberP);
				reservationModel.setAddress(addressP);
				reservationModel.setCp(cpP);
				reservationModel.setCity(cityP);
				reservationModel.setState(stateP);
				reservationModel.setCountry(countryP);
				reservationModel.setCheckInFirstname(firstnameCIP);
				reservationModel.setCheckInLastname(lastnameCIP);
				reservationModel.setCheckInEmail(emaiCIP);
				reservationModel.setCheckInMobileNumber(mobileNumberCIP);
						
				ReservationDAO reservationDao = new ReservationDAO(DbCon.getConnection());
				boolean result = reservationDao.insertReservationOrder(reservationModel);
				if(result) {
					response.sendRedirect("home.jsp");
					ReservationDAO reservationDao2 = new ReservationDAO(DbCon.getConnection());
					reservationDao2.deleteReservationPending1(uidP);

				} else {
					System.out.println("Order failed");
					response.sendRedirect("check-out.jsp");

				}
				
				}
	
		} catch (Exception e) {
			e.printStackTrace();
		}		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
