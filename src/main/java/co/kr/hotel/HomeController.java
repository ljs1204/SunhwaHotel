package co.kr.hotel;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET) // 이건 GET방식으로 전송 했을 경우만 받아주라는 것임. post방식은 받지 않는다.
	public String home2(Model model, HttpSession session) {
		
		// model은 특정 페이지로 보내고 싶은 내용을 담는 객체이다
		logger.info("homepage로 요청이 들어옴 ");
		model.addAttribute("msg","Hello Spring FramWork"); // model은 특정 페이지로 보내고 싶은 내용을 담는 객체
		
		
		// 메인페이지 요청 세션검사 추가 START - SI 20220314  
		String loginId = (String) session.getAttribute("loginId");
		//loginId = "admin";	// 아이디 'admin' 일 때
		loginId = "아이디";
		
		if(loginId != null) {
			model.addAttribute("loginId", loginId);
		}
		// 메인페이지 요청 세션검사 추가 END - SI 20220314 
		
		
		return "index";//home.jsp로 보내라
	}
	
	
}
