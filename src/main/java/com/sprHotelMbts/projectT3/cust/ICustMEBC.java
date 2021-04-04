package com.sprHotelMbts.projectT3.cust;


public interface ICustMEBC {

	CustDTO sltOneNo(String custNo);
	
	void insert(CustDTO custDto);
	
	void update(CustDTO custDto);

	void cancel(String custNo);
	
	void delete(String custNo);
	
	void adUpdate(CustDTO custDto);
	
}
