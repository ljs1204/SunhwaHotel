package co.kr.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.service.ReserveService;

@Controller
public class ReserveController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReserveService service;

	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(Model model,HttpSession session) {
		
		
		
		logger.info("reservation 페이지 요청이 들어옴 ");
		
		return "reservation";
	}
	
	
	//메인페이지 -> 객실 예약하기 페이지 요청 유선화 START 20220311
	
	@RequestMapping(value = "/reserveRoomslist", method = RequestMethod.GET)
	public String rooms( Model model) {
		
		
		
		
		logger.info("rooms로 요청이 들어옴 ");
		
		return "reserveRoomslist";
	}
	
	//메인페이지 -> 객실 예약하기 페이지 요청 유선화 END 20220311
	
	
	//객실 옵션 페이지 이지선 START 220315
	
	 //객실 옵션 페이지 접속 리스트 불러오기	
	 @RequestMapping(value = "/reservation_option", method = RequestMethod.GET)
		public String reservation_option(Model model,HttpSession session) { 
			logger.info("reservation_option 요청");
			
			//옵션 값 불러오기
			ArrayList<HashMap<String, String>> option = service.reservation_option();
			logger.info("받아온 값 확인 {}",option);
			model.addAttribute("option",option);
			
			//마일리지 상품 4가지 불러오기
			ArrayList<HashMap<String, String>> product = service.reservation_product();
			logger.info("받아온 값 확인 {}",product);
			model.addAttribute("product",product);
			
			//회원님의 마일리지 불러오기
			//테스트하고 로그인 세션체크로 바꾸기 ★
			//String loginId = (String)session.getAttribute();
			String loginId = "testid";
			int useable = service.useable(loginId);
			model.addAttribute("useable", useable);
			
			
			
			return "reservation_option"; 
	 }
	
	 
	@RequestMapping(value = "/toReserveOrder", method = RequestMethod.GET)
		public String toReserveOrder(Model model,HttpSession session,
				@RequestParam Map<String, String> params) {
		logger.info("toReserveOrder 요청 : {}",params);
		
		String userId = "seon119";
		//params.replace("userId", userId);
		
		
		ReserveDTO dto = new ReserveDTO();
		dto.setMem_id(params.get("userId"));
		dto.setAdd_requests(params.get("ADD1"));
	
		service.roomOne(dto);
		
		int reserve_idx = dto.getReserve_idx();
		logger.info("reserve_idx : "+reserve_idx);
		
		if(reserve_idx > 0 ) {
			logger.info("pay insert");
			
		}
	
		
		
		return "toReserveOrder";
	}
		
	 
	 
	 
	//객실 옵션 페이지 이지선 END 220315
	
	
	@RequestMapping(value = "/doReservation", method = RequestMethod.GET)
	public String doReservation(Model model,HttpSession session) {
		
		return "doReservation";
	}
	

	
	
		
}
