package co.kr.hotel.dao;

import java.util.HashMap;

import co.kr.hotel.dto.MemberDTO;

public interface MemberDAO {
	
	// 0311 백유나 회원정보 수정 START	
	MemberDTO myprofile(String loginId);
	
	String emailIdentify(String email);
	// 0311 백유나 회원정보 업데이트 START
	int profileUpdate(HashMap<String, String> userupdate);

	String login(String userId);
	
}
