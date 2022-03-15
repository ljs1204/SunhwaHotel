package co.kr.hotel.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.service.MemberService;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberService service;
	
	// 0311 백유나 회원정보 수정 START 
	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public String myProfile(Model model,  HttpSession session) { 
		logger.info("myProfile 요청");
		String loginId = (String) session.getAttribute("loginId");
		MemberDTO myProfile = service.myprofile(loginId);
		model.addAttribute("myProfile",myProfile);
		

		return "myProfile"; 	
	}
	// 0311 백유나 회원정보 수정 END
	
	// 0311 백유나 회원정보 업데이트 START 
	@RequestMapping(value = "/emailPage", method = RequestMethod.GET)
	public String emailPage(Model model) {
		logger.info("email입니다.");
		
		return "emailPage";
	}	

	
	@RequestMapping(value="/overlayemail" , method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> overlayemail(@RequestParam String email) {
		logger.info("email 중복조회 : {}",email);
		HashMap<String, Object> emailIdentify = service.emailIdentify(email);
		return emailIdentify;
	}
	
	@RequestMapping(value="/profileupdate" , method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> profileupdate(@RequestParam HashMap<String, String> userupdate) {
		logger.info("프로필 업데이트 요청을 받았습니다. {}",userupdate);
		return service.profileUpdate(userupdate);		
	}
	
	// 0311 백유나 회원정보 업데이트 END	
	
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


	      return page;
	   }



	
	
}
