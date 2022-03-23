package co.kr.hotel.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.hotel.service.UnReserveService;

@Controller
public class UnReserveController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UnReserveService unreserveservice;
	
	@RequestMapping(value="/unMyReserve")
	public String unMyReserve() {
		return "unMyReserve";
	}	
	
	//비회원 예약조회 페이지 백유나 START 220322
	@RequestMapping(value = "/beMyReserve", method = RequestMethod.POST)
	@ResponseBody 
	public HashMap<String, Object> beMyReserve(
			@RequestParam String reserve_num, @RequestParam String non_name_en
				, @RequestParam String non_email) {
		logger.info("비회원 체크 :{} / {}", reserve_num, non_name_en);
		
		int success = unreserveservice.beMyReserve(reserve_num,non_name_en,non_email);
		logger.info("비회원 예약확인 성공 여부:{}", success);
		HashMap<String, Object> map 
			= new HashMap<String, Object>();
		
		if (success>0) {
			//map.put("reserve_Num", reserve_num);
		}
		map.put("success", success);	
		return map;
	}
	//비회원 예약조회 페이지 백유나 START 220322
	@RequestMapping(value="/unMyReserveList")
	public String unMyReserveList() {
		return "unMyReserveList";
	}	
	
	
	
}
