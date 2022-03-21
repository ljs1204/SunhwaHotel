package co.kr.hotel.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.service.BoardService;

@Controller
public class BoardController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;
	
	//글쓰기
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model , String board_orinum) {
		
		//String board_orinum = (int)board_orinum.get
		
		logger.info("board_orinum : "+board_orinum );
		logger.info("writeForm 이동");
		
		//ModelAttribute("board_orinum" , board_orinum);
		ModelAndView mv = new ModelAndView();
		mv.addObject ("board_orinum" ,board_orinum);
		
		
		//유선화 START
		
		
		//유선화 END
		
		return "writeForm";
	}
	//글쓰기 요청명 
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> params , String board_orinum) {

		logger.info("write 요청 : {}",params);
		service.write(params);
		
		return "redirect:/list";
	}
	//상세보기 
	@GetMapping(value="/detail")
	public ModelAndView detail(@RequestParam String board_num) {
		logger.info("상세보기 요청 :{} ",board_num);
		return service.detail(board_num);
	}
	// 2022.03.14  문의페이지 리스트 박형민
			@GetMapping(value="/list")
			public ModelAndView list() {
				
				logger.info("리스트 요청");
				
				return service.list();
			}
	}
