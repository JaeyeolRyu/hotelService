package com.sprHotelMbts.projectT3.hotelOptn;

import org.apache.ibatis.annotations.Param;

public interface IHotelOptnMEBC {

	HotelOptnDTO sltOne(@Param("hotelNo") String hotelNo, @Param("hotelOptnNo") String hotelOptnNo);
	
	void insert(HotelOptnDTO hotelOptnDto);
	
//	void update(HotelOptnDTO hotelOptnDto);
	
	void delete(@Param("hotelNo") String hotelNo, @Param("hotelOptnNo") String hotelOptnNo);
}
