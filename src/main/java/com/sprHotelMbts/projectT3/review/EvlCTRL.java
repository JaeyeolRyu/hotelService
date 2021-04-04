package com.sprHotelMbts.projectT3.review;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class EvlCTRL {

	@Autowired
	private IEvlSVC evlSvc;
	
	@RequestMapping(value = "sltEvlDetail", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String evlDetail( @ModelAttribute("evlNo") String evlNo, Model model ) throws Exception
	{
		
		System.out.println(evlNo);
		AdEvlDTO dto = evlSvc.sltOne(evlNo, model);

		JSONObject jsonObj = new JSONObject();
		
		int score = dto.getEvlScore()*20;
		
		jsonObj.put("EVLNO", dto.getEvlNo());
		jsonObj.put("HOTELNAME", dto.getHotelName());
		jsonObj.put("CUSTNAME", dto.getCustName());
		jsonObj.put("EVLSCORE", score);
		jsonObj.put("EVLCONTENT", dto.getEvlContent());
		
		String jsonOut = jsonObj.toString();
		System.out.println("==" + jsonOut);

		
		return jsonOut;
	}

	@RequestMapping(value = "evlDelete", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String evlDelete( @ModelAttribute("evlNo") String evlNo, Model model ) throws Exception
	{

		String msg = evlSvc.delete(evlNo, model);

		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("MSG", msg);
		
		String jsonOut = jsonObj.toString();
		

		return jsonOut;
	}

	@RequestMapping("evlSltMulti")
	public String sltMulti(@ModelAttribute("div") String div, @ModelAttribute("value") String value, Model model, @ModelAttribute("PAGENO") String pageNo) {

		int pageNo2;
		
		if("".equals(pageNo)) {
			pageNo2 = 1;
		} else {
			pageNo2 = Integer.parseInt(pageNo);
		}
			
		
		
		String viewPage = evlSvc.sltMulti(div, value, pageNo2, model);
		
		
		return viewPage;
	}


	
	@RequestMapping("adEvl")
	public String evl() {
		
		return "adEvl";
	}
	
	@RequestMapping("evlInsert")
	public String evlInsert(EvlDTO dto, Model model) {
		
			
		evlSvc.evlInsert(dto, model);
		
		
		
		return "closePage";
	}
	
	@RequestMapping("evlUpdate")
	public String evlUpdate(AdEvlDTO dto, Model model) {
		
		System.out.println(dto.getEvlScore());
	
		String viewPage = evlSvc.evlUpdate(dto, model);
		
		return viewPage;
	}

	@RequestMapping("myEvlList")
	public String sltEvl(@SessionAttribute("CUSTNO") String custNo, Model model) {

		evlSvc.sltEvl(custNo, model);
		
		return "myEvl";	
	}
	
	@RequestMapping("evlUpdateView")
	public String evlUpdateView(@ModelAttribute("evlNo")String evlNo, Model model) {
		
		System.out.println("업데이트 뷰 들어옴. evlNo 값 : " + evlNo);
		
		AdEvlDTO dto = evlSvc.sltOne(evlNo, model);
		
		model.addAttribute("EVLDTO", dto ) ;		
		
		return "evlUpdate";
	}


	@RequestMapping("evlInsertView")
	public String sltInsert(@SessionAttribute("CUSTNO") String custNo, @ModelAttribute("hotelName") String hotelName, @ModelAttribute("hotelNo")String hotelNo ,Model model) {

		System.out.println(custNo+"  "+hotelName+"  "+hotelNo+"  dfdfdfdf");
		
	
		model.addAttribute("CUSTNO", custNo);
		model.addAttribute("HOTELNAME", hotelName);
		model.addAttribute("HOTELNO", hotelNo);
		
		return "evlInsert";	
	}

}
