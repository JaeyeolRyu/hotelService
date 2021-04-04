package com.sprHotelMbts.projectT3.room;

import org.apache.ibatis.annotations.Param;


public interface IRoomMEBC {

	RoomDTO sltOne(@Param("roomNo")String roomNo);
	
	void insert(RoomDTO roomDto);
	
	void update(RoomDTO roomDto);
	
	void delete(String roomNo);
}
