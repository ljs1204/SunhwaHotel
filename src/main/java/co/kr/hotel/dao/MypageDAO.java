package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ReserveDTO;


public interface MypageDAO {

	// 20220315 회원 정보 조회 SI( + 사용 가능 마일리지, 누적 마일리지 )
	MemberDTO myInfo(String loginId);
	// 20220315 이용 실적 조회=> 쿼리 결과 row 개수가 필요한데, count가 안먹어서 일단 DTO로
	ArrayList<ReserveDTO> reserveCnt(String loginId);	
	
	// 20220315 예약 리스트 SI
	ArrayList<ReserveDTO> myReserveAll(String loginId);
	ArrayList<ReserveDTO> myReserveParts(String loginId);
	//

	

	//ArrayList<ReserveDTO> mypage2Reservelist(String loginId);
	
	MypageDTO reserInfo(String userId, int reserve_idx);
	
	ReserveDTO payDto(String reserve_num);
	
	ReserveDTO resernum(String loginId);
	
	
	ArrayList<MypageDTO> myPagemilelist(String loginId);
	
	int milelistCount(String loginId);
	
	ArrayList<MemberDTO> milelistInfo(int displayPost, int postNum, String loginId);
	
	
	MypageDTO mypagedto(String loginId);
	
	MemberDTO memberlist(String loginId);

	BoardDTO tomemberboarddetail(String board_num);
	
	ArrayList<BoardDTO> tomemberboardlist(String loginId);
	
	int tomemberboardwrite(HashMap<String, String> params);

	

	

	

}