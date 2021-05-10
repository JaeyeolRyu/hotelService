package com.sprHotelMbts.projectT3.hotel;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sprHotelMbts.projectT3.review.IEvlQEBC;
import com.sprHotelMbts.projectT3.room.IRoomQEBC;
import com.sprHotelMbts.projectT3.room.RoomDTO;
import com.sprHotelMbts.projectT3.roomOptn.IRoomOptnQEBC;
import com.sprHotelMbts.projectT3.roomOptn.IRoomOptnSVC;
import com.sprHotelMbts.projectT3.roomOptn.RoomOptnJoinDTO;


@Service("hotelSvc")
public class HotelSVCImpl implements IHotelSVC{

	
	final int MAXCNT = 5;
	boolean pre;
	boolean next;
	
	@Autowired
	IHotelQEBC hotelQebc;
	
	@Autowired
	IHotelMEBC hotelMebc;
	
	@Autowired
	IRoomQEBC roomQebc;
	
	@Autowired
	IRoomOptnSVC roomOptnSvc;
	
	@Autowired
	IRoomOptnQEBC roomOptnQebc;
	
	@Autowired
	IEvlQEBC evlQebc;
	
	
	public HotelSVCImpl() {
	}
	
	@Override
	public String insert(Model model, HotelDTO hotelDto, MultipartFile file) 
	{
		// String hotelTel = hotelDto.getHotelTel();    단건조회용
		
		
		String serialNo1 = hotelQebc.hotelSerialNo();
		hotelDto.setHotelNo(serialNo1);
	  
		String newFile=hotelDto.getHotelNm()+".jpg";    

	
	try(

	
	      FileOutputStream fos = new FileOutputStream("C:\\2005LDK\\WS\\projectT3\\src\\main\\webapp\\resources\\img\\" + newFile);
													
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


	    hotelDto.setHotelPhoto(newFile);
		
		hotelMebc.hotelInsert(hotelDto);
		return "redirect:/hotelAdSltMulti?div=0&value=0&PAGENO=1";  
		
	}

	@Override
	public String delete(Model model, String hotelNo) {
		HotelDTO hotelDto = hotelMebc.hotelSltOneMEBC(hotelNo);
		
		if(hotelDto == null)
		{
			model.addAttribute("ERR", "해당 호텔이  존재하지않습니다..");
			return "Err";
		}
		
		hotelMebc.hotelDelete(hotelNo);
		return null;
	}

	@Override
	public String update(Model model, HotelDTO hotelDto, MultipartFile file) {
	  
		String newFile=hotelDto.getHotelNm()+".jpg";    
	
		try(
	
	
		      FileOutputStream fos = new FileOutputStream("C:\\2005RJY\\\\workspace\\projectT3\\src\\main\\webapp\\resources\\img\\" + newFile);
														
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
	
	
		    hotelDto.setHotelPhoto(newFile);
			
			
			hotelMebc.hotelUpdate(hotelDto);
			
			return "redirect:/hotelAdSltMulti?div=0&value=0&PAGENO=1"; 
	}

	@Override
	public String adSltMulti(Model model, String div, String value, int page)  {
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
		
		List<HotelDTO> list = null;
		
		if(div.equals("Address"))
		{
			list = hotelQebc.hotelSltAddress(value, start, cnt);
		}
		else
		{
			list = hotelQebc.hotelSltName(value, start, cnt);
		}
		
		if(list.size() == 0)
			return null;
		
		if(list.size() < MAXCNT + 1)
		{
			next = false;
		}
		else
		{
			list.remove(MAXCNT);
			next = true;
		}
		
		if(page == 1)
			pre = false;
		else
			pre = true;
		
		model.addAttribute("PRE", pre);
		model.addAttribute("NEXT",next);
		model.addAttribute("LIST", list);
		model.addAttribute("PAGENO", page);
		
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
		
			List<HotelDTO> hotelList = hotelQebc.hotelSltSearch(value, start, cnt);
			if(hotelList.size() == 0)
				return null;
			
			if(hotelList.size() < MAXCNT + 1)
			{
				next = false;
			}
			else
			{
				hotelList.remove(MAXCNT);
				next = true;
			}
			if(page == 1)
				pre = false;
			else
				pre = true;
			
			model.addAttribute("PRE", pre);
			model.addAttribute("NEXT",next);
			model.addAttribute("HOTELLIST", hotelList);
			model.addAttribute("PAGENO", page);
		return null;
	}

	
	@Override
	public String mbrSltDateMulti(Model model, String value, int page,String date) {
		
		int aMAXCNT = 5;
		
		
		if("".equals(date)) {
			  Date d = new Date(); // 날짜
				SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd");
				String date3 = date2.format(d);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(d);
				cal.add(Calendar.DATE, 1);
					String date4 = date2.format(cal.getTime());
				
			date = date3+" / "+date4;  
		}
		
		String fy =date.substring(0,4);
		String fm = date.substring(5,7);
		String fd = date.substring(8,10);
		
		String ly =date.substring(13,17);
		String lm = date.substring(18,20);
		String ld = date.substring(21,23);
	
		
		
		String checkIn=fy+fm+fd;
		String checkOut=ly+lm+ld;
		
		if(page == 0)
		{
			page =  1;
		}
		
		int start = (page - 1) * aMAXCNT + 1;
		int cnt = aMAXCNT + 1;
		
		if(value.equals("0"))
		{
			value = "%";
		}
		
			List<HotelEvlDTO> hotelEvlList = hotelQebc.sltHotelEvl(value, start, cnt);
			List<HotelDTO> hotelList = hotelQebc.hotelSltSearch(value, start, cnt);
			if(hotelList.size() == 0)
				return null;
			
			if(hotelEvlList.size() < aMAXCNT + 1)
			{
				next = false;
			}
			else
			{
				hotelEvlList.remove(aMAXCNT);
				next = true;
			}
			if(page == 1)
				pre = false;
			else
				pre = true;
			
			model.addAttribute("PRE", pre);
			model.addAttribute("NEXT",next);
			model.addAttribute("HOTELLIST", hotelEvlList);
			model.addAttribute("PAGENO", page);
			 model.addAttribute("CHECKIN",checkIn);
			    model.addAttribute("CHECKOUT",checkOut);
			    model.addAttribute("DATE",date);
			    model.addAttribute("VALUE",value);
		return null;
	}
	
	
	@Override
	@ResponseBody  
	public List<HotelEvlDTO> mbrSltDateMultiAjax(Model model, String value, int page,String date) {
		
		
		int aMAXCNT = 5; 
		
		if("".equals(date)) {
			  Date d = new Date(); // 날짜
				SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd");
				String date3 = date2.format(d);
			Calendar cal = Calendar.getInstance();
			cal.setTime(d);
			cal.add(Calendar.DATE, 1);
				String date4 = date2.format(cal.getTime());
				
			date = date3+" / "+date4;  
		}
		
		if(page == 0)
		{
			page =  1;
		}
		
		int start = (page - 1) * aMAXCNT + 1;
		int cnt = aMAXCNT + 1;
		
		if(value.equals("0"))
		{
			value = "%";
		}
		List<HotelEvlDTO> hotelList = hotelQebc.sltHotelEvl(value, start, cnt);
		//	List<HotelDTO> hotelList = hotelQebc.hotelSltSearch(value, start, cnt);
			if(hotelList.size() == 0)
				return null;
			
			if(hotelList.size() < aMAXCNT + 1)
			{
				next = false;
			}
			else
			{
				hotelList.remove(aMAXCNT);
				next = true;
			}
			if(page == 1)
				pre = false;
			else
				pre = true;
			
		/*	JSONObject jsonObj = new JSONObject();
			jsonObj.put("RESULT",hotelList);
			
			String jsonOut = jsonObj.toString();*/
		return hotelList;
	}
	
	
	@Override
	public HotelDTO sltOne(Model model, String hotelNo) {

		HotelDTO hotelDto = hotelMebc.hotelSltOneMEBC(hotelNo);
		
		model.addAttribute("HOTELDTO", hotelDto);
		
//		String TEST = "아아아아아아";
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("RESULT", hotelDto);
//		jsonObj.put("TEST", TEST);
		return hotelDto;
	}

	@Override
	public String mainSltMulti(Model model, HttpSession session, String value, int page) {
		if(page == 0)
		{
			page =  1;
		}
		
		int start = (page - 1) * MAXCNT + 1;
		
		
		if(value.equals("0"))
		{
			value = "%";
		}
		
			List<HotelDTO> hotelList = hotelQebc.hotelSltSearch(value, start,4);
			if(hotelList.size() == 0)
				return null;
			
			if(hotelList.size() < MAXCNT + 1)
			{
				next = false;
			}
			else
			{
				hotelList.remove(MAXCNT);
				next = true;
			}
			if(page == 1)
				pre = false;
			else
				pre = true;
			
			model.addAttribute("PAGENO", page);
		    session.setAttribute("HOTELLIST",hotelList);
		   
	     	return null;
	}

	@Override
	public String mbrSltRoom(Model model, String page, String hotelNo) {
		
		int page1=Integer.parseInt(page);
		int start = (page1 - 1) * MAXCNT + 1;
		int cnt = MAXCNT + 1;
		
		HotelDTO hotelDto =hotelMebc.hotelSltOneMEBC(hotelNo);
		List<RoomDTO> list =hotelQebc.roomSltMulti(hotelNo, start, cnt);
		List<RoomOptnJoinDTO> optnList = null;
		
		@SuppressWarnings("rawtypes")
		List<List> lll = new ArrayList<List>();
		for(int i = 0; i < list.size();i++) 
		{
			
			String roomNo = list.get(i).getRoomNo();
		//객실번호별 for문 돔

			optnList = hotelQebc.roomOptnSltMulti(roomNo);
			
			List<String> ll = new ArrayList<String>();
			for (RoomOptnJoinDTO element : optnList)
			{
				ll.add(element.getRoomOptnNm());
			}
			lll.add(ll);
			
			model.addAttribute("gogo", lll);
			
		};
		
		model.addAttribute("HOTEL", hotelDto);
		model.addAttribute("ROOMLIST", list);
		
		model.addAttribute("ROOMOPTN" , optnList);
		
		return null;
		
	}
	
}