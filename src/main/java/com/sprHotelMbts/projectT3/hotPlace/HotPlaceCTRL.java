package com.sprHotelMbts.projectT3.hotPlace;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HotPlaceCTRL {
	
//	@Resource(name="uploadPath")
//	String uploadPath;
	
	@Autowired
	private IHotPlaceSVC hotPlaceSvc;
	
	
	@RequestMapping("hotMgPage")
	public String hotMgPage(Model model, @ModelAttribute("PAGENO") int pageNo) {
		
		model.addAttribute("PAGENO", pageNo );
		
		return "hotMgPage";
	}
	
	@RequestMapping("hotsltAll")
	public String sltAll(Model model, @ModelAttribute("PAGENO") int pageNo) throws Exception {
		
		String viewPage= hotPlaceSvc.sltAll(pageNo, model);
		
		
		return viewPage;
	}
	
	
	@RequestMapping("hotsltMult")
	public String sltMult(Model model, @ModelAttribute("div") String div,
			@ModelAttribute("value") String value, @ModelAttribute("PAGENO") int pageNo) throws Exception{
		model.addAttribute("PAGENO",pageNo);
		
		String viewPage = hotPlaceSvc.sltMulti(div,value, pageNo, model);
		
		return viewPage;
	}
	
	
	@RequestMapping("hotinsert")
	public String insert(Model model, HotDTO hotDto, @RequestParam("file") MultipartFile file,@ModelAttribute("PAGENO") int pageNo)throws Exception{
	
		hotPlaceSvc.insert(hotDto, model,file);
		
		return "hotMgPage";
		
	}
	
	
	@RequestMapping("hotupdate")
	public String update(Model model, HotDTO hotDto, @RequestParam("file") MultipartFile file)throws Exception{
		
		hotPlaceSvc.update(hotDto, model);
		
		return "hotMgPage";
		
	}
	
	@RequestMapping("hotdelete")
	public String delete(Model model, @ModelAttribute("code")String hotNo) throws Exception{
		
		
		String viewPage;
		viewPage = hotPlaceSvc.delete(hotNo, model);
		
		return viewPage;
	}
}
