package com.sprHotelMbts.projectT3.review;

public interface IEvlMEBC {

	AdEvlDTO sltOne(String evlNo);
	
	EvlDTO sltOneUpdate(String evlNo);
	
	void insert(EvlDTO evlDto);
	
	void update(EvlDTO evlDto);
	
	void delete(String evlNo);
	
	
}
