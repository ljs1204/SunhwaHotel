package co.kr.hotel.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean pass = false;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginId") != null) {
			pass = true;
		}else {
			pass = false;
			response.sendRedirect("/hotel/");
		}
		return pass;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		//HttpSession session = request.getSession();
		//logger.info("포스트핸들러 작동 : "+session);
	}

	
}
