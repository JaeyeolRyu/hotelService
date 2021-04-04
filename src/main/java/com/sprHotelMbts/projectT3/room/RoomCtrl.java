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
	
/*	@RequestMapping(value = "/")
	public String home() 
	{
		return "redirect:/main.jsp";
	}*/
	
	@RequestMapping("AdRoom")
	public String AdRoom()
	{	
		System.out.println("여기는 테스트jsp");
		return "AdRoom";
	}
	
	@RequestMapping(value = "adSltMulti", produces = "application/text;charset=UTF-8")
	//@RequestMapping("adSltMulti")
	public String sltMulti(@ModelAttribute("hotelNo") String hotelNo, Model model, @ModelAttribute("div") 
	String div, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{	
		System.out.println("-----------------------------------------");
		System.out.println("여기 재열님께서 친히 행차하셨으나 해결못한 시스아웃" + hotelNo);
		System.out.println("room 다건조회 컨트롤러 진입!");
		viewPage = roomSvc.adSltMulti(hotelNo, model, div, value, page);
		model.addAttribute("PAGENO", page);
		System.out.println("room 다건조회 컨트롤러 탈출직전!");
		return "AdRoom";
	}
	
	@RequestMapping(value = "roomInsert", produces = "application/text;charset=UTF-8")
	//@RequestMapping("roomInsert")
	public String insert( Model model, RoomDTO roomDto, @RequestParam("file") MultipartFile file)
	{	
		System.out.println("-----------------------------------------");
		System.out.println("room Insert 컨트롤러 진입!@!");
		System.out.println("roomInsert진입후 dto  -> " + roomDto.toString());
		viewPage = roomSvc.insert(model, roomDto, file);
		System.out.println("room Insert 컨트롤러 탈출직전!");
		
		return viewPage;
	}
	
	@RequestMapping("roomUpdate")
	public String update(@Param("roomNo") String roomNo, Model model, RoomDTO roomDto, @RequestParam("file") MultipartFile file)
	{	
		System.out.println(roomNo + "sssssssssss");
		System.out.println("-----------------------------------------");
		System.out.println("room update 컨트롤러 진입!");
		System.out.println(roomDto.toString());
		viewPage = roomSvc.update(model, roomDto, file);
		System.out.println("room update 컨트롤러 탈출직전!");
		
		return viewPage;
	}
	
	@RequestMapping("roomDelete")
	public String delete(Model model, String roomNo)
	{	
		System.out.println("-----------------------------------------");
		System.out.println("room delete 컨트롤러 진입!");
		
		viewPage = roomSvc.delete(model, roomNo);
		
		System.out.println("room delete 컨트롤러 탈출직전!");
		
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
