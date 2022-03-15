package co.kr.hotel.dao;

import java.util.HashMap;

import co.kr.hotel.dto.MemberDTO;

public interface MemberDAO {

	String login(String userId);
	
	String overlay(String id);

	String emailcheck(String email);

	int join(HashMap<String, String> param);

	String findid(String user_name, String user_birth, String user_email);

	int findpw(String user_id, String user_email, String hashText);





	
}
