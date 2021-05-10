package com.sprHotelMbts.projectT3.hotel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.sprHotelMbts.projectT3.hotelOptn.IHotelOptnSVC;

@Controller
public class HotelCtrl {

	
	@Autowired
	private IHotelSVC hotelSvc;
	
	@Autowired
	private IHotelOptnSVC hotelOptnSvc;
	
	String viewPage;
	
	@Transactional
	@RequestMapping(value = "/")
	public String home(Model model, HttpSession session) {
		String value ="%";
		int page = 1;
		hotelSvc.mainSltMulti(model, session,value, page);
		return "redirect:/index.jsp";
	}
	//main 페이지
	
	@RequestMapping("main")
	public String mainPage(Model model, HttpSession session) {
		String value ="%";
		int page = 1;
		hotelSvc.mainSltMulti(model, session,value, page);
		return "redirect:/index.jsp";
	}
	
	
	//관리자 호텔관리 화면이동
	@RequestMapping("AdHotel")
	public String adHotelView()
	{	
		return "AdHotel";
	}
	
	//관리자 호텔 등록 //ui에 등록버튼없음
	@RequestMapping("hotelInsert")
	public String insert(Model model, HotelDTO hotelDto, @RequestParam("file") MultipartFile file)
	{	
		 hotelSvc.insert(model, hotelDto,file);
		
		return viewPage;
	}
	
	@RequestMapping("hotelUpdate")
	public String update(Model model, HotelDTO hotelDto, @RequestParam("file") MultipartFile file)
	{	
		viewPage = hotelSvc.update(model, hotelDto, file);
		return viewPage;
	}
	
	
	
	@RequestMapping("hotelDelete")
	public String delete(Model model, String hotelNo)
	{	
		viewPage = hotelSvc.delete(model, hotelNo);
		
		return viewPage;
	}
	
	
	@RequestMapping("hotelMbrSltMulti")
	public String mbrSltMulti(Model model, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{	
		System.out.println("-----------------------------------------");
		System.out.println("여기는 고객호텔다건조회  컨트롤러 시작");
		viewPage = hotelSvc.mbrSltMulti(model, value, page);
		
		model.addAttribute("PAGENO", page);
		System.out.println("여기는 고객호텔다건조회  컨트롤러 종료");
		
		return "HotelList";
	}
	
	@RequestMapping("hotelAdSltMulti")
	public String sltMulti(Model model, @ModelAttribute("div") 
	String div, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
	{
		
		viewPage = hotelSvc.adSltMulti(model, div, value, page);
		
		model.addAttribute("PAGENO", page);
		return "AdHotel";
	}
	
		//호텔목록
		@RequestMapping("hotelListMbr")
		public String hotelListMbr(Model model, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") String pageNo, @ModelAttribute("DATE") String date) throws Exception {
			
			int page1;
			if("".equals(pageNo)) {
			pageNo ="1";
			}
			page1 = Integer.parseInt(pageNo);
			
		    hotelSvc.mbrSltDateMulti(model, value, page1, date);
			
			return "hotelListMbr";
			
		}
		
		//호텔상세보기 및 객실목록
		
		@RequestMapping("roomListMbr")
		public String roomListMbr(Model model, @ModelAttribute("PAGENO") String pageNo, @ModelAttribute("hotelNo") String hotelNo,
				 @ModelAttribute("DATE")String date, @ModelAttribute("CHECKIN") String CHECKIN, @ModelAttribute("CHECKOUT") String CHECKOUT)throws Exception{
			
			model.addAttribute("DATE",date);
			model.addAttribute("CHECKIN",CHECKIN);
			model.addAttribute("CHECKOUT",CHECKOUT);
			if("".equals(pageNo)) {
				pageNo ="1";
			}
			
			hotelSvc.mbrSltRoom(model, pageNo, hotelNo);
			
			hotelOptnSvc.sltAll(model, hotelNo);
			
//			roomOptnSvc.sltAll(model, roomNo);
			
			return "roomListMbr";
		}
		
		//---------------------------------------호텔목록 페이징-------------------------------------------

		@RequestMapping(value="jsondelete.do", produces ="application/text;charset=UTF-8")
		@ResponseBody      
		public String test(Model model, @ModelAttribute("PAGENO")String pageNo,@ModelAttribute("VALUE") String value,
				    @ModelAttribute("DATE")String date) throws Exception{

			int page1;
			
			if("".equals(pageNo)) {
			pageNo ="1";
			}
			page1 = Integer.parseInt(pageNo);
			
			List<HotelEvlDTO> list =  hotelSvc.mbrSltDateMultiAjax(model, value, page1, date);
			
			Map<String,Object> map = new HashMap<>();
			Map<String,Object> map1 = new HashMap<>();
			map.put("AAAA", "aaaa");
			map1.put("BBBB", map);
			JSONObject jsonObj = new JSONObject();
			JSONObject jsonObj1= new JSONObject();
			
			jsonObj1.put("AAAA", "aaaa");
			jsonObj.put("BBBB", jsonObj1);
			
			Gson gson = new Gson();
			String json5=null;
			List<String> list6 = new ArrayList<String>();
			for(int i=0;i<list.size();i++) {
				HotelEvlDTO dto = list.get(i);
			    json5 =  gson.toJson(dto);
			    list6.add(json5);
			}
			
			jsonObj.put("RRRR",json5);

			String test5 = list6.toString();
			return test5;



	}
	
}
