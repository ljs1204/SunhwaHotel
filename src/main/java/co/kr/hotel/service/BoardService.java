package co.kr.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dao.BoardDAO;
import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.PageDto;

@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardDAO dao;

	public ModelAndView detail(String board_num,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AdminQnaDetail"); // jsp 변경 
		//유선화 답글은 답글 문의글은 문의글이라고 표시 하기
		String mem_grade= (String) session.getAttribute("mem_grade");
		String loginId= (String) session.getAttribute("loginId");
		
		mav.addObject("mem_grade", mem_grade);
		mav.addObject("loginId", loginId);
		
		BoardDTO dto = dao.detail(board_num);
		mav.addObject("board", dto);		
		return mav;
	}
	
	//리스트 
	public ModelAndView list() {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AdminQnalist");
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
	
	public ModelAndView writeForm(String board_num) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AdminQnalist");
		BoardDTO dto = dao.detail(board_num);
		mav.addObject("board_num" , dto);
		return mav;
	}

	public int count() {
		// TODO Auto-generated method stub
		return dao.count();
	}

	public ArrayList<BoardDTO> listInfo(int displayPost, int postNum) {
		PageDto dto = new PageDto();
		dto.setPostNum(postNum);
		dto.setDisplayPost(displayPost);
		return dao.listInfo(displayPost,postNum);
	}
	
	public void delete(String board_num) {		
		int success = dao.delete(board_num);
		logger.info("삭제 완료 여부 : "+success);
	}


	}

