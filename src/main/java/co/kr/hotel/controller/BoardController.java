package co.kr.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.PageDto;
import co.kr.hotel.service.BoardService;

@Controller
public class BoardController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	BoardService service;

	// 글쓰기
	@RequestMapping(value = "/AdminQnaWriteForm", method = RequestMethod.GET)
	public String writeForm(Model model, @RequestParam HashMap<String, String> params) {

		logger.info("AdminQnaWriteForm 이동");
		model.addAttribute("board_orinum", params.get("board_orinum").toString());

		// 유선화 START

		// 유선화 END

		return "AdminQnaWriteForm";
	}

	// 글쓰기 요청명
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> params, String board_orinum) {

		logger.info("write 요청 : {}", params);
		logger.info("write 답글 : {}", board_orinum);
		service.write(params);

		return "redirect:/AdminQnalist";
	}

	// 상세보기
	@GetMapping(value = "/AdminQnaDetail")
	public ModelAndView detail(@RequestParam String board_num, HttpSession session) {
		logger.info("상세보기 요청 :{} ", board_num);
		return service.detail(board_num, session);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam String board_num) {		
		logger.info("삭제요청 : {}",board_num);		
		service.delete(board_num);
		logger.info("삭제요청2 : {}",board_num);	
		return "redirect:/AdminQnalist";
	}
		
	// 2022.03.14 문의페이지 리스트 박형민
	@GetMapping(value = "/AdminQnalist")
	public String list(Model model,@RequestParam(value = "orderNum") int orderNum,HttpSession session) {

		// adminQnA 리스트 페이징 START 이지선 20220324
		String userId= (String) session.getAttribute("userId");
		model.addAttribute("userId", userId);
		
		 PageDto adminPage = new PageDto(); adminPage.setNum(orderNum);
		 adminPage.setCount(service.count());
		 ArrayList<BoardDTO> qnalist = service.listInfo(adminPage.getDisplayPost(),adminPage.getPostNum());
		 model.addAttribute("list", qnalist);
		 model.addAttribute("listPage", adminPage);//페이징처리
		 model.addAttribute("listNum", orderNum);//페이징처리
		 
		// adminQnA 리스트 페이징 END
		 
		logger.info("리스트 요청");
		//return service.list();
		return "AdminQnalist";
	}

}
