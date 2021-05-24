package com.sprHotelMbts.projectT3.cust;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
// @RequestMapping(value = "/email")
public class EmailController {

	@Autowired
	MailService mailService;
	
	@RequestMapping(value = "/email.do")
	public ModelAndView board2() {

		ModelAndView mv = new ModelAndView();

		int ran = new Random().nextInt(900000) + 100000;

		mv.setViewName("test/email");

		mv.addObject("random", ran);

		return mv;

	}
	
	
	@RequestMapping("sendEmail")
	public String sendEmail() {

		return "sendEmail";
	}
	

	
	
	@RequestMapping(value = "createEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> createEmailCheck(@RequestParam String userEmail,  HttpServletRequest req, Model model) {
		// 이메일 인증

		int ran = new Random().nextInt(900000) + 100000;

		HttpSession session = req.getSession(true);

		String authCode = String.valueOf(ran);

		session.setAttribute("authCode", authCode);


		String subject = "Hocance 인증 번호 입니다.";

		StringBuilder sb = new StringBuilder();

		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");

		model.addAttribute("RANDOM", authCode);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("AA", authCode);

		mailService.send(subject, sb.toString(), "win10040127@gmail.com", userEmail);
		
		
		return m;
	}

}
