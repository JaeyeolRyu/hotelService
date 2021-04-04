package com.sprHotelMbts.projectT3.reservation;

public interface IResveMEBC {

	
	ResveDTO sltOne(String resveNo);
	void insert(ResveDTO resveDto);
	void delete(String resveNo);
	void cancel(ResveDTO resveDto);

}
