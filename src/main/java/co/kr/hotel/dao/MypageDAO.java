package co.kr.hotel.dao;

import java.util.ArrayList;

import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ReserveDTO;


public interface MypageDAO {

	// 20220315 예약 리스트 SI
	ArrayList<ReserveDTO> myReserve1(String loginId);
	ArrayList<ReserveDTO> myReserve2(String loginId);
	

	ArrayList<MypageDTO> tomemberboardlist();

	ArrayList<ReserveDTO> mypage2Reservelist(String loginId);
	
	ReserveDTO reserInfo(String userId, String reserve_num);
	
	ReserveDTO payDto(String reserve_num);
	
	ReserveDTO resernum(String loginId);

	

	

	

}