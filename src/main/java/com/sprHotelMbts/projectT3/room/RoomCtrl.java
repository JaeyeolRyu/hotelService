package com.sprHotelMbts.projectT3.room;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class RoomCtrl {

	@Autowired
	private IRoomSVC roomSvc;
	
	String viewPage;
	
	@RequestMapping("AdRoom")
	public String AdRoom()
	{	
		return "AdRoom";
	}
	
	@RequestMapping(value = "adSltMulti", produces = "application/text;charset=UTF-8")
	//@RequestMapping("adSltMulti")
	public String sltMulti(@ModelAttribute("hotelNo") String hotelNo, Model model, @ModelAttribute("div") 
	String div, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{	
		viewPage = roomSvc.adSltMulti(hotelNo, model, div, value, page);
		model.addAttribute("PAGENO", page);
		return "AdRoom";
	}
	
	@RequestMapping(value = "roomInsert", produces = "application/text;charset=UTF-8")
	//@RequestMapping("roomInsert")
	public String insert( Model model, RoomDTO roomDto, @RequestParam("file") MultipartFile file)
	{	
		viewPage = roomSvc.insert(model, roomDto, file);
		
		return viewPage;
	}
	
	@RequestMapping("roomUpdate")
	public String update(@Param("roomNo") String roomNo, Model model, RoomDTO roomDto, @RequestParam("file") MultipartFile file)
	{	
		viewPage = roomSvc.update(model, roomDto, file);
		
		return viewPage;
	}
	
	@RequestMapping("roomDelete")
	public String delete(Model model, String roomNo)
	{	
		viewPage = roomSvc.delete(model, roomNo);
		
		return "AdRoom";
	}
	
	
	@RequestMapping("resvePage")//결제화면 이동
	public String sltCstRum(Model model,@ModelAttribute("ROOMNO") String roomNo,@ModelAttribute("CUSTNO") String custNo,
			 @ModelAttribute("CHECKIN") String CHECKIN, @ModelAttribute("CHECKOUT") String CHECKOUT)throws Exception {
		model.addAttribute("CHECKIN",CHECKIN);
		model.addAttribute("CHECKOUT",CHECKOUT);
		
		
		roomSvc.sltCstRum(model, roomNo, custNo);
		return "resve";
	}
}
