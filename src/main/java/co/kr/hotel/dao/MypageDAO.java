package co.kr.hotel.dao;

import java.util.ArrayList;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ReserveDTO;


public interface MypageDAO {

	// 20220315 예약 리스트 SI
	ArrayList<ReserveDTO> myReserveAll(String loginId);
	ArrayList<ReserveDTO> myReserveParts(String loginId);
	//

	ArrayList<MypageDTO> tomemberboardlist();

	//ArrayList<ReserveDTO> mypage2Reservelist(String loginId);
	
	MypageDTO reserInfo(String userId, int reserve_idx);
	
	ReserveDTO payDto(String reserve_num);
	
	ReserveDTO resernum(String loginId);
	
	
	ArrayList<MypageDTO> myPagemilelist(String loginId);
	
	int milelistCount(String loginId);
	
	ArrayList<MemberDTO> milelistInfo(int displayPost, int postNum, String loginId);
	
	
	MypageDTO mypagedto(String loginId);
	
	MemberDTO memberlist(String loginId);

	

	

	

}