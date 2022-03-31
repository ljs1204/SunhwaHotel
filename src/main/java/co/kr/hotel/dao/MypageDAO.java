package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ProductDTO;
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
	
	ArrayList<ReserveDTO> reserInfo(String userId, String reserve_idx);
	
	ArrayList<ReserveDTO> payDto(String reserve_num);
	
	ReserveDTO resernum(String loginId);
	
	
	ArrayList<MypageDTO> myPagemilelist(String loginId);
	
	int milelistCount(String loginId);
	
	ArrayList<MemberDTO> milelistInfo(int displayPost, int postNum, String loginId);
	
	
	MypageDTO mypagedto(String loginId);
	
	MemberDTO memberlist(String loginId);

	BoardDTO tomemberboarddetail(String board_num);
	
	ArrayList<BoardDTO> tomemberboardlist(String loginId);
	
	int tomemberboardwrite(HashMap<String, String> params);
	
	// 20220318 예약 상세보기 SI - 예약정보
	ReserveDTO myReserveDetail(String loginId, String reserve_num, int reserve_idx);
	// 20220318 예약 상세보기 SI - 상품정보 / 20220320 구매한 마일리지 상품 페이지도 해당 DAO 사용
	ArrayList<ProductDTO> myReserveProduct(String reserve_num);
	// 20220318 방 타입 쿼리 SI
	ArrayList<ReserveDTO> myReserveRoom(String loginId, String reserve_num);
	// 20220319 환불 신청 페이지 SI
	ArrayList<ReserveDTO> myReserveRefund(String loginId, String reserve_num);
	ArrayList<HashMap<String, String>> boardlist_listCall(MemberDTO parameter);
	int boardlist_allCount(MemberDTO parameter);
	// 20220331 환불 후 찍어줄때
	ArrayList<ReserveDTO> myRefund(String loginId, String reserve_num);

	

	

	

}