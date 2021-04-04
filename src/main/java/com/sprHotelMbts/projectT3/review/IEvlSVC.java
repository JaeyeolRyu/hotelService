package com.sprHotelMbts.projectT3.review;

import org.springframework.ui.Model;

public interface IEvlSVC {

	AdEvlDTO sltOne(String evlNo, Model model);
	
	String delete(String evlNo, Model model);
	
	String sltMulti(String div, String value, int pageNo, Model model);
	
	String sltEvl(String custNo, Model model);
	
	String evlInsert(EvlDTO dto, Model model);
	
	String evlUpdate(AdEvlDTO dto, Model model);
}
