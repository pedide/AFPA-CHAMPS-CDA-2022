package com.hotelmvc.model;

public class Reservation extends Room {

	private int reservationId;
	private int uid;
	private int roomId;
	private int quantity;
	private int numReservation;
	private String dateArrival;
	private String dateDeparture;
	private Double price;	
	private String date;
	private Double total;
	private String email;
	private String lastname;
	private String resaFirstname;
	private String mobileNumber;
	private String address;
	private String cp;
	private String city;
	private String state;
	private String country;	
	private String checkInFirstname;
	private String checkInLastname;
	private String checkInEmail;
	private String checkInMobileNumber;	
	
	
	
	public Reservation() {
		super();
	}


	public Reservation(int reservationId, int uid, int roomId, int quantity, Double price, String date, Double total, String email) {
		super();
		this.reservationId = reservationId;
		this.uid = uid;
		this.roomId = roomId;
		this.quantity = quantity;
		this.price = price;
		this.date = date;
		this.total = total;
		this.email = email;
	}






	public Reservation(int reservationId, int uid, int roomId, int quantity, int numReservation, String dateArrival,
			String dateDeparture, Double price, String date, Double total, String email, String lastname,
			String resaFirstname, String mobileNumber, String address, String cp, String city, String state,
			String country, String checkInFirstname, String checkInLastname, String checkInEmail,
			String checkInMobileNumber) {
		super();
		this.reservationId = reservationId;
		this.uid = uid;
		this.roomId = roomId;
		this.quantity = quantity;
		this.numReservation = numReservation;
		this.dateArrival = dateArrival;
		this.dateDeparture = dateDeparture;
		this.price = price;
		this.date = date;
		this.total = total;
		this.email = email;
		this.lastname = lastname;
		this.resaFirstname = resaFirstname;
		this.mobileNumber = mobileNumber;
		this.address = address;
		this.cp = cp;
		this.city = city;
		this.state = state;
		this.country = country;
		this.checkInFirstname = checkInFirstname;
		this.checkInLastname = checkInLastname;
		this.checkInEmail = checkInEmail;
		this.checkInMobileNumber = checkInMobileNumber;
	}


	public int getReservationId() {
		return reservationId;
	}


	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}

	

	public int getRoomId() {
		return roomId;
	}


	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getNumReservation() {
		return numReservation;
	}


	public void setNumReservation(int numReservation) {
		this.numReservation = numReservation;
	}


	public String getDateArrival() {
		return dateArrival;
	}


	public void setDateArrival(String dateArrival) {
		this.dateArrival = dateArrival;
	}


	public String getDateDeparture() {
		return dateDeparture;
	}


	public void setDateDeparture(String dateDeparture) {
		this.dateDeparture = dateDeparture;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public Double getTotal() {
		return total;
	}


	public void setTotal(Double total) {
		this.total = total;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getResaFirstname() {
		return resaFirstname;
	}


	public void setResaFirstname(String resaFirstname) {
		this.resaFirstname = resaFirstname;
	}


	public String getMobileNumber() {
		return mobileNumber;
	}


	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCp() {
		return cp;
	}


	public void setCp(String cp) {
		this.cp = cp;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getCheckInFirstname() {
		return checkInFirstname;
	}


	public void setCheckInFirstname(String checkInFirstname) {
		this.checkInFirstname = checkInFirstname;
	}


	public String getCheckInLastname() {
		return checkInLastname;
	}


	public void setCheckInLastname(String checkInLastname) {
		this.checkInLastname = checkInLastname;
	}


	public String getCheckInEmail() {
		return checkInEmail;
	}


	public void setCheckInEmail(String checkInEmail) {
		this.checkInEmail = checkInEmail;
	}


	public String getcheckInMobileNumber() {
		return checkInMobileNumber;
	}


	public void setCheckInMobileNumber(String checkInMobileNumber) {
		this.checkInMobileNumber = checkInMobileNumber;
	}


	@Override
	public String toString() {
		return "Reservation [uid = " + uid + ", quantity = " + quantity + ", Date = " + date + " ]";
	}



	
}
