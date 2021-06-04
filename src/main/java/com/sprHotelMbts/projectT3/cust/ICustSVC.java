package com.sprHotelMbts.projectT3.cust;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ICustSVC {

	CustDTO sltOne(String custNo, Model model);
	
	String insert(CustDTO dto, Model model);
	
	String adInsert(CustDTO dto, Model model);
	
	String update(CustDTO dto, Model model);
	
	String adUpdate(CustDTO dto, Model model);
	
	String pwUpdate(CustDTO dto, Model model);
	
	String cancel(String custEmail, Model model);
	
	String adCancel(String custEmail, Model model);
	
	String sltMulti(String div, String value, int pageNo, Model model);
	
	String login(String custEmail, String pw, Model model, HttpSession session);
	
	String logout(Model model, HttpSession session);
	
	boolean emailCheck(String custEmail);
	
	String emailFind(String custName, String custTel, Model model);
	
	String pwFind(String custEmail, Model model);

	String delete(String custNo, Model model);

}
