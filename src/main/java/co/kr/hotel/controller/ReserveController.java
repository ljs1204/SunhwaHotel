package co.kr.hotel.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.dto.RoomDTO;
import co.kr.hotel.service.ReserveService;

@Controller
public class ReserveController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReserveService service;

	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(Model model,HttpSession session) {
		
		
		
		logger.info("reservation 페이지 요청이 들어옴 ");
		
		return "reservation";
	}
	
	
	//메인페이지 -> 객실 예약하기 페이지 요청 유선화 START 20220311
	
	@RequestMapping(value = "/reserveRoomslist", method = RequestMethod.GET)
	public String rooms( Model model) {
		
		
		
		
		logger.info("rooms로 요청이 들어옴 ");
		
		return "reserveRoomslist";
	}
	
	//메인페이지 -> 객실 예약하기 페이지 요청 유선화 END 20220311
	
	
	//객실 옵션 페이지 이지선 START 220315
	
	 //객실 옵션 페이지 접속 리스트 불러오기	
	 @RequestMapping(value = "/reservation_option", method = RequestMethod.POST)
		public String reservation_option(Model model,HttpSession session,String params) { 
			logger.info("reservation_option 요청");
			
			
			
			logger.info("받아온 값 확인 {}",params);
			
			//형민- 객실정보 03.21 합침
			List<Map<String,Object>> dataList = new ArrayList<> ();
			JsonArray ja = new JsonArray();
			JsonParser jsonParser = new JsonParser(); //List를 String으로 변환
			ja = (JsonArray) jsonParser.parse(params);
			int len = ja.size();
			   for (int i=0;i<len;i++){
				 
				 Map<String,Object> map = new HashMap<String,Object>();
				 JsonObject jsonObj = (JsonObject) ja.get(i);
				 
				 Gson gson = new Gson();
				 map = (Map<String,Object>) gson.fromJson(jsonObj.toString(), map.getClass());
				 dataList.add(map);
			   }
			  logger.info("보낸 Data:{}",dataList);
			  model.addAttribute("reserveData", dataList); //객실타입/객실 침대타입/인원 수/가격
			//객실정보 끝
			  
			  
			  
			//아이디
			String loginId = (String)session.getAttribute("loginId");
			model.addAttribute("loginId",loginId);
			
			
			String page = "reservation_option_non";
			
			if(loginId != null) {
				page = "reservation_option";
				//회원님의 마일리지 불러오기
				int useable = service.useable(loginId);
				model.addAttribute("useable", useable);
				
				
				//회원정보,카드정보 가져오기
				MemberDTO memberDto = new MemberDTO();
				memberDto = service.reservation_memInfo(loginId);
				
				String mem_card = memberDto.getCredit_type();
				model.addAttribute("mem_card",mem_card);
				if(mem_card != null) {
				String cardBank = service.mem_card(mem_card);
				logger.info("cardBank: "+cardBank);
				memberDto.setCredit_type(cardBank);
				}
				model.addAttribute("memInfo", memberDto);
				
			}

			//체크인날짜,체크아웃날짜
			model.addAttribute("checkindate",dataList.get(0).get("checkin").toString()); 
			model.addAttribute("checkoutdate",dataList.get(0).get("checkout").toString()); 
			//객실 수 
			model.addAttribute("rowDivCnt",dataList.get(0).get("rowDivCnt").toString()); 
			//옵션 값 불러오기
			ArrayList<HashMap<String, String>> option = service.reservation_option();
			logger.info("받아온 값 확인 {}",option);
			model.addAttribute("option",option);
			//옵션 수량 설정
			String option_cnt = "0";
			model.addAttribute("option_cnt",option_cnt);
			
			//마일리지 상품 4가지 불러오기
			ArrayList<HashMap<String, String>> product = service.reservation_product();
			logger.info("받아온 값 확인 {}",product);
			model.addAttribute("product",product);
			
			
			return page; 
	 }
	
	 
	 
	 
	 
	 
	//회원 예약 요청  START
	@Transactional
	@RequestMapping(value = "/toReserveOrder", method = RequestMethod.POST)
		public String toReserveOrder(Model model, HttpSession session,
				@RequestParam Map<String, String> params) {
		logger.info("toReserveOrder 요청 : {}",params);
		
		
		//공통
		int pay_price2 = 0;
		String loginId = params.get("loginId");
		int extrabed_price = service.extrabed_price();//엑스트라베드 가격
		int breakfast_price = service.breakfast_price();//조식 가격
		int roomCnt=  (int) Double.parseDouble(params.get("rowDivCnt"));//1,2,3
		logger.info("객실 수 확인 :"+roomCnt);
		
		ReserveDTO dto = new ReserveDTO();
		dto.setMem_id(loginId);
		
		String reserveNum = "S"+System.currentTimeMillis();
		dto.setReserve_num(reserveNum);
		dto.setReserve_state("1");
		dto.setCheckindate(params.get("checkindate"));
		dto.setCheckoutdate(params.get("checkoutdate"));
		logger.info("예약번호"+reserveNum);
		model.addAttribute("loginId", loginId);
		model.addAttribute("reserveNum", reserveNum);
		
		int r = 1;
		//객실 수 만큼 반복
		for (r = 1; r <= roomCnt; r++) {
			//객실별
			dto.setAdult_cnt(Integer.parseInt(params.get("people_"+r)));//인원수
			int extrabed_cnt = Integer.parseInt(params.get("option1_cnt_"+r));//엑스트라베드 수량
			int breakfast_cnt = Integer.parseInt(params.get("option2_cnt_"+r));//조식 수량
			dto.setExtrabed_cnt(extrabed_cnt);
			dto.setBreakfast_cnt(breakfast_cnt);
			
			String add = params.get("ADD_"+r);
			if(add == null) {
				add = "없음";
			}
			dto.setAdd_requests(add);//추가요청사항
			
			logger.info("객실"+r+"인원 수 :"+dto.getAdult_cnt());
			
			
			// 빈 객실 가져오기 유선화 START 22.03.21
			RoomDTO roomDto = new RoomDTO();
			
			
			//객실별
			int room_type = Integer.parseInt(params.get("room_type_"+r));
			int bed_type = Integer.parseInt(params.get("room_bed_"+r));
			//int roomCnt = 1; //인원수가아니라 객실이 몇개인지 확인하는 값
			logger.info("룸타입"+r+":"+room_type);
			
			roomDto.setRoom_type(room_type);
			roomDto.setBed_type(bed_type);
			roomDto.setRoomCnt(1);//이 값으로 limit값 
			roomDto.setCheckindate(params.get("checkindate"));
			roomDto.setCheckoutdate(params.get("checkoutdate"));
			
			String roomIdx = service.roomIdx(roomDto); 
			dto.setRoom_num(roomIdx); //객실번호  DTO 담기
			logger.info("roomIdx"+r+":"+roomIdx);
			
			
			// 빈 객실 가져오기 유선화 END 22.03.21
			
			service.roomOne(dto); //예약insert
			
			int reserve_idx = dto.getReserve_idx();
			String room_num = dto.getRoom_num();
			logger.info("reserve_idx : "+reserve_idx);
			logger.info("room_num : "+room_num);
			model.addAttribute("reserve_idx", reserve_idx);
			
			
			if(reserve_idx > 0 ) { //성공 예약번호 
				logger.info("마일리지상품 히스토리,회원 마일리지 내역 저장 시작");
				
				int productTotal = 0;
				
				for (int i = 1; i < 5; i++) {
					if(Integer.parseInt(params.get("p"+i+"_cnt_"+r)) != 0) {//선택한 마일리지 상품 수량이 0이 아니라면...
						logger.info("선택한 상품 있음");
						String product_num = params.get("product"+i+"_"+r);
						int product_price = service.product_price(product_num);
						//* 가격은 DB에서 가져온다.
						
						int product_cnt = Integer.parseInt(params.get("p"+i+"_cnt_"+r));
						productTotal -= product_price*product_cnt;
						
						service.roomOneCart(reserve_idx,product_cnt,product_num); //마일리지 상품히스토리(cart) Insert

						
					}
				}
				
				
				
				logger.info("productTotal : "+productTotal);
				if(productTotal != 0) {
					logger.info("객실 마일리지 총 구입금액 : "+productTotal);//mileage_price (-값)
					int useable = service.useable(loginId);//DB 회원의 마일리지 잔액		
					int mileage_useable = useable+productTotal;//회원 마일리지 잔액 - 객실별 상품 총 구입액 => mileage_useable
					logger.info("남은 사용가능액 계산값 : "+mileage_useable);
					service.buyMileageminus(loginId,productTotal,mileage_useable); //마일리지 내역 Insert : 상품 구입액만큼 차감
				}
				
				
				//객실별 결제 insert 시작	
			     String Pay_num = "P"+System.currentTimeMillis();//결제번호
			     String credit_num = params.get("credit_num");//카드번호
			     int credit_validity =  Integer.parseInt(params.get("credit_valid"));
			     String credit_type = params.get("credit_type");
			     int dayCnt = Integer.parseInt(params.get("dayCnt"));
			     //룸가격 + 엑베가격*수량 + 조식가격*수량
			     int room_price = service.room_price(reserve_idx);//룸가격
			     int pay_price = ( room_price +(extrabed_price * extrabed_cnt) + (breakfast_price * breakfast_cnt) )*dayCnt;
			     int pay_mile = Math.abs(productTotal);//(+) 마일리지 사용금액
			     int amount = pay_price + pay_mile;
			     pay_price2 += pay_price;
			     service.roomPay(reserve_idx,Pay_num,credit_num,credit_validity,credit_type,pay_price,pay_mile,amount);
			     //객실 결제 끝

			}
			
		}
		
		logger.info("r : "+r);
		logger.info("roomCnt : "+roomCnt);
		if(r > roomCnt) {
			//회원 결제 마일리지 적립(최종가*회원등급, 객실별아님)
			int mem_gradeRate = service.rate(loginId);//회원등급 불러오기
			int cardTotal = pay_price2; //카드사용금액
			int mileageSave = cardTotal*mem_gradeRate/100; //적립 마일리지 금액 계산값
			int useable = service.useable(loginId); //회원 사용가능금액
			int useableSave = useable+mileageSave; //사용가능금액 계산값
			service.mileageSave(loginId,mileageSave,useableSave);
		}

		//예약 요청  END
	
		
		
		
		
		return "reserveResult";
	}


	//객실 옵션 페이지 이지선 END 220315
	
	
	@RequestMapping(value = "/doReservation", method = RequestMethod.GET)
	public String doReservation(Model model,HttpSession session) {
		
		return "doReservation";
	}
	
	@RequestMapping(value = "/reserveResult", method = RequestMethod.GET)
	public String reserveResult(Model model,HttpSession session) {
		logger.info("reserveResult 요청");
		//예약 불러오기
		
		return "reserveResult";
	}
	
	
	
	
	
	@RequestMapping(value = "/cardSave", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> cardSave(@RequestParam HashMap<String, String> param) {
		
		logger.info("카드정보 저장 요청 :{}",param);
		return service.cardSave(param);
	}
	
	


	//비회원 예약 요청  START 0324
	@Transactional
	@RequestMapping(value = "/toReserveOrder_non", method = RequestMethod.POST)
		public String toReserveOrder_non(Model model, HttpSession session,
				@RequestParam Map<String, String> params) {
		logger.info("toReserveOrder_non 요청 : {}",params);
		
		
		//공통
		int extrabed_price = service.extrabed_price();//엑스트라베드 가격
		int breakfast_price = service.breakfast_price();//조식 가격
		int roomCnt=  (int) Double.parseDouble(params.get("rowDivCnt"));//1,2,3
		
		logger.info("객실 수 확인 :"+roomCnt);
		
		ReserveDTO dto = new ReserveDTO();
		dto.setMem_id("비회원");
		
		String reserveNum = "S"+System.currentTimeMillis();
		dto.setReserve_num(reserveNum);
		dto.setReserve_state("1");
		dto.setCheckindate(params.get("checkindate"));
		dto.setCheckoutdate(params.get("checkoutdate"));
		logger.info("예약번호"+reserveNum);
		model.addAttribute("loginId", "비회원");
		model.addAttribute("reserveNum", reserveNum);
		
		int r = 1;
		//객실 수 만큼 반복
		for (r = 1; r <= roomCnt; r++) {
			//객실별
			dto.setAdult_cnt(Integer.parseInt(params.get("people_"+r)));//인원수
			int extrabed_cnt = Integer.parseInt(params.get("option1_cnt_"+r));//엑스트라베드 수량
			int breakfast_cnt = Integer.parseInt(params.get("option2_cnt_"+r));//조식 수량
			dto.setExtrabed_cnt(extrabed_cnt);
			dto.setBreakfast_cnt(breakfast_cnt);
			
			String add = params.get("ADD_"+r);
			if(add == null) {
				add = "없음";
			}
			dto.setAdd_requests(add);//추가요청사항
			
			logger.info("객실"+r+"인원 수 :"+dto.getAdult_cnt());
			
			
			// 빈 객실 가져오기 유선화 START 22.03.21
			RoomDTO roomDto = new RoomDTO();
			
			
			//객실별
			int room_type = Integer.parseInt(params.get("room_type_"+r));
			int bed_type = Integer.parseInt(params.get("room_bed_"+r));
			//int roomCnt = 1; //인원수가아니라 객실이 몇개인지 확인하는 값
			logger.info("룸타입"+r+":"+room_type);
			
			roomDto.setRoom_type(room_type);
			roomDto.setBed_type(bed_type);
			roomDto.setRoomCnt(1);//이 값으로 limit값 
			roomDto.setCheckindate(params.get("checkindate"));
			roomDto.setCheckoutdate(params.get("checkoutdate"));
			
			String roomIdx = service.roomIdx(roomDto); 
			dto.setRoom_num(roomIdx); //객실번호  DTO 담기
			logger.info("roomIdx"+r+":"+roomIdx);
			
			
			// 빈 객실 가져오기 유선화 END 22.03.21
			
			service.roomOne(dto); //예약insert
			
			int reserve_idx = dto.getReserve_idx();
			String room_num = dto.getRoom_num();
			logger.info("reserve_idx : "+reserve_idx);
			logger.info("room_num : "+room_num);
			model.addAttribute("reserve_idx", reserve_idx);
		
			
			if(reserve_idx > 0 ) { //성공 예약번호 

				//객실별 결제 insert 시작	
			     String Pay_num = "P"+System.currentTimeMillis();//결제번호
			     String credit_num = params.get("credit_num");//카드번호
			     int credit_validity =  Integer.parseInt(params.get("credit_valid"));
			     String credit_type = params.get("credit_type");
			     //룸가격 + 엑베가격*수량 + 조식가격*수량
			     int room_price = service.room_price(reserve_idx);//룸가격
			     int dayCnt = Integer.parseInt(params.get("dayCnt"));
			     int pay_price = ( room_price +(extrabed_price * extrabed_cnt) + (breakfast_price * breakfast_cnt) )*dayCnt;
			     int pay_mile = 0;
			     int amount = pay_price;
			     
			     service.roomPay(reserve_idx,Pay_num,credit_num,credit_validity,credit_type,pay_price,pay_mile,amount);
			    //객실 결제 끝
			    
			     
			    //비회원 정보 저장
			     String nmem_code = "N"+System.currentTimeMillis();//비회원 코드
			     String email = params.get("email");
			     String phone = params.get("phone");
			     String name_en = params.get("name_en");
			     String name_kr = params.get("name_kr");
			     
			     service.nonMem(nmem_code,reserve_idx,email,phone,name_en,name_kr);
			     
			}
		}

		
		//예약 요청  END
	
		
		
		
		
		return "reserveResult";
	}
	
	// 20220329 환불 START - SI
	@RequestMapping(value = "/reFund", method = RequestMethod.GET)
	public String refund(Model model, HttpSession session,
			@RequestParam String reserve_idx1,
			@RequestParam(required=false) String reserve_idx2,
			@RequestParam(required=false) String reserve_idx3,		// ...예약번호
			@RequestParam(required=true) String refundCategory		// 완전예약, 부분예약 구분
			) throws ParseException {
		
		logger.info("환불 시작 : "+ reserve_idx1 + reserve_idx2 + reserve_idx3 + refundCategory);
		// 아이디 확인( 회원/비회원 구분 )
		String loginId = (String) session.getAttribute("loginId");
		String reserve_num = "";
		
		if(loginId != null) {
			//회원
			reserve_num = service.reFund(reserve_idx1, reserve_idx2, reserve_idx3, loginId, refundCategory);
		}else {
			//비회원
			reserve_num = service.reFund(reserve_idx1, reserve_idx2, reserve_idx3, "비회원", refundCategory);
		}
		
		// 환불 리스트로 redirect
		return "redirect:/mypageRefundDetail?reserve_num="+reserve_num;
	}
	
	
	
	// 20220329 환불 END - SI 
	
	
	
	
	
	
		
}
