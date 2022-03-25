package co.kr.hotel.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.jsp.jstl.core.IteratedExpression;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.ReserveDAO;
import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.dto.RoomDTO;

@Service
public class ReserveService {

	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReserveDAO reserveDao;
	//객실 예약 리스트 START 유선화 20220311
	public ArrayList<RoomDTO> toReservelist(String checkin_date, String checkout_date, int cnt) {
		// TODO Auto
		
		return reserveDao.toReservelist(checkin_date,checkout_date,cnt);
	}
	//객실 예약 리스트 END 유선화 20220311
	
	//객실 옵션 페이지 이지선 START 220315
	
	public ArrayList<HashMap<String, String>> reservation_option() {
		ArrayList<HashMap<String, String>> option = reserveDao.reservation_option();
		return option;
	}

	public ArrayList<HashMap<String, String>> reservation_product() {
		ArrayList<HashMap<String, String>> product = reserveDao.reservation_product();
		return product;
	}

	public int useable(String loginId) {
		
		return reserveDao.useable(loginId);
	}

	public void roomOne(ReserveDTO dto) {

		reserveDao.roomOne(dto);
	}

	public void roomOneCart(int reserve_idx, int product_cnt, String product_num) {
		reserveDao.roomOneCart(reserve_idx,product_cnt,product_num);
	}

	public void buyMileageminus(String loginId, int productTotal, int mileage_useable) {
		reserveDao.buyMileageminus(loginId,productTotal,mileage_useable);
	}

	public int product_price(String product_num) {
		return reserveDao.product_price(product_num);
	}

	public MemberDTO reservation_memInfo(String loginId) {
		return reserveDao.reservation_memInfo(loginId);
	}

	public String roomIdx(RoomDTO roomDto) {
		return reserveDao.roomIdx(roomDto);
	}


	public int rate(String loginId) {
		return  reserveDao.rate(loginId);
	}

	public void mileageSave(String loginId, int mileageSave, int useableSave) {
		reserveDao.mileageSave(loginId,mileageSave,useableSave);
		
	}

	public String mem_card(String mem_card) {
		return reserveDao.mem_card(mem_card);
	}

	public int extrabed_price() {
		return reserveDao.extrabed_price();
	}

	public int breakfast_price() {
		return  reserveDao.breakfast_price();
	}

	public int room_price(int reserve_idx) {
		return reserveDao.room_price(reserve_idx);
	}

	public void roomPay(int reserve_idx, String pay_num, String credit_num, int credit_validity, String credit_type, int pay_price,
			int pay_mile, int amount) {
		reserveDao.roomPay(reserve_idx,pay_num,credit_num,credit_validity,credit_type,pay_price,pay_mile,amount);
	}

	public HashMap<String, Object> cardSave(HashMap<String, String> param) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		int row = reserveDao.cardSave(param);
		map.put("success",row);
		return map;
	}

	public void nonMem(String nmem_code, int reserve_idx, String email, String phone, String name_en, String name_kr) {

		reserveDao.nonMem(nmem_code,reserve_idx,email,phone,name_en,name_kr);
	}

// 환불 20220325
	public void reFund(String reserve_idx1, String reserve_idx2, String reserve_idx3, String loginId, String refundCategory) throws ParseException {
	// 1. reserve 테이블에 insert
		// 1-1. 일단 해당 idx로 객실 몇개가 예약되어 있는지 확인 => myReserveRefund.jsp 에서 처리
		// 1-2. 부분인지 완전취소인지 분기
		if(refundCategory.equals("2")) {
			//부분취소
			//int successParts = reserveDao.refundParts(reserve_idx1, reserve_idx2, reserve_idx3, loginId);
			//logger.info(successParts + "메론");
		}else if(refundCategory.equals("3")) {
			//완전취소
			//int successAll = reserveDao.refundAll(reserve_idx1, reserve_idx2, reserve_idx3, loginId);
			//logger.info("메론" + successAll);
		}
		
	// 2. pay 테이블에 insert
		// 1. 해당 예약에 대한 가격을 가져온다
			ArrayList<ReserveDTO> priceRoom = reserveDao.priceAll(reserve_idx1, reserve_idx2, reserve_idx3, loginId);
		
		// 2. 오늘 날짜 계산
			Calendar getToday = Calendar.getInstance();
			getToday.setTime(new java.util.Date()); //오늘 날짜
			
			// 내가 계산하고 싶은 날짜
			String s_date = priceRoom.get(0).getCheckindate();
			java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s_date);
			Calendar cmpDate = Calendar.getInstance();
			cmpDate.setTime(date); //특정 일자
			
			long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
			long diffDays = diffSec / (24*60*60); //일자수 차이
			
			//System.out.println(diffDays + "일 차이");
			
			
		// 3. 환불규정에 따라 환불해줄 금액 여기서 계산
			// ArrayList, List, HashMap => iterator for문 or while 돌리세요
			Iterator<ReserveDTO> iter = priceRoom.iterator();			// (1) iterator 준비
			ReserveDTO reserveDTO = null;								// (2) 한줄 담을 DTO
			
			while(iter.hasNext()) {
				reserveDTO = iter.next();
				
				if(diffDays==0) {
					// 환불 X
					// => 돌려받을 금액 0 => insert 0
					reserveDTO.setAmount(0);
					reserveDTO.setPay_mileage(0);
					reserveDTO.setPay_price(0);
					logger.info("총 금액"+reserveDTO.getAmount());
					
				}else if(diffDays >= 1 && diffDays < 7 ){
					// 마일리지 계산 금액이 있으면 마일리지 부터 차감
					if(reserveDTO.getPay_mileage()>0) {
						//(reserveDTO.getAmount() * (0.5))	// 총 환불금액
						//reserveDTO.getPay_mileage()			// 마일리지 사용 금액
						// 환불 금액이 마일리지 사용 금액보다 크면 
						if((reserveDTO.getAmount() * (0.5)) > reserveDTO.getPay_mileage()) {
							// 금액가격 - ( 총액 - 마일리지금액 )
							int refundPrice = (int) (reserveDTO.getPay_price() - ((reserveDTO.getAmount() * (0.5)) - reserveDTO.getPay_mileage()));
							reserveDTO.setAmount(refundPrice);
							reserveDTO.setPay_mileage(0);
							reserveDTO.setPay_price(refundPrice);
						}else {
						// 환불 금액이 마일리지 사용 금액보다 작으면
							reserveDTO.setAmount((int) (reserveDTO.getAmount() * (0.5)));
							reserveDTO.setPay_price(reserveDTO.getPay_price());
							reserveDTO.setPay_mileage((int) (reserveDTO.getPay_mileage() - (reserveDTO.getAmount() * (0.5))));
						}
						
						
						// 완료
						
						
						
					}else {		// 마일리지 사용이 없을 때
					// => 돌려받을 금액 50% => insert
					reserveDTO.setAmount((int) (reserveDTO.getAmount()*(-0.5)));
					reserveDTO.setPay_mileage((int) (reserveDTO.getPay_mileage()*(-0.5)));
					reserveDTO.setPay_price((int) (reserveDTO.getPay_price()*(-0.5)));
					}
				}else {
					// 100%
					// => 돌려받을 금액 100% => insert
					reserveDTO.setAmount((int) reserveDTO.getAmount()*(-1));
					reserveDTO.setPay_mileage((int) (reserveDTO.getPay_mileage()*(-1)));
					reserveDTO.setPay_price((int) (reserveDTO.getPay_price()*(-1)));
				}
					
				}
				
				
			
	
		// 3. insert
		// 4. 마일리지 선차감이니까 만약에 마일리지 사용한게 있으면 마일리지 먼저 빼고 그 다음에 금액 뺀다
		// 5. 마일리지 상품은 다 없어지는거니까 3. 번처럼하면 된다
		
		
		// 2-1. 저장된 결제 내역 가져와서 값을 바꿔서 그대로 insert
		if(refundCategory.equals("2")) {
			//int successPayParts = reserveDao.refundPayParts(reserve_idx1, reserve_idx2, reserve_idx3);
		}else if(refundCategory.equals("3")) {
			//int successPayAll = reserveDao.refundPayAll(reserve_idx1, reserve_idx2, reserve_idx3);
		}
		
	// 3. (마일리지 상품 있다면) cart 테이블에 insert
		//int refundCart = reserveDao.refundCart(reserve_idx1, reserve_idx2, reserve_idx3);		
		
	// 4. (회원이면) mileage 테이블 insert
		// 1. 해당 예약에 대한 가격을 가져온다
		// 2. 오늘 날짜와 체크인 데이트 비교해서 얼마 환불해줘야되는지 계산한다(환불 규정)
		// 3. 환불금액에서 쌓인 마일리지 만큼 취소된다
		
		// 마일리지 전량 폐기 -> 다시 적립하는 방식으루 한닷!
		
		
		}
	}
	
	
	
	//객실 옵션 페이지 이지선 END 220315
