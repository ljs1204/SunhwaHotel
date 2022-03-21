package co.kr.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.kr.hotel.dto.MileagePhotoDTO;
import co.kr.hotel.dto.ProductDTO;
import co.kr.hotel.service.ManagerService;

@Controller
public class ManagerController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	 @Autowired ManagerService service;
	
		@RequestMapping(value = "/adminOrderList", method = RequestMethod.GET)
		public String adminOrderList(Model model, HttpSession session) {
			logger.info("adminOrderList 불러오기");			
			ArrayList<HashMap<String, String>> adOrderList = service.adOrderList();
			logger.info("가져온 리수트 수 : {}", adOrderList.size());
			model.addAttribute("adOrderList", adOrderList);
			String loginId = (String)session.getAttribute("loginId");
			String page = "/adminOrderList";
			
			return page;
		} 
		@RequestMapping(value = "/writingForm", method = RequestMethod.GET)
		public String writeForm(Model model) {		
			logger.info("writingForm 이동");
			return "writingForm";
		}
		
		@RequestMapping(value = "/writing", method = RequestMethod.POST)
		   public String writing(Model model, MultipartFile[] photos,
		         @RequestParam HashMap<String, String> params) {
		      logger.info("글쓰기 페이지 요청"+ params);
		      logger.info("업로드 할 파일 수 : {}",photos.length);
				service.writing(photos,params); 
				return "redirect:/adminOrderList"; 
		}

		
		
}


