package com.sprHotelMbts.projectT3.room;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.sprHotelMbts.projectT3.cust.CustDTO;
import com.sprHotelMbts.projectT3.cust.ICustMEBC;



@Service("roomSvc")
public class RoomSVCImpl implements IRoomSVC{
	
	final int MAXCNT = 10;
	boolean pre;
	boolean next;
	
	@Autowired
	IRoomQEBC roomQebc;
	
	@Autowired
	IRoomMEBC roomMebc;
	
	@Autowired
	ICustMEBC custMebc;
	
	public RoomSVCImpl() {
	}



	@Override
	public String insert(Model model, RoomDTO roomDto, MultipartFile file) {
		
		String roomNo = roomDto.getRoomNo();
		//String roomNm = roomDto.getRoomNm();
		if(roomNo == null)
			roomNo = "0"; 
		String serialNo1 = roomQebc.serialNo(roomDto.getHotelNo());
		roomDto.setRoomNo(serialNo1);
	  
	String newFile=roomDto.getRoomNm()+".jpg";    

	try(

	      FileOutputStream fos = new FileOutputStream("C:\\2005RJY\\workspace\\projectT3\\src\\main\\webapp\\resources\\img\\" + newFile);
													
	      InputStream is = file.getInputStream();

	    ){

	      int readCount = 0;

	      byte[] buffer = new byte[1024];

	      while((readCount = is.read(buffer)) != -1){

	      fos.write(buffer,0,readCount);

	    }

	    }catch(Exception ex){

	      throw new RuntimeException("file Save Error11");

	    }


	    roomDto.setRoomPhoto(newFile);
		String hotelNo =  roomDto.getHotelNo();
		roomMebc.insert(roomDto);
		//div value page
		return "redirect:/adSltMulti?hotelNo="+hotelNo+"&div=0&value=0&PAGENO=1";  
	}

	@Override
	public String delete(Model model, String roomNo) { 
		RoomDTO roomDto = roomMebc.sltOne(roomNo);
		
		if(roomDto == null)
		{
			model.addAttribute("ERR", "해당 호텔이  존재하지않습니다..");
			return "Err";
		}
		
		roomMebc.delete(roomNo);
		return null;
	}

	@Override
	public String update(Model model, RoomDTO roomDto, MultipartFile file) {
		String hotelNo = roomDto.getHotelNo();

	  
		String newFile=roomDto.getRoomNm()+".jpg";    

	try(

	      FileOutputStream fos = new FileOutputStream("C:\\2005RJY\\workspace\\projectT3\\src\\main\\webapp\\resources\\img\\" + newFile);
													
	      InputStream is = file.getInputStream();

	    ){

	      int readCount = 0;

	      byte[] buffer = new byte[1024];

	      while((readCount = is.read(buffer)) != -1){

	      fos.write(buffer,0,readCount);

	    }

	    }catch(Exception ex){

	      throw new RuntimeException("file Save Error11");

	    }


	    roomDto.setRoomPhoto(newFile);
		
		roomMebc.update(roomDto);
		return "redirect:/adSltMulti?hotelNo="+hotelNo+"&div=0&value=0&PAGENO=1";  
	}

	@Override
	public String adSltMulti(String hotelNo, Model model, String div, String value, int page) {
		
		try {
			
			if(page == 0)
			{
				page =  1;
			}
			
			int start = (page - 1) * MAXCNT + 1;
			int cnt = MAXCNT + 1;
			if(value == null)
			{
				value = "%";
			}
			else if(value.equals("0"))
			{
				value = "%";
			}
			
			if(hotelNo == null)
				hotelNo = "0";
			List<RoomDTO> list = null;
			
			if(div.equals("0") || div.equals("Name"))
			{
				list = roomQebc.sltName(hotelNo, value, start, cnt);
			}
			else if(div.equals("All"))
			{
				list = roomQebc.sltAll(hotelNo,value, start, cnt);
			}

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
			
			if(page == 1)
				pre = false;
			else
				pre = true;
			model.addAttribute("PRE", pre);
			model.addAttribute("NEXT",next);
			model.addAttribute("ROOM", list);
			model.addAttribute("PAGENO", page);
			model.addAttribute("ROOMCOUNT", list.size()); //객실 수를 넘겨야하는데......
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		return null;
	}

	@Override
	public String mbrSltMulti(Model model, String value, int page) {
		if(page == 0)
		{
			page =  1;
		}
		
		int start = (page - 1) * MAXCNT + 1;
		int cnt = MAXCNT + 1;
		
		if(value.equals("0"))
		{
			value = "%";
		}
			String hotelNo = "1";
			List<RoomDTO> roomList = roomQebc.sltName(hotelNo, value, start, cnt);
			if(roomList.size() == 0)
				return null;
			
			if(roomList.size() < 11)
			{
				next = false;
			}
			else
			{
				roomList.remove(10);
				next = true;
			}
			if(page == 1)
				pre = false;
			else
				pre = true;
			
			model.addAttribute("PRE", pre);
			model.addAttribute("NEXT",next);
			model.addAttribute("ROOMLIST", roomList);
			model.addAttribute("PAGENO", page);
		return null;
	}

	
	@Override
	public String sltCstRum(Model model, String roomNo, String custNo) {
		RoomDTO roomDto= roomMebc.sltOne(roomNo);
		
		CustDTO custDto = custMebc.sltOneNo(custNo);
			
		model.addAttribute("CUST", custDto);
		model.addAttribute("ROOM",roomDto);
		
		return null;
	}

}
