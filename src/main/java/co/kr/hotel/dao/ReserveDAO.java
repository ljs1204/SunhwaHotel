package co.kr.hotel.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.dto.RoomDTO;

public interface ReserveDAO {

	ArrayList<RoomDTO> toReservelist(String checkin_date, String checkout_date, int cnt);

	ArrayList<HashMap<String, String>> reservation_option();

	ArrayList<HashMap<String, String>> reservation_product();

	int useable(String loginId);

	void roomOne(ReserveDTO dto);

	void roomOneCart(int reserve_idx, int product_cnt, String product_num);

	void buyMileageminus(String loginId, int productTotal, int mileage_useable);

	int product_price(String product_num);

	MemberDTO reservation_memInfo(String loginId);

	String roomIdx(RoomDTO roomDto);

	int rate(String loginId);

	void mileageSave(String loginId, int mileageSave, int useableSave);

	String mem_card(String mem_card);

	int extrabed_price();

	int breakfast_price();

	int room_price(int reserve_idx);

	void roomPay(int reserve_idx, String pay_num, String credit_num, int credit_validity, String credit_type, int pay_price,
			int pay_mile, int amount);

	int cardSave(HashMap<String, String> param);

	void nonMem(String nmem_code, int reserve_idx, String email, String phone, String name_en, String name_kr);


	ArrayList<RoomDTO> nulroom(String checkin_date, String checkout_date);


// 환불	
	// 1. 예약 테이블 insert
	int refundParts(String reserve_idx1, String reserve_idx2, String reserve_idx3, String loginId);		// 부분취소
	int refundAll(String reserve_idx1, String reserve_idx2, String reserve_idx3, String loginId);		// 완전취소

	// * 환불금액 계산 준비
	ArrayList<ReserveDTO> priceAll(String reserve_idx1, String reserve_idx2, String reserve_idx3, String loginId);
	
	// 2. 결제 테이블 insert
	int refundPayParts(String reserve_idx1, String reserve_idx2, String reserve_idx3);					// 부분취소
	int refundPayAll(String reserve_idx1, String reserve_idx2, String reserve_idx3);					// 완전취소
	
	//refundCart
	int refundCart(String reserve_idx1, String reserve_idx2, String reserve_idx3);

}
