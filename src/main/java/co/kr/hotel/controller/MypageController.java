package co.kr.hotel.controller;

import java.util.ArrayList;

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
import co.kr.hotel.service.MypageService;

@Controller
public class MypageController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageService mypageService;
	
	//마이페이지 START yuseonhwa 20220314
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String mypage2(Model model,HttpSession session) {
		logger.info("mypage2로 요청이 들어옴 ");
		
		
		return "mypage2";
	}
	
	//마이페이지 예약리스트 START 20220314 
	@RequestMapping(value = "/mypage2Reservelist", method = RequestMethod.GET)
	public String mypage2Reservelist(Model model,HttpSession session) {
		logger.info("mypage2Reservelist로 요청이 들어옴 ");
		//나중에 로그인 세션처리 해줄 것
		String loginId = "yuseonhwa"; 

		ReserveDTO resernumdto = new ReserveDTO();
		
		resernumdto = mypageService.resernum(loginId);
		logger.info("resernumdto : "+resernumdto);
		
		
		
		ArrayList<ReserveDTO> dto = mypageService.mypage2Reservelist(loginId);
		model.addAttribute("mypage2Reservelist", dto);
		logger.info("dto : ",dto);
		
		
		return "mypage2Reservelist";
	}
	
	
	//마이페이지 예약리스트 END 20220314 
	
	//마이페이지 - 환불리스트 유선화 START 20220314
	@RequestMapping(value = "/mypageRefundDetail", method = RequestMethod.GET)
	public String mypageRefundDetail(Model model,@RequestParam String reserve_num,@RequestParam int reserve_idx) {
		logger.info("mypage2Reserve 환불현황상세 ");
		//최근 예약 
		String userId = "yuseonhwa"; // 
		
		logger.info("reserve_num : "+reserve_num);
		ReserveDTO reserDto = new ReserveDTO();
		reserDto = mypageService.reserInfo(userId,reserve_num);
		model.addAttribute("reserInfo", reserDto);
		
		ReserveDTO payDto = new ReserveDTO();
		payDto = mypageService.payDto(reserve_num);
		model.addAttribute("payInfo", payDto);
		
		return "mypageRefundDetail";
	}
	
	//마이페이지 - 환불리스트 유선화 END 20220314
	
	//마이페이지 END yuseonhwa 20220314
	
	
	
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
















