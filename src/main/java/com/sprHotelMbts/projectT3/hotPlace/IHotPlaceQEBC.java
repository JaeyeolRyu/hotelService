package com.sprHotelMbts.projectT3.hotPlace;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IHotPlaceQEBC {

	List<HotDTO> sltAll(@Param("start")int start, @Param("cnt")int cnt);
	List<HotDTO> sltName(@Param("value")String value, @Param("start")int start, @Param("cnt")int cnt);
	List<HotDTO> sltAddress(@Param("value")String value, @Param("start")int start, @Param("cnt")int cnt);
	String serialNo();
	
}
