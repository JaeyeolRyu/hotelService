package com.sprHotelMbts.projectT3.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IEvlQEBC {

	List<AdEvlDTO> sltCustEvl(@Param("value")String value, @Param("start")int start, @Param("cnt")int cnt);
	
	List<AdEvlDTO> sltHotelEvl(@Param("value")String value, @Param("start")int start, @Param("cnt")int cnt);

	List<AdEvlDTO> sltEvl(@Param("custNo")String custNo);
	
	String serialNoEvl();
}
