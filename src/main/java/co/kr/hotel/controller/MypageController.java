package co.kr.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
			//logger.info("투숙횟수 확인! : {}", result.getReserve_cnt_year());
			
		}
		// 메인페이지 요청 세션검사 추가 END - SI 20220314

		
		return page;


	}
	// 20220314 마이페이지 작업 END - SI

	// 마이페이지 예약리스트 START 20220314
	@RequestMapping(value = "/myReserve", method = RequestMethod.GET)
	public String myReserve(Model model, HttpSession session, @RequestParam("num") int num) {
		logger.info("myReserve로 요청이 들어옴 ");

		// 세션 확인 후 페이지 분기 - SI 20220315
		String page = "index";

		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		
		if (loginId != null) {
			page = "myReserve";

			// 서비스 일 시키기 -> 반환값 hashmap
			HashMap<String, Object> result = mypageService.myReserve(loginId, num);
			
// 20220317 페이징 => hashmap 풀기
			int count = (int) result.get("count");			// 쿼리 rows 갯수
			ArrayList<ReserveDTO> processAll = (ArrayList<ReserveDTO>) result.get("processAll");	// 쿼리 결과(5개)
			int pageNum = (int) result.get("pageNum");		// 페이지 끝번호

			logger.info("cnt, pageNum : {},{}", count, pageNum);
			logger.info("processAll : {}", processAll);

			model.addAttribute("cnt", count);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("result", processAll);	// 페이징 전에 이게 result로 보내지고 있어서 그냥 이렇게..
			model.addAttribute("size", processAll.size());
			
// 20220317 페이징 10개씩 자르기 SI - START
			int startPageNum = (int) result.get("startPageNum");
			int endPageNum = (int) result.get("endPageNum");
			int pageNum_cnt = (int) result.get("pageNum_cnt");
			
			boolean prev = startPageNum == 1 ? false : true;
			boolean next = endPageNum * pageNum_cnt >= count ? false : true;
			
			logger.info("startPageNum : {}", startPageNum);
			logger.info("endPageNum : {}", endPageNum);
			logger.info("pageNum_cnt : {}", pageNum_cnt);
			
			logger.info("prev : {}", prev); 
			logger.info("next : {}", next);
			
			// 시작 및 끝 번호
			 model.addAttribute("startPageNum", startPageNum);
			 model.addAttribute("endPageNum", endPageNum);

			 // 이전 및 다음 
			 model.addAttribute("prev", prev);
			 model.addAttribute("next", next);
			
			 // 현재 페이지
			 model.addAttribute("select", num);
// 20220317 페이징 10개씩 자르기 SI - END
			 
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

		
	
	//2022.03.15 문의페이지 리스트 end
		
		
	

	// 마이페이지 - 환불리스트 유선화 END 20220314

	// 마이페이지 END yuseonhwa 20220314
	
	//글쓰기
	@RequestMapping(value = "/tomemberboardwriteForm", method = RequestMethod.GET)
	public String tomemberboardwriteForm(Model model , HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		
		logger.info("writeForm 이동");
		return "tomemberboardwriteForm";
	}
	//글쓰기 요청명 
	@RequestMapping(value = "/tomemberboardwrite", method = RequestMethod.POST)
	public String tomemberboardwrite(Model model, @RequestParam HashMap<String, String> params , HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		// loginId = "admin"; // 아이디 'admin' 일 때
		//loginId = "아이디";

		ModelAndView mv = new ModelAndView();
		mv.addObject("loginId" , loginId);
		
		
		logger.info("write 요청 : {}",params);
		
		mypageService.tomemberboardwrite(params);
		
		return "redirect:/tomemberboardlist";
	}
	//상세보기 
	@GetMapping(value="/tomemberboarddetail")
	public ModelAndView tomemberboarddetail(@RequestParam String board_num) {
		logger.info("상세보기 요청 :{} ",board_num);
		return mypageService.tomemberboarddetail(board_num);
	}
	// 2022.03.14  문의페이지 리스트 박형민
			@GetMapping(value="/tomemberboardlist")
			public ModelAndView tomemberboardlist(HttpSession session) {
				
				String loginId = (String) session.getAttribute("loginId");
				// loginId = "admin"; // 아이디 'admin' 일 때
				//loginId = "아이디";

				ModelAndView mv = new ModelAndView();
				mv.addObject("loginId" , loginId);
				
				logger.info("login id : {}", loginId);	
				
				logger.info("리스트 요청");
				
				return mypageService.tomemberboardlist(loginId);
			}
	

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

