package com.sprHotelMbts.projectT3.hotPlace;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface IHotPlaceSVC {
	

	String sltMulti(String div, String value, int pageNo, Model model);
	String sltAll(int pageNo,Model model);
	String insert(HotDTO hotDto, Model model,MultipartFile file);
	String update(HotDTO hotDto, Model model);
	String delete(String hotNo, Model model);

}
