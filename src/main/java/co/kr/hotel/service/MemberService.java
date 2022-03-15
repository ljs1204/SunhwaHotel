package co.kr.hotel.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.MemberDAO;
import co.kr.hotel.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired MemberDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 0311 백유나 회원정보 수정 START 	
	public MemberDTO myprofile(String loginId) {
		MemberDTO myProfile = dao.myprofile(loginId);

		return myProfile;
	}
	// 0311 백유나 회원정보 수정 END		
	
	public HashMap<String, Object> emailIdentify(String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overlayd = dao.emailIdentify(email);
		boolean emailTF = overlayd == null? false : true;
		map.put("emailTF", emailTF);
		return map;
	}
	
	public HashMap<String, Object> profileUpdate(HashMap<String, String> userupdate) {
		logger.info("파라메터가 서비스에 도착함? {}",userupdate);
		int row = dao.profileUpdate(userupdate);	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		logger.info("성공했니? {}",row);
		
		return map;
	}
	
	   //로그인 이지선 0311 Start
	   public boolean login(String userId, String userPw) {
	      String Db_pw = dao.login(userId);
	      
	      Boolean success = false;
	      if(Db_pw != null){
	         BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	         success = encoder.matches(userPw, Db_pw);
	      }
	      
	      return success;
	   }
}