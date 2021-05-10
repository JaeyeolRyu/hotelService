package com.sprHotelMbts.projectT3.hotelOptn;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service("hotelOptnSvc")
public class HotelOptnSVCImpl implements IHotelOptnSVC{

	final int MAXCNT = 10;
	boolean pre;
	boolean next;
	
	@Autowired
	IHotelOptnQEBC hotelOptnQebc;
	@Autowired
	IHotelOptnMEBC hotelOptnMebc;
	
	@Override
	public String sltAll(Model model, String hotelNo) {
			
			List<HotelOptnDTO> list = null;
			
			
			list = hotelOptnQebc.sltAll(hotelNo);
			
			JSONObject jsonObj = new JSONObject();
			
			ArrayList<String> list1 = new ArrayList<String>();
			
			
			
			
			for(int i = 0; i<list.size(); i++)
			{
				HotelOptnDTO dto = list.get(i);
				
				if("0301".equals(dto.getHotelOptnNo()))
				{
					list1.add("WIFI");
				}
				if("0302".equals(dto.getHotelOptnNo()))
				{
					list1.add("헬스클럽");
				}
				if("0303".equals(dto.getHotelOptnNo()))
				{
					list1.add("주차장");
				}
				if("0304".equals(dto.getHotelOptnNo()))
				{
					list1.add("수영장");
				}
				if("0305".equals(dto.getHotelOptnNo()))
				{
					list1.add("CCTV");
				}
				if("0306".equals(dto.getHotelOptnNo()))
				{
					list1.add("에어컨");
				}
				if("0307".equals(dto.getHotelOptnNo()))
				{
					list1.add("소화기");
				}
				if("0308".equals(dto.getHotelOptnNo()))
				{
					list1.add("스파");
				}
				if("0309".equals(dto.getHotelOptnNo()))
				{
					list1.add("호텔바");
				}
				if("0310".equals(dto.getHotelOptnNo()))
				{
					list1.add("안내서비스");
				}
				if("0311".equals(dto.getHotelOptnNo()))
				{
					list1.add("세탁서비스");
				}
				if("0312".equals(dto.getHotelOptnNo()))
				{
					list1.add("미용실");
				}
				if("0313".equals(dto.getHotelOptnNo()))
				{
					list1.add("금연실");
				}
				if("0314".equals(dto.getHotelOptnNo()))
				{
					list1.add("공항셔틀");
				}
				if("0315".equals(dto.getHotelOptnNo()))
				{
					list1.add("엘리베이터");
				}
				if("0316".equals(dto.getHotelOptnNo()))
				{
					list1.add("짐운반서비스");
				}
				if("0317".equals(dto.getHotelOptnNo()))
				{
					list1.add("편의점");
				}
				if("0318".equals(dto.getHotelOptnNo()))
				{
					list1.add("호텔보관금고");
				}
				if("0319".equals(dto.getHotelOptnNo()))
				{
					list1.add("회의/미팅실");
				}

			}
			
			list1.toString().replace("[", "").replace("]", "");
		
			jsonObj.put("HOTEL_OPTN", list1);
			String jsonOut = jsonObj.toString();
			
			model.addAttribute("hotelOptn",list1);
			return jsonOut;
	}

	@Override
	public String insert(Model model, HotelOptnDTO hotelOptnDto) {

		hotelOptnMebc.insert(hotelOptnDto);
		
		List<HotelOptnDTO> optnList = new ArrayList<HotelOptnDTO>();
		optnList.add(hotelOptnDto);
		model.addAttribute("HOTEL_OPTN", optnList);
		return null;
	}



	@Override
	public String delete(Model model, String hotelNo, String hotelOptnNo) {
		HotelOptnDTO hotelOptnDto = hotelOptnMebc.sltOne(hotelNo, hotelOptnNo);
		if(hotelOptnDto == null)
		{
			return null;
		}
		HotelOptnDTO hotelOptnDto1 = new HotelOptnDTO();
		hotelOptnDto1.setHotelNo(hotelNo);
		hotelOptnDto1.setHotelOptnNo(hotelOptnNo);
		
		hotelOptnMebc.delete(hotelNo, hotelOptnNo);
		
		List<HotelOptnDTO> optnList = new ArrayList<HotelOptnDTO>();
		optnList.add(hotelOptnDto1);
		model.addAttribute("HOTEL_OPTN", optnList);
		
		return null;
	}
}
