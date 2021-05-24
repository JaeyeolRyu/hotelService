package com.sprHotelMbts.projectT3.cust;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service("custSvc")
public class CustSVCImpl implements ICustSVC{
	
	@Autowired
	ICustMEBC custMebc;
	@Autowired
	ICustQEBC custQebc;
	
	static final int MAXCNT = 5;
	
	int pageNo; 
	
	@Override	// 회원상세보기용 단건조회
	public CustDTO sltOne(String custNo, Model model) {

		CustDTO dto = custMebc.sltOneNo(custNo);

		model.addAttribute("CUSTDTO", dto);
		
		return dto;      
	}

	@Override	// 회원용 insert
	public String insert(CustDTO dto, Model model) {
		
		CustDTO custDto = custQebc.sltOneEmail(dto.getCustEmail());
		
		if ( custDto != null ) {	
			model.addAttribute("ERR", "해당 이메일이 이미 존재합니다.");
			return null;   // 리턴값 정해줘야함. 에러페이지
		}
	
		String serialNo = custQebc.serialNoMbr();
		
		dto.setCustNo(serialNo);
		
		custMebc.insert(dto);
		
		return "redirect:/index.jsp";  		
	}

	@Override	
	public String adInsert(CustDTO dto, Model model) {
		
		CustDTO custDto = custQebc.sltOneEmail(dto.getCustEmail());
		
		if ( custDto != null ) {	
			model.addAttribute("ERR", "해당 이메일이 이미 존재합니다.");
			return null;   // 리턴값 정해줘야함. 에러페이지
		}
	
		String serialNo = custQebc.serialNoMbr();
		
		dto.setCustNo(serialNo);
		
		custMebc.insert(dto);
		
		return "redirect:/custSltMulti?div=name";  			// 리턴값 정해줘야함.
	}
	
	@Override	// 회원정보수정
	public String update(CustDTO dto, Model model) { 		// 단건조회 해야함?
		
		CustDTO custDto = custQebc.sltOneEmail(dto.getCustEmail());
		
		custDto.setCustName(dto.getCustName());
		custDto.setCustPw(dto.getCustPw());
		custDto.setCustTel(dto.getCustTel());
		custMebc.update(custDto);
		
		return "redirect:/index.jsp";  						// 리턴값 정해줘야함.
		
	}

	@Override	// 관리자 회원정보수정
	public String adUpdate(CustDTO dto, Model model) { 		// 단건조회 해야함?
		
		CustDTO custDto = custMebc.sltOneNo(dto.getCustNo());

		
		custDto.setCustName(dto.getCustName());
		custDto.setCustEmail(dto.getCustEmail());
		custDto.setCustPw(dto.getCustPw());
		custDto.setCustTel(dto.getCustTel());

		custMebc.adUpdate(custDto);
		
		return "redirect:/custSltMulti?div=name";  			// 리턴값 정해줘야함.
		
	}

	@Override	// 회원정보수정
	public String pwUpdate(CustDTO dto, Model model) { 	
		
		custMebc.update(dto);
		
		return "custMyPage";  		// 리턴값 정해줘야함.
		
	}
	
	
	@Override	// 회원탈퇴
	public String cancel(String custEmail, Model model) {
	
		CustDTO dto = custQebc.sltOneEmail(custEmail);
		
		String custNo = dto.getCustNo();

		custMebc.cancel(custNo);
		
		return "redirect:/custLogout";
	}
	
	@Override	// 회원탈퇴
	public String adCancel(String custNo, Model model) {
	
		custMebc.cancel(custNo);
		
		return "redirect:/custSltMulti?div=name";
	}

	
	@Override	// 관리자용 다건조회
	public String sltMulti(String div, String value, int pageNo, Model model) {
		
		List<CustDTO> list = new ArrayList<CustDTO>();
		

		
		if ( div.equals("name")) {
			list = custQebc.sltName(value, (pageNo-1) * MAXCNT + 1, MAXCNT + 1);
		} else if ( div.equals("email")) {
			list = custQebc.sltEmail(value, (pageNo-1) * MAXCNT + 1, MAXCNT + 1);
		}

		
		if ( pageNo == 1 ) {
			model.addAttribute("PREV", false);
		} else {
			model.addAttribute("PREV", true);
		}
		
		if ( list.size() > MAXCNT ) {
			model.addAttribute("NEXT", true);
			list.remove(MAXCNT);
		} else {
			model.addAttribute("NEXT", false);
		}
		
		
		model.addAttribute("LIST", list);
		model.addAttribute("PAGENO", pageNo);	
		
		
		return "adCust"; //페이지 정해줘야함.
	}


	@Override	// 로그인
	public String login(String email, String pw, Model model, HttpSession session) {
		
		CustDTO dto = custQebc.sltOneEmail(email);
		
		String res = null;
		
		if( dto == null ) {
			
//			model.addAttribute("LOGIN", "가입되지 않은 이메일입니다. 다시 한번 확인해주세요.");
			session.setAttribute("LOGIN", "가입되지 않은 이메일입니다. 다시 한번 확인해주세요.");
			
			res = "가입되지 않은 이메일입니다. 다시 한번 확인해주세요.";
			return res; // 로그인페이지
			
		}

		if( !dto.getCustPw().equals(pw) ) {
			
//			model.addAttribute("LOGIN", "비밀번호가 맞지 않습니다. 다시 한번 확인해주세요.");
			session.setAttribute("LOGIN", "비밀번호가 맞지 않습니다. 다시 한번 확인해주세요.");
			
			res = "비밀번호가 맞지 않습니다. 다시 한번 확인해주세요.";
			return res; // 로그인페이지
		} 

		if( dto.getCustWithdraw() == 'Y') {
//			model.addAttribute("LOGIN", "이미 탈퇴한 회원입니다.");
			session.setAttribute("LOGIN", "이미 탈퇴한 회원입니다.");
			
			res = "이미 탈퇴한 회원입니다.";
			
			return res; // 로그인페이지
		}
		
		
		
		String custNo    = dto.getCustNo();
		String custName  = dto.getCustName();
		
		session.setAttribute("CUSTNO", custNo);
		session.setAttribute("CUSTNAME", custName);
		
		if( dto.getCustAdmin() == 'Y') {
			session.setAttribute("CUSTADMIN", true);
		}
		
		res = "";
		
		return res; //메인 페이지
	}	

	@Override	// 이메일(ID) 찾기
	public String emailFind(String name, String tel, Model model) {
		
		CustDTO dto = custQebc.sltOneFind( name, tel );
		
		String res = null;
		
		if(dto == null) {

			res = "해당정보가 존재하지 않습니다.";
			
			return res; // 아디찾기 페이지
		}else {
			

			res = "귀하의 이메일은 "+dto.getCustEmail()+"입니다.";

		}
			
		return res;	// 아디찾기 페이지
	}

	@Override	// 비밀번호 찾기
	public String pwFind(String custEmail, Model model) {
		
		CustDTO dto = custQebc.sltOneEmail(custEmail);							//  이메일로 인증번호 전송하는 과정 처리하는거 생각해야함.
		
		if(dto == null) {
			
			model.addAttribute("MSG", "해당정보가 존재하지 않습니다.");
			
			return ""; // 비번찾기 페이지
		}
		
		if( dto.getCustWithdraw() == 'Y') {
			
			model.addAttribute("LOGIN", "이미 탈퇴한 회원입니다.");
			
			return ""; // 로그인페이지
		}
		String pw = dto.getCustPw();
		
		model.addAttribute("PW", pw);

		return pw;
	}
	 
	@Override	// 이메일중복확인
	public CustDTO emailCheck(String custEmail) {
		
		CustDTO dto = custQebc.sltOneEmail(custEmail);
		
		if( dto == null) {
			return null;
		}
		
		return dto;
	}
	
	@Override	// 관리자용 회원삭제 ( 평소 사용 x )
	public String delete(String custNo, Model model) {

		CustDTO dto = custMebc.sltOneNo(custNo);
		
		if (dto == null) {								// 해줄필요가 있는지 모르겠음.
			
			model.addAttribute("MSG", "해당데이터가 존재하지 않습니다.");
			
		}
		
		custMebc.delete(custNo);
		
		return "정상처리되었습니다.";	
	}


	@Override
	public String logout(Model model, HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}


	
	
	

}
