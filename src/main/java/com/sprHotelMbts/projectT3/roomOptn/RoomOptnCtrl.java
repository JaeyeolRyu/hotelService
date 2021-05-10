package com.sprHotelMbts.projectT3.roomOptn;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RoomOptnCtrl {

	@Autowired
	private IRoomOptnSVC roomOptnSvc;
	
	String viewPage;
	
	@RequestMapping("adRoomOptn")
	public String adRoomOptn(@Param("roomOptn") String roomOptn, @Param("value") String value, @Param("PAGENO") String page, @Param("roomNo") String roomNo, Model model)
	{
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("roomOptn", roomOptn);
		return "AdRoomOptn";
	}
	
	@RequestMapping("roomOptnInsert")
	public String insert(@Param("roomNo") String roomNo, @ModelAttribute("roomOptnNo") String roomOptnNo, Model model, HttpServletRequest request)
	{
		
		RoomOptnDTO roomOptnDto = new RoomOptnDTO();
		
		String[] arrayParam = request.getParameterValues("check");
		
		roomOptnDto.setRoomNo(roomNo);
		
		for( int i = 0; i < arrayParam.length; i++)
		{
			roomOptnDto.setRoomOptnNo(arrayParam[i]);
			roomOptnSvc.insert(model, roomOptnDto);
			
		}
		return "closePage";
	}
	
	@RequestMapping("roomOptnDelete")
	@ResponseBody
	public Map<String, Object> delete(Model model, @ModelAttribute("roomNo") String roomNo, @ModelAttribute("roomOptnNo") String roomOptnNo )
	{
		Map<String, Object> map = new HashMap<String, Object>();
		String res = roomOptnSvc.delete(model, roomNo, roomOptnNo);
		
		map.put("RESULT", res);
		
		return map;
	}
	
	
}
