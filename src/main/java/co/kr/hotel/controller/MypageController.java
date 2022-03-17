package co.kr.hotel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dto.MemberDTO;

import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.PageDto;

import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.service.MypageService;



@Controller
public class MypageController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageService mypageService;

	// 20220314 마이페이지 START - SI
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {
		logger.info("myPage 요청");
		
		String page = "index";

		// 메인페이지 요청 세션검사 추가 START - SI 20220314
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null) {
			model.addAttribute("loginId", loginId);
			page = "myPage";
			
			// 서비스
			MemberDTO result = mypageService.myInfo(loginId);
			
			model.addAttribute("result", result);
			logger.info("투숙횟수 확인! : {}", result.getReserve_cnt_year());
			
		}
		// 메인페이지 요청 세션검사 추가 END - SI 20220314

		
		return page;


	}
	// 20220314 마이페이지 작업 END - SI

	// 마이페이지 예약리스트 START 20220314
	@RequestMapping(value = "/myReserve", method = RequestMethod.GET)
	public String myReserve(Model model, HttpSession session) {
		logger.info("myReserve로 요청이 들어옴 ");

		// 세션 확인 후 페이지 분기 - SI 20220315
		String page = "index";

		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		
		if (loginId != null) {
			page = "myReserve";

			// 서비스 일 시키기
			ArrayList<ReserveDTO> result = mypageService.myReserve(loginId);

			model.addAttribute("result", result);
			
			logger.info("result : {}", result.size());
			logger.info("idx가 필요한데 안나와요 : {}", result.get(0).getReserve_idx());
			logger.info("음음 : {}", result.get(0).getReserve_num());

			
		}
		return page;
	}
	// 마이페이지 예약리스트 START 20220314
	
	// 20220314 예약 상세보기 START - SI
	@RequestMapping(value = "/reserveDetail", method = RequestMethod.GET)
	public String reserveDetail(Model model, HttpSession session) {

		logger.info("reserveDetail 요청");

		// 메인페이지 요청 세션검사 추가 START - SI 20220314
		String loginId = (String) session.getAttribute("loginId");
		// loginId = "admin"; // 아이디 'admin' 일 때
		//loginId = "아이디";

		if (loginId != null) {
			model.addAttribute("loginId", loginId);
		}
		// 메인페이지 요청 세션검사 추가 END - SI 20220314

		return "mypage4";

	}
	// 20220314 예약 상세보기 END - SI

	// 마이페이지 예약리스트 END 20220314

	// 마이페이지 - 환불리스트 유선화 START 20220314
	@RequestMapping(value = "/mypageRefundDetail", method = RequestMethod.GET)
	public String mypageRefundDetail(Model model, 
			@RequestParam String reserve_num, 
			@RequestParam int reserve_idx) {
		logger.info("mypage2Reserve 환불현황상세 ");
		// 최근 예약
		String userId = "yuseonhwa"; //

		logger.info("reserve_num : " + reserve_num);
		
		MypageDTO reserDto = new MypageDTO();
		
		reserDto = mypageService.reserInfo(userId, reserve_idx);
		model.addAttribute("reserInfo", reserDto);

		ReserveDTO payDto = new ReserveDTO();
		payDto = mypageService.payDto(reserve_num);
		model.addAttribute("payInfo", payDto);

		return "mypageRefundDetail";
	}

		
	// 2022.03.14  문의페이지 리스트 박형민
		@GetMapping(value="/tomemberboardlist")
		public ModelAndView tomemberboardlist() {
			
			logger.info("리스트 요청");
			
			return mypageService.tomemberboardlist();
		}
	//2022.03.15 문의페이지 리스트 end
		
		
	

	// 마이페이지 - 환불리스트 유선화 END 20220314

	// 마이페이지 END yuseonhwa 20220314
	
	
	//2022.03.15 문의페이지 리스트 end

	//마이페이지 마일리지리스트 유선화 START 2022.03.15
		
		
	@RequestMapping(value = "/myPagemilelist", method = RequestMethod.GET)
	public String myPagemymilelist(Model model, HttpSession session,
			@RequestParam(value="orderNum") int orderNum
			) {
		logger.info("myPagemilelist 마이페이지 마일리지 조회 페이지 ");
		String page = "index";
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("loginId : "+loginId);
		
		if (loginId != null) {
			page = "myPagemilelist";	
		}
		
		ArrayList<MypageDTO> mypageDto = mypageService.myPagemilelist(loginId);
		model.addAttribute("myPagemilelist" , mypageDto);
		
		// 마일리지 리스트 페이징 START 유선화 2022.03.16
		PageDto milelistPage = new PageDto();		
		milelistPage.setNum(orderNum);
		milelistPage.setCount(mypageService.milelistCount(loginId));		
		ArrayList<MemberDTO> milelist = 
				mypageService.milelistInfo(milelistPage.getDisplayPost(), milelistPage.getPostNum(),loginId);
		model.addAttribute("milelist", milelist); //리스트 보내기
		model.addAttribute("milelistPage", milelistPage); //페이징처리
		model.addAttribute("milelistNum", orderNum);//페이징처리		
		// 마일리지 리스트 페이징 END 유선화 2022.03.16
		
		MypageDTO mypagedto = new MypageDTO();
		mypagedto = mypageService.mypagedto(loginId);
		model.addAttribute("mypageInfo", mypagedto);
		
		
		
		
		
		return page;
	}
		
		
		
		
	//마이페이지 마일리지리스트 유선화 END 2022.03.15
	
	//마이페이지 회원리스트 유선화 START 2022.03.16
	
	
	@RequestMapping(value = "/myPagemyProfile", method = RequestMethod.GET)
	public String myPagemyProfile(Model model, HttpSession session) {
		String page = "index";
		logger.info("myPagemyProfile 마이페이지 마일리지 조회 페이지 ");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("loginId : "+loginId);
		if (loginId != null) {
			page = "myPagemyProfile";	
		}
		MypageDTO mypagedto = new MypageDTO();
		mypagedto = mypageService.mypagedto(loginId);
		
		model.addAttribute("mypageInfo", mypagedto);
		
		
		MemberDTO memberDto = new MemberDTO();
		memberDto = mypageService.memberlist(loginId);
		String pw = memberDto.getMem_pw();
		logger.info("memberlist controller pw : "+pw);
		
		model.addAttribute("memberlist", memberDto);
		
		
		
		return page;
	}	
		
		
	//마이페이지 회원리스트 유선화 END 2022.03.16
		
		
		
		
		
		

}

