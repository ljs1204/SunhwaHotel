package co.kr.hotel.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.service.MemberService;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService service;
	
	
	//로그인, 로그아웃, 회원가입 이지선 0311 Start
	@RequestMapping(value = "/login", method = RequestMethod.GET) 
	public String login() {
		return "login";
	}
	
	
	@PostMapping(value="login")
	public String login(Model model,@RequestParam String userId, @RequestParam String userPw, HttpSession session) {
		
		String page="login";
	
		if(service.login(userId,userPw)) {
			page = "redirect:/";
			session.setAttribute("loginId", userId);

		}else {
			model.addAttribute("msg","입력하신 내용이 일치하지 않습니다.");
		}
		String id = (String)session.getAttribute("loginId");
		logger.info("로그인한아이디: "+id);
		return page;
	}
	
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃 요청");
		session.removeAttribute("loginId");
		return "redirect:/";
	}
	
	
	//회원가입
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("회원가입 페이지 이동");
		
		return "joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> param) {
		
		logger.info("회원가입 요청 :{}",param);
		
		return service.join(param);
	}
	
	
	
	@GetMapping(value="/overlay")
	@ResponseBody
	public HashMap<String,Object> overlay(@RequestParam String id) {
		logger.info("중복체크:{}",id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean overlay = service.overlay(id);
		map.put("overlay",overlay);
		return map;
	}
	
	@GetMapping(value="/emailcheck")
	@ResponseBody
	public HashMap<String, Object> emailcheck(@RequestParam String email) {
		logger.info("email 중복조회 : {}",email);
		HashMap<String, Object> emailcheck = service.emailcheck(email);
		return emailcheck;
	}
	
	
	//로그인, 로그아웃, 회원가입 이지선 0311 END	

	//아이디,비밀번호 찾기 이지선 0314 Start
	@RequestMapping(value = "/findIdPw", method = RequestMethod.GET)
	public String findIdPw(Model model) {
		logger.info("아이디,비밀번호 찾기 페이지 이동");
		
		return "findIdPw";
	}
	
	@RequestMapping(value = "/findid")
    @ResponseBody 
    public HashMap<String, Object> findid(
            @RequestParam String user_name, @RequestParam String user_birth,
            @RequestParam String user_email, HttpSession session) {
		logger.info("로그인 체크:{} / {}", user_birth);
        String success = service.findid(user_name, user_birth, user_email);
        logger.info("아이디 찾기 여부 성공:{}", success);
        HashMap<String, Object> map = new HashMap<String, Object>();
        
        if (success != null) {
        	map.put("success", success);    
        } else {
        	map.put("success", "아이디없음");
        }
        return map;
    }
	
	
	@RequestMapping(value = "/findpw")
    @ResponseBody 
    public HashMap<String, Object> findpw(
            @RequestParam String user_id, @RequestParam String user_email, @RequestParam String temp_pw) {
		logger.info("비밀번호 확인시 필수 정보 체크:{} / {}", user_id, user_email);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String hashText = encoder.encode(temp_pw);
		logger.info("암호화 된 값 : "+hashText);
		
        int success = service.findpw(user_id, user_email,hashText);
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        
        map.put("success", success);
        
        return map;
    }
	
	
	//아이디,비밀번호 찾기 이지선 0314 END
}
