package com.sprHotelMbts.projectT3.room;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;


public interface IRoomSVC {
	
/*	RoomDTO sltOneNo(Model model, String roomNo);
	
	RoomDTO sltOneNm(Model model, String roomNm);*/

	String insert(Model model, RoomDTO roomDto, MultipartFile file);
	
	String delete(Model model, String roomNo);
	
	String update(Model model, RoomDTO roomDto, MultipartFile file);
	
	String adSltMulti(String hotelNo, Model model, String div, String value, int page);
	
	String mbrSltMulti(Model model, String value, int page);
	
	String sltCstRum(Model model, String roomNo,String custNo);
}
