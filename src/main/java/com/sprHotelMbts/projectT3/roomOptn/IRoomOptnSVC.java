package com.sprHotelMbts.projectT3.roomOptn;

import org.springframework.ui.Model;

public interface IRoomOptnSVC {
	
	String insert(Model model, RoomOptnDTO roomOptnDto);
	
//	String update(Model model, RoomOptnDTO roomOptnDto);
	
	String delete(Model model, String roomNo, String roomOptnNo);
	
	String sltAll(Model model, String roomNo);
}
