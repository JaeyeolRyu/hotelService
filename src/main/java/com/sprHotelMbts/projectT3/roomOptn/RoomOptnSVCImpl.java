package com.sprHotelMbts.projectT3.roomOptn;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service("roomOptnSvc")
public class RoomOptnSVCImpl implements IRoomOptnSVC{

	@Autowired
	IRoomOptnQEBC roomOptnQebc;
	@Autowired
	IRoomOptnMEBC roomOptnMebc;
	
	ArrayList<ArrayList<String>> mGroupList = new ArrayList<ArrayList<String>>();
	ArrayList<String> list1 = null;
	
	@Override
	public String sltAll(Model model, String roomNo) {

		List<RoomOptnDTO> list = null;
		
		list = roomOptnQebc.sltAll(roomNo);
		
		JSONObject jsonObj = new JSONObject();
		

		
		list1 = new ArrayList<String>();
		
		for(int i = 0; i < list.size(); i++)
		{
			RoomOptnDTO dto = list.get(i);
			
			if("0401".equals(dto.getRoomOptnNo()))
			{
				System.out.println("세면도구");
				list1.add("세면도구");
			}
			if("0402".equals(dto.getRoomOptnNo()))
			{
				System.out.println("목욕가운");
				list1.add("목욕가운");
			}
			if("0403".equals(dto.getRoomOptnNo()))
			{
				System.out.println("안전금고");
				list1.add("안전금고");
			}
			if("0404".equals(dto.getRoomOptnNo()))
			{
				System.out.println("비데");
				list1.add("비데");
			}
			if("0405".equals(dto.getRoomOptnNo()))
			{
				System.out.println("화장실");
				list1.add("화장실");
			}
			if("0406".equals(dto.getRoomOptnNo()))
			{
				System.out.println("소파");
				list1.add("소파");
			}
			if("0407".equals(dto.getRoomOptnNo()))
			{
				System.out.println("욕조");
				list1.add("욕조");
			}
			if("0408".equals(dto.getRoomOptnNo()))
			{
				System.out.println("타월");
				list1.add("타월");
			}
			if("0409".equals(dto.getRoomOptnNo()))
			{
				System.out.println("업무용책상");
				list1.add("업무용책상");
			}
			if("0410".equals(dto.getRoomOptnNo()))
			{
				System.out.println("TV");
				list1.add("TV");
			}
			if("0411".equals(dto.getRoomOptnNo()))
			{
				System.out.println("슬리퍼");
				list1.add("슬리퍼");
			}
			if("0412".equals(dto.getRoomOptnNo()))
			{
				System.out.println("냉장고");
				list1.add("냉장고");
			}
			if("0413".equals(dto.getRoomOptnNo()))
			{
				System.out.println("전화기");
				list1.add("전화기");
			}
			if("0414".equals(dto.getRoomOptnNo()))
			{
				System.out.println("커피메이커");
				list1.add("커피메이커");
			}
			if("0415".equals(dto.getRoomOptnNo()))
			{
				System.out.println("다리미");
				list1.add("다리미");
			}
			if("0416".equals(dto.getRoomOptnNo()))
			{
				System.out.println("난방시설");
				list1.add("난방시설");
			}
			if("0417".equals(dto.getRoomOptnNo()))
			{
				System.out.println("헤어드라이어");
				list1.add("헤어드라이어");
			}
			if("0418".equals(dto.getRoomOptnNo()))
			{
				System.out.println("전기주전자");
				list1.add("전기주전자");
			}
			if("0419".equals(dto.getRoomOptnNo()))
			{
				System.out.println("알람시계");
				list1.add("알람시계");
			}
			if("0420".equals(dto.getRoomOptnNo()))
			{
				System.out.println("옷장");
				list1.add("옷장");
			}
			if("0421".equals(dto.getRoomOptnNo()))
			{
				System.out.println("에어컨");
				list1.add("에어컨");
			}
			if("0422".equals(dto.getRoomOptnNo()))
			{
				System.out.println("식탁");
				list1.add("식탁");
			}
			if("0423".equals(dto.getRoomOptnNo()))
			{
				System.out.println("보드게임");
				list1.add("보드게임");
			}
			if("0424".equals(dto.getRoomOptnNo()))
			{
				System.out.println("공기청정기");
				list1.add("공기청정기");
			}
			if("0425".equals(dto.getRoomOptnNo()))
			{
				System.out.println("화장지");
				list1.add("화장지");
			}
			
			mGroupList.add(list1);
			model.addAttribute("TEST1", list1);
			model.addAttribute("TEST", mGroupList);
			
		}
//		List<List> li = new ArrayList<>();
//		li.add(list1);
//		System.out.println("다다다" + li.get(0));
//		System.out.println("다다다다" + li.get(1));
//		System.out.println(li.get(1));
//		model.addAttribute("qq",li);
		
		
		jsonObj.put("ROOM_OPTN", list1);
		String jsonOut = jsonObj.toString();
		System.out.println("ss" + jsonOut);
		model.addAttribute("ROOM_OPTN", list1);
		
		return jsonOut;
	}
	@Override
	public String insert(Model model, RoomOptnDTO roomOptnDto) {
		System.out.println("객실옵션 SVC 출발");
		String roomNo = roomOptnDto.getRoomNo();
		String roomOptnNo = roomOptnDto.getRoomOptnNo();
		System.out.println(roomNo);
		System.out.println(roomOptnNo);
		
		RoomOptnDTO roomOptnDto1 = roomOptnMebc.sltOne(roomNo, roomOptnNo);
		System.out.println("헤이");
		if(roomOptnDto1 != null)
		{
			return null;
		}
		System.out.println("insert 전");
		roomOptnMebc.insert(roomOptnDto);
		System.out.println("insert 후");
		List<RoomOptnDTO> optnList = new ArrayList<RoomOptnDTO>();
		optnList.add(roomOptnDto);
		model.addAttribute("ROOM_OPTN", optnList);
		return null; 
	}
/*	@Override
	public String update(Model model, RoomOptnDTO roomOptnDto) {
		// TODO Auto-generated method stub
		return null;
	}*/
	@Override
	public String delete(Model model, String roomNo, String roomOptnNo) {
		RoomOptnDTO roomOptnDto = roomOptnMebc.sltOne(roomNo, roomOptnNo);
		
		if(roomOptnDto == null)
		{
			System.out.println("없으니 나가");
			return null;
		}
		
		RoomOptnDTO roomOptnDto1 = new RoomOptnDTO();
		roomOptnDto1.setRoomNo(roomNo);
		roomOptnDto1.setRoomOptnNo(roomOptnNo);
		List<RoomOptnDTO> optnList = new ArrayList<RoomOptnDTO>();
		optnList.add(roomOptnDto1);
		model.addAttribute("ROOM_OPTN", optnList);
		
		roomOptnMebc.delete(roomNo, roomOptnNo);

		System.out.println("delete하고  ctrl로 나감");
	
		String res = "삭제되었습니다.";
		
		return res;
	}
	
}
