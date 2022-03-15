package co.kr.hotel.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.service.MypageService;

@Controller
public class MypageController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MypageService service;
	
	
	@GetMapping(value="/tomemberboardlist")
	public ModelAndView tomemberboardlist() {
		
		logger.info("리스트 요청");
		
		return service.tomemberboardlist();
	}
		
}