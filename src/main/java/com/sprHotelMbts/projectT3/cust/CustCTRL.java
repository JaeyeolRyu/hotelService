package com.sprHotelMbts.projectT3.cust;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class CustCTRL {

	@Autowired
	private ICustSVC custSvc;

/*	@RequestMapping(value = "main")
	public String mainPage() {

		return "redirect:/main.jsp";
	}*/
	
	@RequestMapping("custSltOne") // 마이페이지 상세정보 조회,수정용 sltOne
	public String sltOne(@SessionAttribute("CUSTNO") String custNo, Model model) {
	
		custSvc.sltOne(custNo, model);

		return "myPage";

	}

	@RequestMapping("custInsert")
	public String insert(CustDTO dto, @ModelAttribute("div")String div, Model model) {
		String viewPage = null;
		
		if(div.equals("ad")) {
			viewPage = custSvc.adInsert(dto, model);
		}
		if(div.equals("mbr")) { 
			viewPage = custSvc.insert(dto, model);
		}
			
		return viewPage;
	}

	
	@RequestMapping("custUpdate")

	public String update(CustDTO dto, Model model) {

		String viewPage = custSvc.update(dto, model);

		return viewPage;
	}
	
	@RequestMapping("adCustUpdate")
	public String adUpdate(CustDTO dto, Model model) {

		
		String viewPage = custSvc.adUpdate(dto, model);

		return viewPage;
	}
	

	@RequestMapping(value = "custCancel")
	@ResponseBody
	public void cancel(@ModelAttribute("custEmail") String custEmail, Model model) {
		
		custSvc.cancel(custEmail, model);

		
	}
	
	@RequestMapping("custAdCancel")
	public String adCancel(@ModelAttribute("custNo") String custNo, Model model) {
		
		String viewPage = null;

			viewPage = custSvc.adCancel(custNo, model);

		return viewPage;
		
	}

	
	
	@RequestMapping(value = "custSltDetail", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String custDetail( @ModelAttribute("custNo") String custNo, Model model ) throws Exception
	{
		

		CustDTO dto = custSvc.sltOne(custNo, model);

		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("NO", dto.getCustNo());
		jsonObj.put("NAME", dto.getCustName());
		jsonObj.put("EMAIL", dto.getCustEmail());
		jsonObj.put("TEL", dto.getCustTel());
		jsonObj.put("PW", dto.getCustPw());
		
		String jsonOut = jsonObj.toString();

		
		return jsonOut;
	}
	
	@RequestMapping(value = "custDelete", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String custDelete( @ModelAttribute("custNo") String custNo, Model model ) throws Exception
	{

		String msg = custSvc.delete(custNo, model);

		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("MSG", msg);
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}
	
	@RequestMapping("custSltMulti")
	public String sltMulti(@ModelAttribute("div") String div, @ModelAttribute("value") String value, Model model, @ModelAttribute("PAGENO") String pageNo) {

		int pageNo2;
		
		if("".equals(pageNo)) {
			pageNo2 = 1;
		} else {
			pageNo2 = Integer.parseInt(pageNo);
		}
			
		
		
		String viewPage = custSvc.sltMulti(div, value, pageNo2, model);
		
		
		return viewPage;
	}

	@RequestMapping("custLogin")
	@ResponseBody
	public Map<String, Object> login(@ModelAttribute("custEmail")String custEmail, @ModelAttribute("custPw") String custPw, Model model, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String res = custSvc.login(custEmail, custPw, model, session);

		map.put("RESULT", res);
		
		return map;
	}

	@RequestMapping("custLogout")
	public String logout(Model model, HttpSession session) {

		String viewPage = custSvc.logout(model, session);

		return viewPage;

	}

	@RequestMapping(value = "custPwUpdate")
	@ResponseBody
	public String pwUpdate(@SessionAttribute("CUSTNO")String custNo, @ModelAttribute("newPw") String newPw, Model model) {
		CustDTO dto = custSvc.sltOne(custNo, model);
		dto.setCustPw(newPw);
		
		String viewPage = custSvc.pwUpdate(dto, model);
		
		return viewPage;
	}
	
	@RequestMapping("custEmailFind")
	@ResponseBody
	public  Map<String, Object> emailFind(@ModelAttribute("custName") String name, @ModelAttribute("custTel")String tel, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String res = custSvc.emailFind(name, tel, model);
		
		map.put("RESULT", res);
		
		return map;
	}
	

	@RequestMapping("custPwFind")
	@ResponseBody
	public Map<String, Object> pwFind(@ModelAttribute("custEmail") String custEmail, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String pw = custSvc.pwFind(custEmail, model);
		
		map.put("PW", pw);
		
		return map;
	}


	@RequestMapping(value = "emailCheck.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String emailCheck(@ModelAttribute("custEmail") String custEmail) throws Exception {
 
		boolean result = custSvc.emailCheck(custEmail);

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}

	@RequestMapping("custMbrReg")
	public String MbrReg() {

		return "MbrReg";
	}

	@RequestMapping("custLog")
	public String log() {

		return "login";

	}
	
	@RequestMapping("adCust")
	public String adCust() {

	
		return "adCust";
	}
	
	@RequestMapping("emailFind")
	public String emailFind() {

		return "emailFind";

	}

}
