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

	ArrayList<RoomDTO> roomIdx(RoomDTO roomDto);

	int rate(String loginId);

	void mileageSave(String loginId, int mileageSave, int useableSave);

}
