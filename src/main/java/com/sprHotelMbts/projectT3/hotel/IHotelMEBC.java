package com.sprHotelMbts.projectT3.hotel;

import org.apache.ibatis.annotations.Param;

public interface IHotelMEBC {

	//관리자 호텔등록시 호텔이름으로 단건조회
	//클래스다이어그램 호텔관리MEBC에 호텔NO로 되어있음 시퀀스랑 다름
	HotelDTO hotelSltOneMEBC(@Param("hotelNo")String hotelNo);
	
	void hotelInsert(HotelDTO hotelDto);
	
	void hotelUpdate(HotelDTO hotelDto);
	
	void hotelDelete(String hotelNo);
		
}
