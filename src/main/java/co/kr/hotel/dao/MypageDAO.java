package co.kr.hotel.dao;

import java.util.ArrayList;

import co.kr.hotel.dto.ReserveDTO;

public interface MypageDAO {

	ArrayList<ReserveDTO> mypage2Reservelist(String loginId);

	ReserveDTO reserInfo(String userId, String reserve_num);

	ReserveDTO payDto(String reserve_num);

	ReserveDTO resernum(String loginId);

}
