package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ReserveDTO;


public interface MypageDAO {

	// 20220315 예약 리스트 SI
	ArrayList<ReserveDTO> myReserveAll(String loginId);
	ArrayList<ReserveDTO> myReserveParts(String loginId);
	//

	

	//ArrayList<ReserveDTO> mypage2Reservelist(String loginId);
	
	ReserveDTO reserInfo(String userId, String reserve_num);
	
	ReserveDTO payDto(String reserve_num);
	
	ReserveDTO resernum(String loginId);
	
	BoardDTO tomemberboarddetail(String board_num);
	
	ArrayList<BoardDTO> tomemberboardlist(String loginId);
	
	int tomemberboardwrite(HashMap<String, String> params);

	

	

	

}