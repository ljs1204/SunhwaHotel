package co.kr.hotel.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ProductDTO;
import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.dto.RoomDTO;
import co.kr.hotel.service.ManagerService;
import co.kr.hotel.service.MypageService;
import co.kr.hotel.service.ReserveService;

@Controller
public class ManagerController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ManagerService service;
	@Autowired ReserveService reserveservice;
	@Autowired MypageService mypageService;
	
	//유선화 관리자 회원 예약 정보 리스트 페이지(회원1명) START 2022.03.22
	
	
	@RequestMapping(value = "/myReserveAdmin", method = RequestMethod.GET)
	public String myReserve(Model model, HttpSession session, 
			@RequestParam("num") int num,
			@RequestParam("mem_id") String mem_id) {
		logger.info("myReserve로 요청이 들어옴 ");
		String page = "index";
		//String loginId = (String) session.getAttribute("loginId");
		//String loginId = mem_id; // mem_id를 회원 리스트 페이지에서 받아온다  myReserveAdmin?num=1&mem_id=seon119
		String loginId = "seon119";
		model.addAttribute("loginId", loginId);
		
		// 20220319 - 페이징 세션 확인 후 분기( 예약 상세보기에서 '목록으로' 클릭 시 ) START SI
			// 1. session에 페이지 번호 저장
			session.setAttribute("pagingNum", num);
					
			// 2. 저장한 페이지 번호 예약 상세보기에서 불러오기 => 상세보기 요청에서 계속
					
		// 20220319 - 페이징 세션 확인 후 분기( 목록으로 클릭 시 ) END SI
		
		
		
		if (loginId != null) {
			page = "myReserveAdmin";

			// 서비스 일 시키기 -> 반환값 hashmap
			HashMap<String, Object> result = service.myReserveAdmin(loginId, num);
			
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
			
			// 20220317 페이징 5개씩 자르기 SI - START
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
	
	//SI님 덕분~ 
	//유선화 관리자 회원 예약 정보 리스트 페이지(회원1명) END 2022.03.22
	
	
//	@RequestMapping(value = "/AdminRoomReserveDetail", method = RequestMethod.GET)
//	public String AdminRoomReserveDetail(Model model, HttpSession session) {
//		logger.info("AdminRoomReserveDetail 불러오기");
//		
//		String page = "AdminRoomReserveDetail";
//		ArrayList<HashMap<String, String>> product = reserveservice.reservation_product();
//		logger.info("받아온 값 확인 {}",product);
//		model.addAttribute("product",product);
//		
//		
//		return page;
//	}
	
		@RequestMapping(value = "/AdminMileageRegist", method = RequestMethod.GET)
		public String adminOrderList(Model model, HttpSession session) {
			logger.info("adminOrderList 불러오기");			
			ArrayList<ProductDTO> adOrderList = service.adOrderList();
			logger.info("가져온 리수트 수 : {}", adOrderList.size());
			model.addAttribute("adOrderList", adOrderList);
			String loginId = (String)session.getAttribute("loginId");
			model.addAttribute("loginId", loginId);
			String page = "AdminMileageRegist";
			
			return page;
		}
		 
		@RequestMapping(value = "/writingForm", method = RequestMethod.GET)
		public String writingForm(Model model, HttpSession session) {		
			logger.info("writingForm 이동");
			String loginId = (String)session.getAttribute("loginId");
			model.addAttribute("loginId", loginId);
			
			return "writingForm";
		}
		
		@RequestMapping(value = "/writing", method = RequestMethod.POST)
		public String writing(Model model, MultipartFile[] photos,@RequestParam HashMap<String, String> params) {	
			logger.info("writing 요청 : {}",params);
	
			
			
			for(MultipartFile photo : photos) {
				try {
					String oriFileName = photo.getOriginalFilename();//원본 파일명 추출

					byte[] bytes = photo.getBytes();
					
					Path path = Paths.get("C:/photo/"+oriFileName); //경로설정
					Files.write(path, bytes);
					logger.info(oriFileName+" SAVE OK!");
					params.put("product_img", oriFileName);
					service.writing(params);//DB에 저장한 파일명을 기록
					Thread.sleep(1);//파일 중복 피하기위함
					
						
					}catch (Exception e) {
					System.out.println(e.toString());
					e.printStackTrace();
					}
			}
			
			
			
			String page = "redirect:/AdminMileageRegist"; 
			
			//service.writing(params);
			//return "adminOrderList";
			return page;
		}
		
		@RequestMapping(value = "/del", method = RequestMethod.GET)
		public String del(Model model, HttpSession session, @RequestParam String product_num) {
			logger.info("삭제 요청: {}",product_num); 
			String page = "redirect:/";
			
			if(session.getAttribute("loginId")!=null) {
				page = "redirect:/AdminMileageRegist"; 
				int success = service.del(product_num);
				logger.info("삭제 여부 : {}",success);
			}
			return page;
		}		
		
		@RequestMapping(value = "/detailing", method = RequestMethod.GET)
		public String detailing(Model model, @RequestParam String product_num) {
			logger.info("상세보기 요청: {}",product_num); //detail은 메서드 이름이라 부름; url을 통해서 보내는것 get; 왠만하면 get
			//session 에서 특정 속성만 제거하면 되기 떄문에 서비스와 DAO를 탈 필요가 없다. 
			
			ProductDTO dto =service.detailing(product_num);
			model.addAttribute("info",dto);
			
			return "detailing";
		}	
		
		@RequestMapping(value = "/updating", method = RequestMethod.POST)
		public String updating(Model model, 
				@RequestParam HashMap<String, String> params) {
				service.updating(params);
			return "redirect:/";
		}		
		
		@RequestMapping(value = "/AdminMemInfo", method = RequestMethod.POST)
		public String updating(Model model, @RequestParam String mem_id) {
				
			MemberDTO result = service.memInfo(mem_id);
			model.addAttribute("result", result);
				
			return "AdminMemInfo";
		}	
		
	/*	
		@GetMapping(value="/memlist")
		public ModelAndView memlist()
	            {
			return service.memlist();
		}
	 */
	@GetMapping(value="/search")
		public ModelAndView search(Model model,MemberDTO parameter){
			logger.info(parameter.getKeyword());
			logger.info(parameter.getSelect());
			return service.search(parameter);
		}
		
	@GetMapping(value="/adminmilesearch")
	public ModelAndView adminmilesearch(Model model,MypageDTO parameter){
		logger.info("마일리지 조회 id : " +parameter.getMem_id());
		return service.adminmilesearch(parameter);
	}
	
// 20220325 예약 상세보기(관리자) - SI
	@RequestMapping(value = "/AdminRoomReserveDetail", method = RequestMethod.GET)
	public String AdminRoomReserveDetail(
			Model model, 
			@RequestParam String reserve_num,
			@RequestParam int reserve_idx,
			@RequestParam String mem_id,
			HttpSession session) {
		
		String page = "AdminRoomReserveDetail";
		
		// 파라미터 확인
		logger.info("요기서 확인"+ reserve_num, reserve_idx, mem_id);
						
		
	/* 관리자 확인 로직 들어가야함! */
		
			
		
	// 20220318 예약 상세보기 구현 - SI
		// 서비스에서 받은 HashMap 데이터 추출해서 model에 넘겨주기
		HashMap<String, Object> result = mypageService.myReserveDetail(mem_id, reserve_num, reserve_idx);
		model.addAttribute("result", result.get("reserveDTO"));
		model.addAttribute("product", result.get("productDTO"));
		model.addAttribute("room", result.get("roomTypeName"));
		
		// 마일리지 상품 구매가 없을 때 처리를 위해 size 전송
		ArrayList<ProductDTO> prod = (ArrayList<ProductDTO>) result.get("productDTO");
		model.addAttribute("productSize", prod.size());

	// 20220325 방 갯수 model
		ArrayList<RoomDTO> roomCnt = (ArrayList<RoomDTO>) result.get("roomTypeName");
		model.addAttribute("roomCnt",roomCnt.size());
		logger.info("roomCnt"+ roomCnt.size());
	
		
	// 20220325 방 별 정보 model
	HashMap<String, Object> result2 = mypageService.myReserveRefund(mem_id, reserve_num);

	// 받아온 hashMap ArrayList로 자르기
	ArrayList<ReserveDTO> first = (ArrayList<ReserveDTO>) result2.get("first");
	ArrayList<ReserveDTO> second = (ArrayList<ReserveDTO>) result2.get("second");
	ArrayList<ReserveDTO> third = (ArrayList<ReserveDTO>) result2.get("third");
		
	// 확인
	//logger.info("첫번째 : {}", first.size());
	//logger.info("두번째 : {}", second.size());
	//logger.info("세번째 : {}", third.size());
	
	// model에 각 ArrayList 담기
	// List의 사이즈 비교하는 방법 두가지 : list.size()>0 / list.isEmpty()
	// 근데 사이즈 비교 전에는 우선 null 비교가 들어가야한다.
	if(first != null) {
		model.addAttribute("firstSize", first.size());
		model.addAttribute("first", first);
	}
	if(second != null) {
		model.addAttribute("secondSize", second.size());
		model.addAttribute("second", second);
	}
	if(third != null) {
		model.addAttribute("thirdtSize", third.size());
		model.addAttribute("third", third);
	}
	//model.addAttribute("reserve_num", reserve_num);
		
				
		return page;
	}
	
	
// 20220324	모든 예약 정보 보기 SI( Calender ) START
	@RequestMapping(value = "/AdminReserveList", method = RequestMethod.GET)
	public String AdminReserveList(Model model) {
		logger.info("페이지 접속");
			
		//MemberDTO result = service.memInfo(mem_id);
		//model.addAttribute("result", result);
			
		return "AdminReserveList";
	}	
	
	
	
	@RequestMapping(value = "/reserveListGet", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> reserveListGet(Model model) {
		//logger.info("잘 왔나용");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ReserveDTO> result = service.reserveListGet();
		map.put("res", result);
		
		//logger.info("요기 확인"+result.get(0).getReserve_num());
		
		return map;
	}	
	
// 20220324	모든 예약 정보 보기 SI( Calender ) END

	@RequestMapping(value = "/memlist", method = RequestMethod.GET)
    public String memlist(Model model , @RequestParam String currpage) {      
       logger.info("memlist 요청");
       
       String page = "/";
       int currPage = Integer.parseInt(currpage);	//호출을 요청할 페이지
       logger.info("currPage 선언");
		int pagePerCnt = 10; //한 페이지당 몇개씩? 10개씩
		
			//1.총 패이지 갯수인 range가 필요함
			int range = service.memlist_rangecall(currPage,pagePerCnt);
			
			//2.리스트가 필요함(10개밖에 안들어있음)
			ArrayList<HashMap<String, String>> listCall = service.memlist_listCall(currPage,pagePerCnt);
			model.addAttribute("pages",range);
			model.addAttribute("memlist",listCall);
			model.addAttribute("nowpage",currpage);
			logger.info("listcall : {}" , listCall);
			logger.info("currPage : {}" , currPage);
			logger.info("pagePerCnt : {} ", pagePerCnt);
			logger.info("range : {} " , range);
			
			page = "adminmemsearch";			

		return page;
       
      
   }
}

