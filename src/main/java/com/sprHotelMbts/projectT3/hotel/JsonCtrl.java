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
		System.out.println("여기는 호텔 JSON");
		System.out.println(hotelNo);
		HotelDTO dto = hotelSvc.sltOne(model, hotelNo);
		System.out.println("1");
		JSONObject jsonObj = new JSONObject();
		System.out.println("2");
		jsonObj.put("NO", dto.getHotelNo());
		jsonObj.put("NM", dto.getHotelNm());
		jsonObj.put("ADDRESS", dto.getHotelAddress());
		jsonObj.put("TEL", dto.getHotelTel());
		jsonObj.put("EXPLAIN", dto.getHotelExplain());
		jsonObj.put("HOMEPAGE", dto.getHotelHomepage());
		jsonObj.put("PHOTO", dto.getHotelPhoto());
		String jsonOut = jsonObj.toString();
		System.out.println("==1" + jsonOut);
//		model.addAttribute("HOTELNO",dto.getHotelNo());
		
		return jsonOut;
	}
	
	@RequestMapping(value = "jsonR", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String roomRow(@ModelAttribute("roomNo") String roomNo ) throws Exception
	{
		System.out.println("여기는 객실 JSON");
		System.out.println(roomNo + "  eeeeeeeeeeeeeeee");
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
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}	
	
	
	@RequestMapping(value = "jsonHD", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void hotelRowDelete(@ModelAttribute("hotelNo") String hotelNo, Model model ) throws Exception
	{
		
		System.out.println(hotelNo);
		System.out.println("여기는 호텔삭제 JSON 시작");
		hotelSvc.delete(model, hotelNo);
		System.out.println("여기는 호텔삭제 JSON 종료");
		
		
		return;
	}
	
	@RequestMapping(value = "jsonRoomDele", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void RoomRowDelete(@ModelAttribute("roomNo") String roomNo , Model model) throws Exception
	{
		System.out.println("여기는 객실 삭제 JSON");
		System.out.println(roomNo);
		roomSvc.delete(model, roomNo);
		System.out.println("여기는 객실 삭제 JSON 종료");
		return;
	}
	
	@RequestMapping(value = "jsonHU", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String hotelRowUpdate(@ModelAttribute("hotelNo") String hotelNo ) throws Exception
	{
		System.out.println("여기는 호텔 업데이트 JSON");
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
		System.out.println("====" + jsonOut);
		
		return jsonOut;

	}
	
	@RequestMapping(value = "jsonRM", produces = "application/text;charset=UTF-8")
	
	public String sltMulti(@ModelAttribute("hotelNo") String hotelNo, Model model, @ModelAttribute("div") 
	String div, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{	
		System.out.println(hotelNo);
		System.out.println("room 다건조회 컨트롤러 진입!");
		roomSvc.adSltMulti(hotelNo, model, div, value, page);
		
		model.addAttribute("PAGENO", page);
		System.out.println("room 다건조회 컨트롤러 탈출직전!");
		return "AdRoom";
	}
	
	@RequestMapping(value = "jsonRoomAdSltMulti", produces = "application/text;charset=UTF-8")
	
	public String roomAdSltMulti(String hotelNo, Model model, @ModelAttribute("div") 
	String div, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{	
		System.out.println(hotelNo);
		System.out.println("호텔에서 room버튼 선택시 다건조회 컨트롤러 진입!");
		roomSvc.adSltMulti(hotelNo, model, div, value, page);
		
		model.addAttribute("PAGENO", page);
		model.addAttribute("hotelNo",hotelNo);
		System.out.println("호텔에서 room버튼 선택시 다건조회 컨트롤러 탈출직전!");
		return "AdRoom";
	}
	
@RequestMapping(value = "jsonHotelOptn2", produces = "application/text;charset=UTF-8")
@ResponseBody
	public String hotelOptn(@ModelAttribute("hotelNo") String hotelNo, Model model ) throws Exception	{	
		
		System.out.println("호텔에서 호텔옵션버튼 선택시 다건조회 컨트롤러 진입!");
		System.out.println("여기는 왜 안 나올까?");
		System.out.println("호텔번호  -> " + hotelNo);
		
		HotelOptnDTO hotelOptnDto = new HotelOptnDTO();
		
		
		String a = hotelOptnSvc.sltAll(model, hotelNo);
		System.out.println(a + "aaaaaaaaaaaa");
		model.addAttribute("hotelNo", hotelNo);
		System.out.println("tostring " + hotelOptnDto.toString());
		System.out.println("호텔에서 room버튼 선택시 다건조회 컨트롤러 탈출직전!");
		return a;
	}

@RequestMapping(value = "jsonRoomOptn1", produces = "application/text;charset=UTF-8")
@ResponseBody
	public String roomOptn(@ModelAttribute("roomNo") String roomNo, Model model ) throws Exception	{	
		System.out.println("여기는 객실옵션 JSON");
		RoomOptnDTO roomOptnDto = new RoomOptnDTO();
		
		
		String a = roomOptnSvc.sltAll(model, roomNo);
		
		System.out.println(a + "aaaaaaaaaaaa");
		model.addAttribute("hotelNo", roomNo);
		System.out.println("tostring " + roomOptnDto.toString());
		System.out.println("객실에서 옵션버튼 선택시 다건조회 컨트롤러 탈출직전!");
		return a;
	}
}