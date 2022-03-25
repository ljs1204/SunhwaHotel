package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.dto.RoomDTO;

public interface UnReserveDAO {

	ArrayList<HashMap<String, String>> unMyReserveDetail();
	/*룸 정보를 제외한 것들을 가져오는 쿼리*/
	ReserveDTO beMyReserve(String reserve_num, String non_name_en, String non_email);
	/*룸 정보를 가져오는 쿼리*/
	ArrayList<ReserveDTO> unBeMyReserve(String reserve_num, String non_name_en, String non_email);
	
}
