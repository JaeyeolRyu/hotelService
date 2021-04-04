package com.sprHotelMbts.projectT3.roomOptn;

import org.apache.ibatis.annotations.Param;

public interface IRoomOptnMEBC {

	RoomOptnDTO sltOne(@Param("roomNo") String roomNo, @Param("roomOptnNo") String roomOptnNo);
	
	void insert(RoomOptnDTO roomOptnDto);
	
//	void update(RoomOptnDTO roomOptnDto);
	
	int delete(@Param("roomNo") String roomNo, @Param("roomOptnNo") String roomOptnNo);
}
