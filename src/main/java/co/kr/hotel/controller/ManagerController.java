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

import co.kr.hotel.dto.ProductDTO;
import co.kr.hotel.service.ManagerService;

@Controller
public class ManagerController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ManagerService service;
	
		@RequestMapping(value = "/adminOrderList", method = RequestMethod.GET)
		public String adminOrderList(Model model, HttpSession session) {
			logger.info("adminOrderList 불러오기");			
			ArrayList<ProductDTO> adOrderList = service.adOrderList();
			logger.info("가져온 리수트 수 : {}", adOrderList.size());
			model.addAttribute("adOrderList", adOrderList);
			String loginId = (String)session.getAttribute("loginId");
			
			String page = "/adminOrderList";
			
			return page;
		}
		 
		@RequestMapping(value = "/writingForm", method = RequestMethod.GET)
		public String writingForm(Model model) {		
			logger.info("writingForm 이동");
			return "writingForm";
		}
		
		@RequestMapping(value = "/writing", method = RequestMethod.POST)
		public String writing(Model model, @RequestParam HashMap<String, String> params) {	
			logger.info("writing 요청 : {}",params);			
			String page = "redirect:/adminOrderList"; 
			
			service.writing(params);
			//return "adminOrderList";
			return page;
		}
		
		@RequestMapping(value = "/del", method = RequestMethod.GET)
		public String del(Model model, HttpSession session, @RequestParam String product_num) {
			logger.info("삭제 요청: {}",product_num); 
			String page = "redirect:/";
			
			if(session.getAttribute("loginId")!=null) {
				page = "redirect:/adminOrderList"; 
				int success = service.del(product_num);
				logger.info("삭제 여부 : {}",success);
			}
			return page;
		}		
		
		@RequestMapping(value = "/detailing", method = RequestMethod.GET)
		public String detailing(Model model, @RequestParam String product_num) {
			logger.info("상세보기 요청: {}",product_num); //detail은 메서드 이름이라 부름; url을 통해서 보내는것 get; 왠만하면 get
			//session 에서 특정 속성만 제거하면 되기 떄문에 서비스와 DAO를 탈 필요가 없다. 
			
			ProductDTO dto =service.detailing(product_num);
			model.addAttribute("info",dto);
			
			return "detailing";
		}	
		
		@RequestMapping(value = "/updating", method = RequestMethod.POST)
		public String updating(Model model, 
				@RequestParam HashMap<String, String> params) {
				service.updating(params);
			return "redirect:/";
		}		
		
	}

