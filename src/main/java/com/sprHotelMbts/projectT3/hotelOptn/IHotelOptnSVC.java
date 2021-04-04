package com.sprHotelMbts.projectT3.hotelOptn;

import org.springframework.ui.Model;

public interface IHotelOptnSVC {

	String insert(Model model, HotelOptnDTO hotelOptnDto);
	
//	String update(Model model, HotelOptnDTO hotelOptnDto);
	
	String delete(Model model, String hotelNo, String hotelOptnNo);
	
	String sltAll(Model model, String hotelNo);
	
	
}
