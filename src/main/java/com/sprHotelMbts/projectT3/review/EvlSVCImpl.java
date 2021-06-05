package com.sprHotelMbts.projectT3.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service("evlSvc")
public class EvlSVCImpl implements IEvlSVC{

	@Autowired
	IEvlMEBC evlMebc;
	
	@Autowired
	IEvlQEBC evlQebc;
	
	static final int MAXCNT = 5;
	
	int pageNo; 
	
	@Override
	public AdEvlDTO sltOne(String evlNo, Model model) {

		AdEvlDTO dto = evlMebc.sltOne(evlNo);

		model.addAttribute("ADEVLDTO", dto);
		
		return dto;      
	}

	@Override
	public String delete(String evlNo, Model model) {
		
		evlMebc.delete(evlNo);
		
		return "정상처리되었습니다";
	}
	
	@Override
	public String sltMulti(String div, String value, int pageNo, Model model) {
			
		List<AdEvlDTO> list = new ArrayList<AdEvlDTO>();
		
		if ( div.equals("hotelName")) {
			list = evlQebc.sltHotelEvl(value, (pageNo-1) * MAXCNT + 1, MAXCNT + 1);
		} else  { // if ( div.equals("custName"))일 경우
			list = evlQebc.sltCustEvl(value, (pageNo-1) * MAXCNT + 1, MAXCNT + 1);
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
		
		
		return "adEvl"; 
	}

	@Override
	public String sltEvl(String custNo, Model model) {
		
		List<AdEvlDTO> list = evlQebc.sltEvl(custNo);
		
		for(int i = 0; i < list.size() ; i++ ) {
			
			AdEvlDTO dto = list.get(i);
			int score = 0;
			
			score = dto.getEvlScore()*20;
			
			dto.setEvlScore(score);
			

		}
		
		
		
		model.addAttribute("LIST", list);
		
		return null;
	}

	
	@Override
	public String evlUpdate(AdEvlDTO dto, Model model) {
		
		String evlNo = dto.getEvlNo();
		
		EvlDTO evlDto = evlMebc.sltOneUpdate(evlNo);
		
		evlDto.setEvlScore(dto.getEvlScore());
		evlDto.setEvlContent(dto.getEvlContent());
		
		evlMebc.update(evlDto);
		
		return "myEvl";
	}

	@Override
	public String evlInsert(EvlDTO dto, Model model) {
		
		String evlNo = evlQebc.serialNoEvl();
		
		dto.setEvlNo(evlNo);
		
		evlMebc.insert(dto);
		
		model.addAttribute("정상 등록되었습니다.");
		
		
		
		return "evlInsert"; //이거 마이페이지화면으로 바껴야함.
	}
	
	
	
	
}
