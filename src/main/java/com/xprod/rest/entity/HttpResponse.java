package com.xprod.rest.entity;

import java.util.Date;

import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.annotation.JsonFormat;

public class HttpResponse {
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="MM-dd-yyyy hh:mm:ss", timezone="GMT+2") // parametrage de l'affichage de la date
	private Date timeStamp;
	private int httpStatusCode; //200, 201, 400, 401, 500 ...
	private HttpStatus httpstatus;
	private String reason;
	private String message;
	
	/*Votre page ressemblera à ca /
	 * { code:200, httpStatus:"OK",
	 *	reason:"OK", message:"your request "}*/

	
	
	public HttpResponse() {
		super();
	}

	public HttpResponse(int httpStatusCode, HttpStatus httpstatus, String reason, String message) {
		super();
		this.timeStamp = new Date();
		this.httpStatusCode = httpStatusCode;
		this.httpstatus = httpstatus;
		this.reason = reason;
		this.message = message;
	}

	
	public Date getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

	public int getHttpStatusCode() {
		return httpStatusCode;
	}

	public void setHttpStatusCode(int httpStatusCode) {
		this.httpStatusCode = httpStatusCode;
	}

	public HttpStatus getHttpstatus() {
		return httpstatus;
	}

	public void setHttpstatus(HttpStatus httpstatus) {
		this.httpstatus = httpstatus;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
}
