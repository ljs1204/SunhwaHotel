package co.kr.hotel;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import co.kr.hotel.dto.RoomDTO;
import co.kr.hotel.service.ReserveService;
import co.kr.hotel.service.RoomService;

@Controller
public class HomeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomService roomservice;
	@Autowired ReserveService reserveService;
	
	//메인페이지 START 유선화 20220311
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home2(Model model, HttpSession session) {
		logger.info("homepage로 요청이 들어옴 ");
		
		ArrayList<RoomDTO> roomdto = roomservice.roomlist();
		logger.info("roomdto"+roomdto);
		model.addAttribute("roomlist",roomdto);
		
		// 메인페이지 요청 세션검사 추가 START - SI 20220314  
		String loginId = (String) session.getAttribute("loginId");
		//loginId = "admin";	// 아이디 'admin' 일 때
		//loginId = "아이디";
		
		if(loginId != null) {
			model.addAttribute("loginId", loginId);
		}
		// 메인페이지 요청 세션검사 추가 END - SI 20220314 
		
		return "index";
	}
	

	@RequestMapping(value = "/toReserve", method = RequestMethod.POST) 
	public String toReserve(Model model,HttpSession session,@RequestParam String checkin_date
			,@RequestParam String checkout_date,@RequestParam int cnt) {
		
		String page = "reserveRoomslist";
		
		logger.info("toReserve로 요청이 들어옴 ");
		logger.info("checkin_date : " +checkin_date);
		logger.info("checkout_date : "+checkout_date);
		logger.info("cnt : "+cnt);
		
		ReserveDTO dto = new ReserveDTO();
	
		dto.setCheckindate(checkin_date);
		dto.setCheckoutdate(checkout_date);
		dto.setAdult_cnt(cnt);
		String msg = null;
		msg = "소아는 인원 선택에서 제외하셔야합니다. 예약하시겠습니까?";
		
		
		//오늘 날짜,체크인 체크아웃 비교하기 start
		LocalDate dateInformat = LocalDate.parse(checkin_date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate dateoutformat = LocalDate.parse(checkout_date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		LocalDate nowformat = LocalDate.parse(formatedNow, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		logger.info("dateInformat : " +dateInformat);
		logger.info("dateoutformat : " +dateoutformat);
		//객실 예약 리스트 START 20220311 유선화
		// toRooms
		ArrayList<RoomDTO> roomReservelist = reserveService.toReservelist(checkin_date,checkout_date,cnt);
		logger.info("roomReservelist"+roomReservelist);
		model.addAttribute("roomReservelist",roomReservelist);
		
		
		
		
		
		//객실 예약 리스트 END 20220311 유선화
			
		int compare = dateInformat.compareTo(dateoutformat);
		int compareinnow = nowformat.compareTo(dateInformat);
		int comparoutenow = nowformat.compareTo(dateoutformat);
		
		logger.info("compare : "+ compare);
		
		if( compare >-1 && compareinnow > -1 && comparoutenow > -1) {
			model.addAttribute("msg2","날짜를 다시 선택해 주세요");
			page = "index";
			msg = "";
			model.addAttribute("msg",msg);
		}else if(compareinnow > -1){
			model.addAttribute("msg2","당일예약 및 지난 날짜는 선택할 수 없습니다.");
			page = "index";
			msg = "";
			model.addAttribute("msg",msg);
		}else if(comparoutenow > -1){
			model.addAttribute("msg2","당일예약 및 지난 날짜는 선택할 수 없습니다.");
			page = "index";
			msg = "";
			model.addAttribute("msg",msg);
		}else {
			if(cnt > 0) {
				model.addAttribute("msg",msg);
			}
		}
		//오늘 날짜,체크인 체크아웃 비교하기 end
		
		model.addAttribute("checkin_date",dto.getCheckindate()); 
		model.addAttribute("checkout_date",dto.getCheckoutdate());
		model.addAttribute("cnt",dto.getAdult_cnt());
		
		return page;
	}	
	
	//메인페이지 END 유선화 20220311
	
	
	
	
	
	
	
	
	
	
	
}
