package co.kr.hotel.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	@RequestMapping(value = "/AdminQnaWriteForm", method = RequestMethod.GET)
	public String writeForm(Model model , @RequestParam HashMap<String, String> params) {
		
		logger.info("AdminQnaWriteForm 이동");
		model.addAttribute("board_orinum",params.get("board_orinum").toString());

		
		//유선화 START
		
		
		//유선화 END
		
		return "AdminQnaWriteForm";
	}
	//글쓰기 요청명 
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> params , String board_orinum) {

		logger.info("write 요청 : {}",params);
		logger.info("write 답글 : {}" ,board_orinum);
		service.write(params);
		
		return "redirect:/AdminQnalist";
	}
	//상세보기 
	@GetMapping(value="/AdminQnaDetail")
	public ModelAndView detail(@RequestParam String board_num,HttpSession session) {
		logger.info("상세보기 요청 :{} ",board_num);
		return service.detail(board_num,session);
	}
	// 2022.03.14  문의페이지 리스트 박형민
	@GetMapping(value="/AdminQnalist")
	public ModelAndView list() {
		
		logger.info("리스트 요청");
		
		return service.list();
	}
	

	
	
			
			
}
