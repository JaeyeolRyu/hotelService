package com.sprHotelMbts.projectT3.reservation;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sprHotelMbts.projectT3.cust.CustDTO;




@Controller
public class ResveCTRL {


	@Autowired
	private IResveSVC resveSvc;
	
	
	@RequestMapping("resveInsert") //결제
	public String insert(Model model, ResveDTO resveDto, CustDTO custDto)throws Exception {
		
		System.out.println(custDto.getCustNo());
		resveSvc.insert(model, resveDto,custDto);
		return "redirect:/main";
	}
	
	

	
	
	@RequestMapping("resveSltMulti")
	public String sltMulti(Model model,String value, @ModelAttribute("PAGENO") String pageNo)throws Exception {
		
		String viewPage=null;
	
		return viewPage;
	}
	
	@RequestMapping("resveCancel")
	public String cancel(Model model, @ModelAttribute("CUSTNO") String custNo, @ModelAttribute("RESVENO") String resveNo) throws Exception {
		
		System.out.println(custNo+"   "+ resveNo);
		resveSvc.cancel(model, resveNo,custNo);
		
		return "redirect:/myResveList";
		
	}
	
	@RequestMapping("myResveList") //회원 결제 내역 목록
	public String sltMultiMbr(Model model, @ModelAttribute("PAGENO") String pageNo,
			String value,@ModelAttribute("DIV") String div, @ModelAttribute("CUSTNO") String custNo)throws Exception{
	
	
			resveSvc.sltCustNoAll(model, custNo, pageNo);
			Date d = new Date(); // 날짜
			SimpleDateFormat date2 = new SimpleDateFormat("yyyyMMdd");
			String date3 = date2.format(d);
			model.addAttribute("TIME",date3);
		
		return "myResveList";
	}
	
	
}
