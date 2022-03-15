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
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	public boolean overlay(String id) {
		boolean overlay = true;
		
		String chkId = dao.overlay(id);
		
		if(chkId == null) {
			overlay = false;
		}
		
		return overlay;
	}

	
	public HashMap<String, Object> emailcheck(String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String checked = dao.emailcheck(email);
		boolean emailChecked = checked == null? false : true;
		map.put("emailChecked", emailChecked);
		return map;
	}

	
	
	public HashMap<String, Object> join(HashMap<String, String> param) {
		
		
		String pw = param.get("pw"); 
		logger.info("plain pw : "+ pw);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encPw = encoder.encode(pw);
		logger.info("enc pw :"+encPw);
		param.replace("pw", encPw);		
		
		int row = dao.join(param);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("success",row);
		return map;
	}



	public String findid(String user_name, String user_birth, String user_email) {
		return dao.findid(user_name, user_birth, user_email);
	}

	public int findpw(String user_id, String user_email, String hashText) {
		return dao.findpw(user_id,user_email,hashText);
	}







	
	
}
