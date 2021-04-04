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
	
//	@RequestMapping(value = "/")
//	public String home() 
//	{
//		return "redirect:/main.jsp";
//	}
	
	
	
	@Transactional
	@RequestMapping(value = "/")
	public String home(Model model, HttpSession session) {
		String value ="%";
		int page = 1;
		System.out.println("start--------");
		hotelSvc.mainSltMulti(model, session,value, page);
		System.out.println("서비스진행후--------");
		return "redirect:/index.jsp";
	}
	//main 페이지
	
	@RequestMapping("main")
	public String mainPage(Model model, HttpSession session) {
		String value ="%";
		int page = 1;
		System.out.println("start--------");
		hotelSvc.mainSltMulti(model, session,value, page);
		System.out.println("서비스진행후--------");
		return "redirect:/index.jsp";
	}
	
	
	//관리자 호텔관리 화면이동
	@RequestMapping("AdHotel")
	public String adHotelView()
	{	
		System.out.println("관리자 화면이동직전!!ㄴ");
		return "AdHotel";
	}
	
	//관리자 호텔 등록 //ui에 등록버튼없음
	@RequestMapping("hotelInsert")
	public String insert(Model model, HotelDTO hotelDto, @RequestParam("file") MultipartFile file)
	{	
		System.out.println("dsfsdfsdfsdfsdfsdf");
		System.out.println(hotelDto.getHotelNo()+"//"+hotelDto.getHotelNm());
		viewPage = hotelSvc.insert(model, hotelDto,file);
		
		return viewPage;
	}
	
	@RequestMapping("hotelUpdate")
	public String update(Model model, HotelDTO hotelDto, @RequestParam("file") MultipartFile file)
	{	
		System.out.println("-----------------------------------------");
		System.out.println("여기는 호텔업데이트 컨트롤러 시작");
		System.out.println(hotelDto.toString());
		viewPage = hotelSvc.update(model, hotelDto, file);
		System.out.println("여기는 호텔업데이트 컨트롤러 종료직전");
		return viewPage;
	}
	
	
	
	@RequestMapping("hotelDelete")
	public String delete(Model model, String hotelNo)
	{	
		System.out.println("-----------------------------------------");
		System.out.println("여기는 호텔삭제 컨트롤러 시작");
		viewPage = hotelSvc.delete(model, hotelNo);
		System.out.println("여기는 호텔삭제 컨트롤러 종료직전");
		
		return viewPage;
	}
	
//	@RequestMapping("hotelMain")
//	public String main(Model model, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") int page)
//	{	
//		System.out.println("-----------------------------------------");
//		viewPage = hotelSvc.mbrSltMulti(model, value, page);
//		
//		model.addAttribute("PAGENO", page);
//		
//		return "mainHotel";
//	}
	
//	@RequestMapping("sltOne")
//	@ResponseBody
//	public String sltOne(Model model, @ModelAttribute("hotelNo") String hotelNo)
//	{	
//		System.out.println("-----------------------------------------");
//		System.out.println("여기는 호텔단건 컨트롤러 시작");;
//		
//		hotelSvc.sltOne(model, hotelNo);
//		
//		System.out.println("여기는 호텔단건 컨트롤러 종료직전");
//		
//		return "adHotel";
//	}
	
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
		
		System.out.println("-----------------------------------------");
		System.out.println("여기는 관리자호텔다건조회  컨트롤러 시작");
		System.out.println("페이지 :  " + page);
		viewPage = hotelSvc.adSltMulti(model, div, value, page);
		
		model.addAttribute("PAGENO", page);
		System.out.println("여기는 관리자호텔다건조회  컨트롤러 종료");
		return "AdHotel";
	}
	
	
//	//관리자 호텔관리 화면이동
//		@RequestMapping("hotelSelect")
//		public String hotelSelect()
//		{	
//			System.out.println("-----------------------------------------");
//			return "hotelSelect";
//		}
//		
//		@RequestMapping("hotelOptn")
//		public String hotelOptn()
//		{	
//			System.out.println("-----------------------------------------");
//			System.out.println("여기는 호텔옵션관리");
//			return "redirect:/hotelOptn";
//		}
		
		//호텔목록
		@RequestMapping("hotelListMbr")
		public String hotelListMbr(Model model, @ModelAttribute("value") String value, @ModelAttribute("PAGENO") String pageNo, @ModelAttribute("DATE") String date) throws Exception {
			
			int page1;
		System.out.println(date+" 컴트롤 date");
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
			
			System.out.println(hotelNo+"  "+date+"  "+ CHECKIN+"  "+ CHECKOUT);
			model.addAttribute("DATE",date);
			model.addAttribute("CHECKIN",CHECKIN);
			model.addAttribute("CHECKOUT",CHECKOUT);
			System.out.println("컨트롤 호텔번호 테스트"+pageNo);
			if("".equals(pageNo)) {
				pageNo ="1";
			}
			
			hotelSvc.mbrSltRoom(model, pageNo, hotelNo);
			
			hotelOptnSvc.sltAll(model, hotelNo);
			
//			roomOptnSvc.sltAll(model, roomNo);
			
			return "roomListMbr";
		}
		
		//---------------------------------------호텔목롱 페이징-------------------------------------------

		@RequestMapping(value="jsondelete.do", produces ="application/text;charset=UTF-8")
		@ResponseBody      
		public String test(Model model, @ModelAttribute("PAGENO")String pageNo,@ModelAttribute("VALUE") String value,
				    @ModelAttribute("DATE")String date) throws Exception{
			
			
			System.out.println(pageNo+"  ddddd");
	
			
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
//			for(int i=0;i <list.size();i++) {
//			
//				jsonObj.put("hList"+i,list.get(i));
//			}
			
			Gson gson = new Gson();
			String json5=null;
			List<String> list6 = new ArrayList<String>();
			for(int i=0;i<list.size();i++) {
				HotelEvlDTO dto = list.get(i);
			    json5 =  gson.toJson(dto);
			    list6.add(json5);
			}
			
		
			
			jsonObj.put("RRRR",json5);
	
		//	String jsonOut = jsonObj.toString();
			System.out.println(list6.toString());
			String test5 = list6.toString();
			return test5;



	}
	
}
