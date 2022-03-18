package co.kr.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dao.BoardDAO;
import co.kr.hotel.dto.BoardDTO;

@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardDAO dao;

	public ModelAndView detail(String board_num) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detail");
		BoardDTO dto = dao.detail(board_num);
		mav.addObject("board", dto);		
		return mav;
	}
	
	//리스트
	public ModelAndView list() {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list");
		ArrayList<BoardDTO> list = dao.list();		
		logger.info("리스트 갯수 : {}",list.size());
		mav.addObject("list", list);
		return mav;
	}
	//글쓰기 
	public void write(HashMap<String, String> params) {
		int row = dao.write(params);
		logger.info(" 입력된 건수 : {}",row);
	}
	
	
	}

