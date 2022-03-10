package co.kr.hotel;

import java.util.Locale;

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
	public String home2( Model model) {
		
		// model은 특정 페이지로 보내고 싶은 내용을 담는 객체이다
		logger.info("homepage로 요청이 들어옴 ");
		model.addAttribute("msg","Hello Spring FramWork"); // model은 특정 페이지로 보내고 싶은 내용을 담는 객체
		return "index";//home.jsp로 보내라
	}
	
	
}
