package com.sprHotelMbts.projectT3.hotel;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;



public interface IHotelSVC {
	
	HotelDTO sltOne(Model model, String hotelNo);

	String insert(Model model, HotelDTO hotelDto, MultipartFile file);
	
	String delete(Model model, String hotelNo);
	
	String update(Model model, HotelDTO hotelDto, MultipartFile file);
	
	String adSltMulti(Model model, String div, String value, int page);
	
	String mbrSltMulti(Model model, String value, int page);
	
	
	String mbrSltDateMulti(Model model, String value, int page,String date);
	
	List<HotelEvlDTO> mbrSltDateMultiAjax(Model model, String value, int page,String date);
	
	String mainSltMulti(Model model, HttpSession session, String value, int page);
	
	String mbrSltRoom(Model model, String page, String hotelNo);
	
}
