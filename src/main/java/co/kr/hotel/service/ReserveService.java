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

	public ArrayList<RoomDTO> nulroom(String checkin_date, String checkout_date) {
		// TODO Auto-generated method stub
		return reserveDao.nulroom(checkin_date,checkout_date);
	}



// 환불 20220325
	public String reFund(String reserve_idx1, String reserve_idx2, String reserve_idx3, String loginId, String refundCategory) throws ParseException {
	// 1. reserve 테이블에 insert
		// 부분인지 완전취소인지 분기
		if(refundCategory.equals("2")) {
			//부분취소 => 예약상태 컬럼에 2으로 insert
			int successParts = reserveDao.refundParts(reserve_idx1, reserve_idx2, reserve_idx3, loginId);
			//logger.info(successParts + "메론");
		}else if(refundCategory.equals("3")) {
			//완전취소 => 예약상태 컬럼에 3으로 insert
			int successAll = reserveDao.refundAll(reserve_idx1, reserve_idx2, reserve_idx3, loginId);
			//logger.info("메론" + successAll);
		}
		
	// 1-1. 방금 insert 한 예약idx를 select 해서 앞으로 insert 할 때 사용( 한 건의 환불에 대해서는 예약-결제-카트-마일리지가 모두 동일한 idx로 간다 )
		// 1. idx들의 예약번호와 같은 idx 중 예약 상태가 1이 아닌 것 찾아오기( 결제 테이블에 insert 할 reserve_idx 찾기 위해 )
		String[] reserve_num = reserveDao.selectIdx(reserve_idx1, reserve_idx2, reserve_idx3, loginId);
		
		String pay_idx1 = "";
		String pay_idx2 = "";
		String pay_idx3 = "";
		
		if(reserve_num[0] != null) {
			pay_idx1 = reserve_num[0];			
		}else if(reserve_num[1] != null) {
			pay_idx2 = reserve_num[1];			
		}else if(reserve_num[2] != null) {
			pay_idx3 = reserve_num[2];
		};
		
		
	// 2. pay 테이블에 insert
		// 1. 해당 예약을 select( 금액 포함 )
			ArrayList<ReserveDTO> priceRoom = reserveDao.priceAll(reserve_idx1, reserve_idx2, reserve_idx3, loginId);
			logger.info("여기서 : {}", priceRoom.size());
			
		// 2. 오늘 날짜 계산
			Calendar getToday = Calendar.getInstance();
			getToday.setTime(new java.util.Date()); //오늘 날짜
			logger.info("오늘 날짜 : {}", getToday);
			
			// 내가 계산하고 싶은 날짜
			String s_date = priceRoom.get(0).getCheckindate();
			java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s_date);
			Calendar cmpDate = Calendar.getInstance();
			cmpDate.setTime(date); //특정 일자
			logger.info("체크인 날짜 : {}", cmpDate);
			
			long diffSec = (cmpDate.getTimeInMillis() - getToday.getTimeInMillis()) / 1000;
			long diffDays = (diffSec / (24*60*60)) + 1; //일자수 차이		=> 원래 이걸로 써야해용
			logger.info("날짜차이 : {}", diffDays);
			//long diffDays = 3;
			
			//System.out.println(diffDays + "일 차이");
			
			
		// 3. 환불규정에 따라 환불해줄 금액 여기서 계산
			// ArrayList, List, HashMap => iterator for문 or while 돌리세요
			Iterator<ReserveDTO> iter = priceRoom.iterator();			// (1) iterator 준비
			ReserveDTO reserveDTO = null;								// (2) 한줄 담을 DTO
			// 마일리지 차감을 위해 환불금액 총합을 계산할 변수
			int AmountPrice = 0;
			// reserve_idx가 담긴 String 배열의 index로 사용할 변수 선언
			int flagIdx = 0;
			
			while(iter.hasNext()) {
				reserveDTO = iter.next();
				
				// 0) reserve_idx 대체해주기 - 20220331( 환불 시 예약과 결제의 reserve_idx를 동일하게 insert )
				reserveDTO.setReserve_idx(Integer.valueOf(reserve_num[flagIdx]));
				flagIdx++;
				
				
				// 1) 당일(날짜차이가 0) 취소의 경우 환불금액 X => 원래 진행안댐
				if(diffDays==0) {
					// => 돌려받을 금액 0 => insert 0
					reserveDTO.setAmount(0);
					reserveDTO.setPay_mileage(0);
					reserveDTO.setPay_price(0);
					logger.info("총 금액"+reserveDTO.getAmount());
					
					
				// 2) 1~7일 사이의 취소일 경우 환불금액 50%
				}else if(1 <= diffDays  && diffDays < 7){
					
					reserveDTO.setAmount((int) ((reserveDTO.getAmount() * (0.5))*(-1)));
					reserveDTO.setPay_price((int) ((reserveDTO.getPay_price() * (0.5)) * (-1)));
					reserveDTO.setPay_mileage((int) ((reserveDTO.getPay_mileage()) * (-1)));	// 마일리지 상품은 환불 불가
					
						// 마일리지를 위해 총 금액에 합산
						AmountPrice += Math.abs(reserveDTO.getPay_price());						// 마일리지 가격을 제외한 금액만 환불
					
					
					
					
//					20220331 예약 가격에 마일리지 사용 X( 마일리지 선차감시 사용했던 코드더미 )					
//					// 2-1. 마일리지 사용 금액이 있으면 => 마일리지 사용 안함
//					if(reserveDTO.getPay_mileage()>0) {
//						//(reserveDTO.getAmount() * (0.5))		// 총 환불금액
//						//reserveDTO.getPay_mileage()			// 마일리지 사용 금액 => 현재는 예약에서 마일리지를 사용할 수 업서용
//						
//						// 2-1-1. 환불 금액이 마일리지 사용 금액보다 크면 => 마일리지에서 차감 후 남은 금액은 현금 금액에서 차감 
//						if((reserveDTO.getAmount() * (0.5)) > reserveDTO.getPay_mileage()) {
//							// 금액가격 - ( 총액 - 마일리지금액 )
//							int refundPrice = (int) (reserveDTO.getPay_price() - ((reserveDTO.getAmount() * (0.5)) - reserveDTO.getPay_mileage()));
//							
//							reserveDTO.setAmount(refundPrice*(-1));
//							reserveDTO.setPay_mileage(0);
//							reserveDTO.setPay_price(refundPrice*(-1));
//
//							// 마일리지를 위해 총 금액에 합산
//							AmountPrice += Math.abs(reserveDTO.getAmount());
//							
//						// 2-1-2. 환불 금액이 마일리지 사용 금액보다 작으면 => 마일리지에서만 차감
//						}else {
//							reserveDTO.setAmount((int) ((reserveDTO.getAmount() * (0.5))*(-1)));
//							reserveDTO.setPay_price(reserveDTO.getPay_price()*(-1));
//							reserveDTO.setPay_mileage((int) (reserveDTO.getPay_mileage() - (reserveDTO.getAmount() * (0.5))*(-1)));
//							
//								// 마일리지를 위해 총 금액에 합산
//								AmountPrice += Math.abs(reserveDTO.getAmount());
//						}
//						
//						
//					// 2-2. 마일리지 사용이 없을 때	
//					}else {	
//						// 돌려받을 금액 50% => insert
//						reserveDTO.setAmount((int) (reserveDTO.getAmount()*(-0.5)));
//						//reserveDTO.setPay_mileage((int) (reserveDTO.getPay_mileage()*(-0.5)));
//						reserveDTO.setPay_price((int) (reserveDTO.getPay_price()*(-0.5)));
//						
//							// 마일리지를 위해 총 금액에 합산
//							AmountPrice += Math.abs(reserveDTO.getAmount());
//					}
					
					
				// 3) 7일 이후의 취소일 경우 환불금액 100%
				}else {
					// => 돌려받을 금액 100% => insert
					reserveDTO.setAmount((int) reserveDTO.getAmount()*(-1));
					reserveDTO.setPay_price((int) reserveDTO.getPay_price()*(-1));
					
					reserveDTO.setPay_mileage((int) reserveDTO.getPay_mileage()*(-1));
					
					
						// 마일리지를 위해 총 금액에 합산
						AmountPrice += Math.abs(reserveDTO.getPay_price());
				}
				
				// 4) 5) 을 여기서 처리할 수 있음( iterator next 될때마다 바로 DB에 insert )
				// 이번에 사용한 방식은 while 루프가 끝난 후 ArrayList를 mapper에서 foreach 돌리며 insert
			}
			
		// 4) 환불 계좌 정보 DTO에 저장해야함( 현재는 예약할 때 썼던 계좌로 바로 환불 해주고 있음, jsp에서 계좌정보 받아와야함)
		// HEX(AES_ENCRYPT(#{param3}, SHA2('a-key',512)))
							
		// 5) 금액 계산이 끝난 환불 데이터 insert
		if(refundCategory.equals("2")) {			// 부분 취소일 경우
			int successPayParts = reserveDao.refundPayParts(priceRoom);
			//logger.info("부분취소 결제 결과 rows"+successPayParts);
		}else if(refundCategory.equals("3")) {		// 완전 취소일 경우
			int successPayAll = reserveDao.refundPayAll(priceRoom);
			//logger.info("완전취소 결제 결과 rows"+successPayAll);
		}
		
	// 3. (마일리지 상품 있다면) cart 테이블에 insert
		int refundCart = reserveDao.refundCart(pay_idx1, pay_idx2, pay_idx3);		
		
	// 4. (회원이면) mileage 테이블 insert
		// 4-1. 해당 예약에 대한 가격을 가져온다
		// 4-2. 오늘 날짜와 체크인 데이트 비교해서 얼마 환불해줘야되는지 계산한다(환불 규정) => 2. 번에서 계산 => AmountPrice
		// 4-3. 회원등급에 따라 차감할 마일리지를 계산한다
		int DeMileage = 0;				// 차감 마일리지
		
		if(!loginId.equals("비회원")){
			// 회원정보 떼오기
			String grade = reserveDao.memberGradeAll(loginId);
			// 4-4. 차감 마일리지 계산
			if(grade.equals("silver")) {
				DeMileage = (AmountPrice * 1/100) * (-1);
			}else if(grade.equals("gold")) {
				DeMileage = (AmountPrice * 3/100) * (-1);
			}else if(grade.equals("diamond")) {
				DeMileage = (AmountPrice * 5/100) * (-1);
			}
			
			logger.info("현재 환불가격 : {}", AmountPrice);
			logger.info("차감 마일리지 : {}", DeMileage);

			// 4-5. 차감
			int successMil = reserveDao.mileageDeduction(DeMileage, loginId);
			
		}
	
	// 5. 예약번호 가져오기
	String reserveNum = priceRoom.get(0).getReserve_num();
	logger.info(reserveNum);
	
	
	return reserveNum;
	
	}
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	//객실 옵션 페이지 이지선 END 220315
