package com.sprHotelMbts.projectT3.hotPlace;

public interface IHotPlaceMEBC {

	HotDTO sltOne(String hotNo);
	void insert(HotDTO hotDto);
	void update(HotDTO hotDto);
	void delete(String hotNo);
	
	
}
