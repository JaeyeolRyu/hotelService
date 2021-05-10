package com.sprHotelMbts.projectT3.hotel;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sprHotelMbts.projectT3.hotelOptn.HotelOptnDTO;
import com.sprHotelMbts.projectT3.hotelOptn.IHotelOptnSVC;
import com.sprHotelMbts.projectT3.room.IRoomMEBC;
import com.sprHotelMbts.projectT3.room.IRoomSVC;
import com.sprHotelMbts.projectT3.room.RoomDTO;
import com.sprHotelMbts.projectT3.roomOptn.IRoomOptnSVC;
import com.sprHotelMbts.projectT3.roomOptn.RoomOptnDTO;

@Controller
public class JsonCtrl {

	@Autowired
	private IHotelMEBC hotelMebc;
	
	@Autowired
	private IRoomMEBC roomMebc;
	
	@Autowired
	private IHotelSVC hotelSvc;
	
	@Autowired
	private IRoomSVC roomSvc;
	
	@Autowired
	private IHotelOptnSVC hotelOptnSvc;
	
	@Autowired
	private IRoomOptnSVC roomOptnSvc;
	
	public JsonCtrl() {

	}
	
	@RequestMapping(value = "jsonHotelSlt", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String hotelRow(@ModelAttribute("hotelNo") String hotelNo, Model model ) throws Exception
	{
		HotelDTO dto = hotelSvc.sltOne(model, hotelNo);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("NO", dto.getHotelNo());
		jsonObj.put("NM", dto.getHotelNm());
		jsonObj.put("ADDRESS", dto.getHotelAddress());
		jsonObj.put("TEL", dto.getHotelTel());
		jsonObj.put("EXPLAIN", dto.getHotelExplain());
		jsonObj.put("HOMEPAGE", dto.getHotelHomepage());
		jsonObj.put("PHOTO", dto.getHotelPhoto());
		String jsonOut = jsonObj.toString();
//		model.addAttribute("HOTELNO",dto.getHotelNo());
		
		return jsonOut;
	}
	
	@RequestMapping(value = "jsonR", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String roomRow(@ModelAttribute("roomNo") String roomNo ) throws Exception
	{
		RoomDTO dto = roomMebc.sltOne(roomNo);
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("ROOM_NO", dto.getRoomNo());
		jsonObj.put("HOTEL_NO", dto.getHotelNo());
		jsonObj.put("ROOM_NM", dto.getRoomNm());
		jsonObj.put("ROOM_PC", dto.getRoomPc());
		jsonObj.put("R_HEADCOUNT", dto.getrHeadCount());
		jsonObj.put("ROOM_PHOTO", dto.getRoomPhoto());
		jsonObj.put("ROOM_SIZE", dto.getRoomSize());
		jsonObj.put("S_COUNT", dto.getsCount());
		//객실수
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}	
	
	
	@RequestMapping(value = "jsonHD", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void hotelRowDelete(@ModelAttribute("hotelNo") String hotelNo, Model model ) throws Exception
	{
		
		hotelSvc.delete(model, hotelNo);
		
		return;
	}
	
	@RequestMapping(value = "jsonRoomDele", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void RoomRowDelete(@ModelAttribute("roomNo") String roomNo , Model model) throws Exception
	{
		roomSvc.delete(model, roomNo);
		return;
	}
	
	@RequestMapping(value = "jsonHU", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String hotelRowUpdate(@ModelAttribute("hotelNo") String hotelNo ) throws Exception
	{
		HotelDTO dto = hotelMebc.hotelSltOneMEBC(hotelNo);

		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("NO", dto.getHotelNo());
		jsonObj.put("NM", dto.getHotelNm());
		jsonObj.put("ADDRESS", dto.getHotelAddress());
		jsonObj.put("TEL", dto.getHotelTel());
		jsonObj.put("EXPLAIN", dto.getHotelExplain());
		jsonObj.put("HOMEPAGE", dto.getHotelHomepage());
		jsonObj.put("PHOTO", dto.getHotelPhoto());
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;

	}
	
	@RequestMapping(value = "jsonRM", produces = "application/text;charset=UTF-8")
	
	public String sltMulti(@ModelAttribute("hotelNo") String hotelNo, Model model, @ModelAttribute("div") 
	String div, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{	
		roomSvc.adSltMulti(hotelNo, model, div, value, page);
		
		model.addAttribute("PAGENO", page);
		return "AdRoom";
	}
	
	@RequestMapping(value = "jsonRoomAdSltMulti", produces = "application/text;charset=UTF-8")
	
	public String roomAdSltMulti(String hotelNo, Model model, @ModelAttribute("div") 
	String div, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{	
		roomSvc.adSltMulti(hotelNo, model, div, value, page);
		
		model.addAttribute("PAGENO", page);
		model.addAttribute("hotelNo",hotelNo);
		return "AdRoom";
	}
	
@RequestMapping(value = "jsonHotelOptn2", produces = "application/text;charset=UTF-8")
@ResponseBody
	public String hotelOptn(@ModelAttribute("hotelNo") String hotelNo, Model model ) throws Exception	{	
		
		HotelOptnDTO hotelOptnDto = new HotelOptnDTO();
		
		
		String a = hotelOptnSvc.sltAll(model, hotelNo);
		model.addAttribute("hotelNo", hotelNo);
		return a;
	}

@RequestMapping(value = "jsonRoomOptn1", produces = "application/text;charset=UTF-8")
@ResponseBody
	public String roomOptn(@ModelAttribute("roomNo") String roomNo, Model model ) throws Exception	{	
		RoomOptnDTO roomOptnDto = new RoomOptnDTO();
		
		String a = roomOptnSvc.sltAll(model, roomNo);
		
		model.addAttribute("hotelNo", roomNo);
		return a;
	}
}