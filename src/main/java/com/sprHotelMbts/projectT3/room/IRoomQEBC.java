package com.sprHotelMbts.projectT3.room;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IRoomQEBC {


	RoomDTO sltOne(String hotelTel);
	
	List<RoomDTO> sltAll(@Param("hotelNo") String hotelNo, @Param("value") String value,@Param("start")  int start, @Param("cnt") int cnt);
	
	List<RoomDTO> sltName(@Param("hotelNo") String hotelNo,  @Param("value") String value,@Param("start") int start, @Param("cnt") int cnt);
	
	List<RoomDTO> sltOneAll(@Param("hotelNo") String hotelNo, @Param("start") int start, @Param("cnt") int cnt);
	
	String serialNo(String hotelNo);


}
