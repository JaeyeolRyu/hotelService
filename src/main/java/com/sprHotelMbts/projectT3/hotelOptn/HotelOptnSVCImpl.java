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
		
		System.out.println("-----------------------------------------");
		System.out.println("호텔옵션 관리자 다건조회 SVC 시작"); 
	
			
			List<HotelOptnDTO> list = null;
			
			
			list = hotelOptnQebc.sltAll(hotelNo);
			
			JSONObject jsonObj = new JSONObject();
			
			ArrayList<String> list1 = new ArrayList<String>();
			
			
			
			
			for(int i = 0; i<list.size(); i++)
			{
				HotelOptnDTO dto = list.get(i);
				
				if("0301".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 WIFI WIFI");
					list1.add("WIFI");
				}
				if("0302".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 헬스클럽  헬스클럽");
					list1.add("헬스클럽");
				}
				if("0303".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 주차장  주차장");
					list1.add("주차장");
				}
				if("0304".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 수영장  수영장");
					list1.add("수영장");
				}
				if("0305".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 CCTV  CCTV");
					list1.add("CCTV");
				}
				if("0306".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 에어컨   에어컨");
					list1.add("에어컨");
				}
				if("0307".equals(dto.getHotelOptnNo()))
				{
					list1.add("소화기");
				}
				if("0308".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 스파   스파");
					list1.add("스파");
				}
				if("0309".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 호텔 바   호텔 바");
					list1.add("호텔바");
				}
				if("0310".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 안내서비스, 안내서비스");
					list1.add("안내서비스");
				}
				if("0311".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 세탁 서비스   세탁 서비스");
					list1.add("세탁서비스");
				}
				if("0312".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 미용실   미용실");
					list1.add("미용실");
				}
				if("0313".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는금연실   금연실");
					list1.add("금연실");
				}
				if("0314".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 공항셔틀 공항셔틀");
					list1.add("공항셔틀");
				}
				if("0315".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 엘리베이터. 엘리베이터");
					list1.add("엘리베이터");
				}
				if("0316".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 짐 운반 서비스. 짐 운반 서비스");
					list1.add("짐운반서비스");
				}
				if("0317".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 편의점");
					list1.add("편의점");
				}
				if("0318".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 호텔 보관금고");
					list1.add("호텔보관금고");
				}
				if("0319".equals(dto.getHotelOptnNo()))
				{
					System.out.println("여기는 회의/미팅실");
					list1.add("회의/미팅실");
				}

			}
			
//			System.out.println("밑에 나와랏!");
//			System.out.println(list1.get(0));
//			System.out.println(list1.get(1));
			list1.toString().replace("[", "").replace("]", "");
//		
//			for(int i = 0; i < list1.size(); i++)
//			{
//				list1.get(i);
//			}
			jsonObj.put("HOTEL_OPTN", list1);
			String jsonOut = jsonObj.toString();
			
			
			
			
			model.addAttribute("hotelOptn",list1);
			System.out.println("호텔옵션 관리자 다건조회 SVC 종료직전"); 
			return jsonOut;
	}

	@Override
	public String insert(Model model, HotelOptnDTO hotelOptnDto) {
		String hotelNo = hotelOptnDto.getHotelNo();
		String hotelOptnNo = hotelOptnDto.getHotelOptnNo();
		System.out.println("호텔옵션 INSERT SVC 진입");
		System.out.println("호텔넘버 - >" + hotelNo);
		System.out.println("호텔옵션넙버 ->" + hotelOptnNo);
//		HotelOptnDTO hotelOptnDto1 = hotelOptnMebc.sltOne(hotelNo, hotelOptnNo);
//		{
//			;
//		}
		
		hotelOptnMebc.insert(hotelOptnDto);
		
		List<HotelOptnDTO> optnList = new ArrayList<HotelOptnDTO>();
		optnList.add(hotelOptnDto);
		model.addAttribute("HOTEL_OPTN", optnList);
		return null;
	}



	@Override
	public String delete(Model model, String hotelNo, String hotelOptnNo) {
		System.out.println("여기는 호텔옵션 삭제 SVC 시작");
		System.out.println(hotelNo + "||" +  hotelOptnNo);
		HotelOptnDTO hotelOptnDto = hotelOptnMebc.sltOne(hotelNo, hotelOptnNo);
		System.out.println("단곤조회나오니?");
		if(hotelOptnDto == null)
		{
			System.out.println("?");
			return null;
		}
		System.out.println("??");
		HotelOptnDTO hotelOptnDto1 = new HotelOptnDTO();
		hotelOptnDto1.setHotelNo(hotelNo);
		hotelOptnDto1.setHotelOptnNo(hotelOptnNo);
		
		System.out.println("나와?");
		hotelOptnMebc.delete(hotelNo, hotelOptnNo);
		
		System.out.println("여기는?");
		List<HotelOptnDTO> optnList = new ArrayList<HotelOptnDTO>();
		optnList.add(hotelOptnDto1);
		System.out.println("에헴");
		model.addAttribute("HOTEL_OPTN", optnList);
		
		System.out.println("여기는 호텔옵션 삭제 SVC 종료");
		return null;
	}
}
