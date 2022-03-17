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
	
	String overlay(String id);

	String emailcheck(String email);

	int join(HashMap<String, String> param);

	String findid(String user_name, String user_birth, String user_email);

	int findpw(String user_id, String user_email, String hashText);

	MemberDTO logmem_grade(String userId);

}
