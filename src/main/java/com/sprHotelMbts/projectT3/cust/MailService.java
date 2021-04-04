package com.sprHotelMbts.projectT3.cust;


public interface MailService {

	public boolean send(String subject, String text, String from, String to);
}

