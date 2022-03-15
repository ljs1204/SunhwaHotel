package co.kr.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dao.MypageDAO;
import co.kr.hotel.dto.MypageDTO;

@Service
public class MypageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageDAO dao;
	
	public ModelAndView tomemberboardlist() {
		
		logger.info("Mypage 서비스 시작");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tomemberboardlist");
		ArrayList<MypageDTO> tomemberboardlist = dao.tomemberboardlist();		
		logger.info("리스트 갯수 : {}",tomemberboardlist.size());
		mav.addObject("tomemberboardlist", tomemberboardlist);
		return mav;
	}
}
