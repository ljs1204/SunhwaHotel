package co.kr.hotel.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String writeForm(Model model) {		
		logger.info("writeForm 이동");
		return "writeForm";
	}
	//글쓰기 요청명 
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> params) {		
		logger.info("write 요청 : {}",params);
		service.write(params);
		return "redirect:/";
	}
	//상세보기 
	@GetMapping(value="/detail")
	public ModelAndView detail(@RequestParam String board_num) {
		logger.info("상세보기 요청 :{} ",board_num);
		return service.detail(board_num);
	}
	
	//리스트
	@GetMapping(value="/list")
	public ModelAndView list() {
		return service.list();
		
	}
}
