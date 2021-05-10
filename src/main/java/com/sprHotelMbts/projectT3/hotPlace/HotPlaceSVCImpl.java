package com.sprHotelMbts.projectT3.hotPlace;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Service("hotPlaceSvc")
public class HotPlaceSVCImpl implements IHotPlaceSVC {

	@Autowired
	IHotPlaceMEBC hotMebc;
	@Autowired
	IHotPlaceQEBC hotQebc;
	
	
	@Override
	public String sltAll(int pageNo, Model model) {
	
		
		
		List<HotDTO> list =null;
		int cnt = 5;
		int page = ((pageNo-1)*cnt)+1;
		
		list = (List<HotDTO>)hotQebc.sltAll(page, cnt);
		model.addAttribute("LIST",list);
		
		return "hotMgPage";
	}

	
	@Override
	public String sltMulti(String div, String value, int pageNo, Model model) {
		List<HotDTO> list=null;
		int maxcnt = 5;
		int page = ((pageNo-1)*maxcnt)+1;
		if(div.equals("nm"))
		{
			list = (List<HotDTO>)hotQebc.sltName(value, page, 5);
			model.addAttribute("LIST", list);
		}
		else
		{
			 list = (List<HotDTO>)hotQebc.sltAddress(value, page, 5);
			model.addAttribute("LIST", list);
		}
			
			return "hotMgPage";
	}

	@Override
	public String insert(HotDTO hotDto, Model model,MultipartFile file) {

		String newFile=hotDto.getHotNm()+".jpg";    
		try(
		      
		      FileOutputStream fos = new FileOutputStream("C:\\2005RJY\\WS\\projectT3\\src\\main\\webapp\\resources\\img\\" + newFile);
				    		
		      InputStream is = file.getInputStream();
				    		
		    ){
		      int readCount = 0;
		      byte[] buffer = new byte[1024];
		      while((readCount = is.read(buffer)) != -1){
		      fos.write(buffer,0,readCount);
		    }
		    }catch(Exception ex){
		      throw new RuntimeException("file Save Error");
		    }

		hotDto.setPhoto(newFile);
		
		hotMebc.insert(hotDto);
		
		return "main";
	
	
	}

	@Override
	public String update(HotDTO hotDto, Model model) {
		
		hotMebc.update(hotDto);
		return null;
	}

	@Override
	@ResponseBody
	public String delete(String hotNo, Model model) {
		HotDTO dto = hotMebc.sltOne(hotNo);
		
		if(dto ==null) {
			return "Err";
		}
		else {
			
		}	
		String result="가가가가";
		String test = "111111";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		jsonObj.put("test", test);
		
		hotMebc.delete(hotNo);
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}


}
