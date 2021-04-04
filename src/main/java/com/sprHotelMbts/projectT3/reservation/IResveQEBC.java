package com.sprHotelMbts.projectT3.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IResveQEBC {

	 List<ResveDTO> sltCustNo(@Param("custNo")String custNo, @Param("startNo")int startNo, @Param("cnt")int cnt);
	 List<ResveDTO> sltName(String custName, int startNo, int cnt);
	 List<ResveDTO> sltPayDate(String payDate, int startNo, int cnt);
	// List<ResveDTO> sltCustNoAll(String payDate, int startNo, int cnt);
	 List<ResveDTO> sltDate(String Checkin, String CheckOut, int startNo, int cnt);
	 String serialNo();
}
