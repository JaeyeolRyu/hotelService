package com.sprHotelMbts.projectT3.reservation;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sprHotelMbts.projectT3.cust.CustDTO;
import com.sprHotelMbts.projectT3.cust.ICustMEBC;
import com.sprHotelMbts.projectT3.cust.ICustQEBC;


@Service("resveSvc")
public class ResveSVCImpl implements IResveSVC {

	@Autowired
	private IResveMEBC resveMebc;
	
	@Autowired
	private IResveQEBC resveQebc;
	@Autowired
	private ICustQEBC custQebc;
	@Autowired
	private ICustMEBC custMebc;
	
	
	
	@Override
	public String sltMulti(Model model, String value, String pageNo) {
		
	
		
		return null;
	}

	@Override // 결제
	public String insert(Model model, ResveDTO resveDto, CustDTO custDto) {
	
		String payDay   ;  
		String fUpdateDay ;
		String lUpdateDay ;
	    String fUpdateId  ;
		String lUpdateId ;
		char   cancelAt ;
		String custNo;
		
		String resveNo = resveQebc.serialNo(); //예약 테이블 넘버 채번
		
	    Date date = new Date(); // 날짜
		SimpleDateFormat date2 = new SimpleDateFormat("yyyyMMdd");
		String date3 = date2.format(date);
		
		
		payDay     = date3;  //결제일
		fUpdateDay = date3;  //최초 수정일
		lUpdateDay = date3;  //최종 수정일
		cancelAt   = 'N';    
		
		if(resveDto.getCustNo()==null) { 	// 비회원 결제시
			
			custNo = custQebc.serialNoNonMbr();  //비회원 채번 
			resveDto.setCustNo(custNo);
			
			
			
			fUpdateId  = resveDto.getCustNo();
			lUpdateId  = resveDto.getCustNo();
			
			
	     	//비회원 정보 등록
			custDto.setCustNo(custNo);
            //custDto.setCustEmail();
			custDto.setCustPw("0000");
			//custDto.setCustName(custName);
			//custDto.setCustTel(custTel);
			custDto.setCustRegDate(date3);
			custDto.setCustGrade("0000");
			custDto.setCustMilage(1);
			custDto.setCustWithdraw('-');
			custDto.setCustAdmin('-');
		
			custMebc.insert(custDto);
			
		}else //회원 결제시
		{
		
			fUpdateId  = resveDto.getCustNo();
			lUpdateId  = resveDto.getCustNo();
		
		}
		
		resveDto.setResveNo(resveNo);
		resveDto.setPayDay(payDay);
		resveDto.setCancelAt(cancelAt);
		resveDto.setfUpdateDay(fUpdateDay);
		resveDto.setlUpdateDay(lUpdateDay);
		resveDto.setfUpdateId(fUpdateId);
		resveDto.setlUpdateId(lUpdateId);
		
		
		System.out.println("서비스 디티오 확인:"+resveDto);
		
		resveMebc.insert(resveDto); // 예약 테이블 등록.
		
		return "null";
		
	}

	@Override
	public String delete(Model model, String resveNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String cancel(Model model, String resveNo, String custNo) {
		 Date date = new Date(); // 날짜
		 SimpleDateFormat date2 = new SimpleDateFormat("yyyyMMdd");
		 String date3 = date2.format(date);
		 
		 System.out.println(resveNo+" 서비스 "+custNo);
		 ResveDTO resveDto = resveMebc.sltOne(resveNo);
		
		 System.out.println(resveDto);
		 
		 resveDto.setCancelAt('Y');
		 resveDto.setlUpdateDay(date3);
		 resveDto.setlUpdateId(custNo);
		resveMebc.cancel(resveDto);
		
	
		return null;
	}

	@Override
	public String sltCustNoAll(Model model, String custNo, String pageNo) {
		System.out.println("컨트롤 페이지 값 확인:"+pageNo);
		boolean next;
		if("".equals(pageNo)) {
			pageNo ="1";
		}
		int MAXCNT=10;
		
		int page1=Integer.parseInt(pageNo);
		int startNo = (page1 - 1) * MAXCNT + 1;
		int cnt = MAXCNT + 1;
		
		
		
		List<ResveDTO> list = resveQebc.sltCustNo(custNo, startNo, cnt);
		System.out.println(list.size());
		if(list.size() == 0)
			return null;
		
		if(list.size() < 11)
		{
			next = false;
		}
		else
		{
			list.remove(10);
			next = true;
		}
		
		model.addAttribute("RESVELIST",list);
		model.addAttribute("NEXT", next);
		return null;
	}


}
