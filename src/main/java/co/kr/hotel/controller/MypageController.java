package co.kr.hotel.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
// 20220314 마이페이지 START - SI	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {

		logger.info("myPage 요청");
		
		
		// 메인페이지 요청 세션검사 추가 START - SI 20220314  
		String loginId = (String) session.getAttribute("loginId");
		//loginId = "admin";	// 아이디 'admin' 일 때
		loginId = "아이디";
		
		if(loginId != null) {
			model.addAttribute("loginId", loginId);
		}
		// 메인페이지 요청 세션검사 추가 END - SI 20220314
		
		return "mypage2";
		
	}
// 20220314 마이페이지 작업 END - SI
	
	
// 20220314 내 예약 조회 START - SI	
		@RequestMapping(value = "/myReserve", method = RequestMethod.GET)
		public String myReserve(Model model, HttpSession session) {

			logger.info("myReserve 요청");
			
			
			// 메인페이지 요청 세션검사 추가 START - SI 20220314  
			String loginId = (String) session.getAttribute("loginId");
			//loginId = "admin";	// 아이디 'admin' 일 때
			loginId = "아이디";
			
			if(loginId != null) {
				model.addAttribute("loginId", loginId);
			}
			// 메인페이지 요청 세션검사 추가 END - SI 20220314
			
			return "mypage3";
			
		}
// 20220314 내 예약 조회 END - SI	
		
		
// 20220314 예약 상세보기 START - SI	
			@RequestMapping(value = "/reserveDetail", method = RequestMethod.GET)
			public String reserveDetail(Model model, HttpSession session) {

				logger.info("reserveDetail 요청");
				
				
				// 메인페이지 요청 세션검사 추가 START - SI 20220314  
				String loginId = (String) session.getAttribute("loginId");
				//loginId = "admin";	// 아이디 'admin' 일 때
				loginId = "아이디";
				
				if(loginId != null) {
					model.addAttribute("loginId", loginId);
				}
				// 메인페이지 요청 세션검사 추가 END - SI 20220314
				
				return "mypage4";
				
			}
// 20220314 예약 상세보기 END - SI	
	

				
	
}
















