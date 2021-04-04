package com.sprHotelMbts.projectT3.reservation;

import org.springframework.ui.Model;

import com.sprHotelMbts.projectT3.cust.CustDTO;

public interface IResveSVC {
	
	String sltMulti(Model model, String value, String pageNo);
	String sltCustNoAll(Model model, String custNo,String pageNo);
	String insert(Model model, ResveDTO resveDto, CustDTO custDto);
	String delete(Model model, String resveNo);
	String cancel(Model model, String resveDto, String custNo);

}
