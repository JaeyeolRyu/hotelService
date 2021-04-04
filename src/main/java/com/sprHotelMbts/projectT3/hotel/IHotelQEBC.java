package com.sprHotelMbts.projectT3.hotel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sprHotelMbts.projectT3.room.RoomDTO;
import com.sprHotelMbts.projectT3.roomOptn.RoomOptnJoinDTO;

public interface IHotelQEBC {

	HotelDTO hotelSltOneQEBC(String hotelTel);
	
	List<HotelDTO> hotelSltAddress(@Param("value") String value,@Param("start")  int start, @Param("cnt") int cnt);
	
	List<HotelDTO> hotelSltName(@Param("value") String value,@Param("start") int start, @Param("cnt") int cnt);
	
	List<HotelDTO> hotelSltSearch(@Param("value") String value,@Param("start") int start, @Param("cnt") int cnt);
	
	List<RoomDTO> roomSltMulti(@Param("hotelNo") String hotelNo, @Param("start") int start, @Param("cnt") int cnt);
	
	List<RoomOptnJoinDTO> roomOptnSltMulti(@Param("roomNo") String roomNo);
	
	List<HotelEvlDTO> sltHotelEvl(@Param("value") String value,@Param("start") int start, @Param("cnt") int cnt);
					 
	String hotelSerialNo();
}
