package co.kr.hotel;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

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
	int id = 0 ;
	int result_size1 = 0;
	int result_size2= 0;
	int result_size3 = 0;
	int result_size4 = 0;
	
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
		//날짜 월 비교 START 22.03.23
		
		LocalDate dateInformat = LocalDate.parse(checkin_date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate dateoutformat = LocalDate.parse(checkout_date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		LocalDate nowformat = LocalDate.parse(formatedNow, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		logger.info("dateInformat : " +dateInformat);
		logger.info("dateoutformat : " +dateoutformat);
		logger.info("dateInformat MM : " +dateInformat.getMonthValue());
		logger.info("dateoutformat MM : " +dateoutformat.getMonthValue());
		
		int dateInformatMM = dateInformat.getMonthValue();
		int dateoutformatMM = dateoutformat.getMonthValue();
		
			
		int compare = dateInformat.compareTo(dateoutformat);
		int compareinnow = nowformat.compareTo(dateInformat);
		int comparoutenow = nowformat.compareTo(dateoutformat);
		
		logger.info("compare : "+ compare);
		
		
		if(checkin_date.equals("") || checkout_date.equals("") ) {
			page = "index";
			logger.info("equals()");
		}
		

		//오늘 날짜,체크인 체크아웃 비교하기 end
		if(dateInformatMM <= dateoutformatMM) { // 월 비교 
			if( compare >-1) { // 날짜 비교 
				model.addAttribute("msg2","날짜를 다시 선택해 주세요");
				logger.info("compare >-1 : "+ compare);
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
		
		}else {
			model.addAttribute("msg2","날짜를 다시 선택해 주세요");
			page = "index";
			msg = "";
			model.addAttribute("msg",msg);
		}
		//객실 예약 리스트 START 20220311 유선화
		// toRooms
		ArrayList<RoomDTO> roomReservelist = reserveService.toReservelist(checkin_date,checkout_date,cnt);
		logger.info("roomReservelist"+roomReservelist);
		model.addAttribute("roomReservelist",roomReservelist);
		
		ArrayList<RoomDTO> nulroom = reserveService.nulroom(checkin_date,checkout_date);
		logger.info("nulroom"+nulroom);
		model.addAttribute("nulroom",nulroom);
		
		// iterator로 예약 할 수 있는 객실리스트 뿌리기  START 유선화 22.03.36
		// 룸타입 1 베드타입 1,2 --> 각각 size를 계산해서 0보다 클때만<c:if>로 보여주기 
		// 룸타입 2 베드타입 1,2 
		// 룸타입 3 베드타입 1,2
		// 룸타입 4 베드타입 1,2
		
				
		HashMap<String, Object> result = new HashMap<String, Object>();	
		
		Iterator<RoomDTO> iter = nulroom.iterator();					// iterator
		RoomDTO reserveIter = null;										// iterator에서 사용할 한줄 받을 DTO 
		
		while (iter.hasNext()) {
			// iterator로 next() 하며 한개씩 확인
			reserveIter = iter.next();
			// 룸타입 1 베드타입 1,2 getRoom_type이 1이고 베드타입이 1,2 인데이터 수 계산해서 hashMap에 넣기 
			logger.info("Room_type : "+reserveIter.getRoom_type());
			logger.info("Bed_type : "+reserveIter.getBed_type());
			if(reserveIter.getRoom_type() == 1) {
				result.put("roomType_1", reserveIter.getRoom_type());
				result.size();
				logger.info("룸타입 1 : "+result.size());
				if(reserveIter.getBed_type() == 1) {
					result.put("roomType_1_1", reserveIter.getBed_type());
					
					logger.info("룸타입 1 베드타입 1 : "+result.size());
				}
				if(reserveIter.getBed_type() == 2) {
					result.put("roomType_1_2", reserveIter.getBed_type());
					result.size();
					logger.info("룸타입 1 베드타입 2 총 합: "+result.size());
					// 만약 룸타입이1인게 0보다 크면 1 을 model에 보내고
					// 아니면 무조건 0 을 보냄 int i = 0 을 초기화 하고 
					// 만약 room_T1_B12_cnt 가 0보다 크면 id= 1or2or3or4 아니면 0임
					result_size1 = result.size();
					if(result_size1 > 0) {
						logger.info("result_size1 : "+result_size1);
						id = 1;
					}
					
					model.addAttribute("room_T1_B12_cnt", id);
				}
				
			}
			if(reserveIter.getRoom_type() == 2) {
				result.put("roomType_2", reserveIter.getRoom_type());
				result.size();
				logger.info("룸타입 2 : "+result.size());
				if(reserveIter.getBed_type() == 1) {
					result.put("roomType_2_1", reserveIter.getBed_type());
					result.size();
					logger.info("룸타입 2 베드타입 1 : "+result.size());
				}
				if(reserveIter.getBed_type() == 2) {
					result.put("roomType_2_2", reserveIter.getBed_type());
					result.size();
					logger.info("룸타입 2 베드타입 2 총 합: "+result.size());
					
					result_size2 = result.size()-result_size1 ;
					if(result_size2 > 0) {
						logger.info("result_size2 : "+result_size2);
						id = 2;
					}
					
					model.addAttribute("room_T2_B12_cnt", id);
				}
				
			}
			if(reserveIter.getRoom_type() == 3) {
				result.put("roomType_3", reserveIter.getRoom_type());
				result.size();
				logger.info("룸타입 3 : "+result.size());
				if(reserveIter.getBed_type() == 1) {
					result.put("roomType_3_1", reserveIter.getBed_type());
					result.size();
					logger.info("룸타입 3 베드타입 1 : "+result.size());
				}
				if(reserveIter.getBed_type() == 2) {
					result.put("roomType_3_2", reserveIter.getBed_type());
					result.size();
					logger.info("룸타입 3 베드타입 2 총 합: "+result.size());
					
					result_size3 = result.size()- result_size1 - result_size2 ;
					if(result_size3 > 0) {
						logger.info("result_size3 : "+result_size3);
						id = 3;
					}
					
					model.addAttribute("room_T3_B12_cnt", id);
				}
				
			}
			if(reserveIter.getRoom_type() == 4) {
				result.put("roomType_4", reserveIter.getRoom_type());
				result.size();
				logger.info("룸타입 4 : "+result.size());
				if(reserveIter.getBed_type() == 1) {
					result.put("roomType_4_1", reserveIter.getBed_type());
					result.size();
					logger.info("룸타입 4 베드타입 1 : "+result.size());
				}
				if(reserveIter.getBed_type() == 2) {
					result.put("roomType_4_2", reserveIter.getBed_type());
					result.size();
					logger.info("룸타입 4 베드타입 2 총 합: "+result.size());
					model.addAttribute("room_Type4_Bed1&2_cnt", result.size());
					
					result_size4 = result.size()- result_size1 - result_size2 - result_size3;
					if(result_size4 > 0) {
						logger.info("result_size4 : "+result_size4);
						id = 4;
					}
					
					model.addAttribute("room_T4_B12_cnt", id);
					
				}
				
			}
			
		}
		
		
		
		// iterator로 예약 할 수 있는 객실리스트 뿌리기  END 유선화 22.03.36
		
		
		//객실 예약 리스트 END 20220311 유선화
		
		model.addAttribute("checkin_date",dto.getCheckindate()); 
		model.addAttribute("checkout_date",dto.getCheckoutdate());
		model.addAttribute("cnt",dto.getAdult_cnt());
		
		return page;
	}	
	
	//메인페이지 END 유선화 20220311
	
	
	
	
	
	
	
	
	
	
	
}
