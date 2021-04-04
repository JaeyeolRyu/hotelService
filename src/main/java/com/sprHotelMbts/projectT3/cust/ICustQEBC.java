package com.sprHotelMbts.projectT3.cust;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ICustQEBC {

	CustDTO sltOneEmail(@Param("custEmail")String custEmail);
	
	CustDTO sltOneFind(@Param("custName")String custName, @Param("custTel")String custTel);
	
	List<CustDTO> sltName(@Param("value")String value, @Param("start")int start, @Param("cnt")int cnt);
	
	List<CustDTO> sltEmail(@Param("value")String value, @Param("start")int start, @Param("cnt")int cnt);
	
	String serialNoMbr();
	
	String serialNoNonMbr();
	
}
