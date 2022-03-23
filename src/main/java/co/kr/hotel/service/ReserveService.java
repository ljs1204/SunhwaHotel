package co.kr.hotel.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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




	
	
	
	//객실 옵션 페이지 이지선 END 220315
}
