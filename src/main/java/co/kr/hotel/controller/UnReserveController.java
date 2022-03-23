package co.kr.hotel.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.hotel.dto.ReserveDTO;
import co.kr.hotel.dto.RoomDTO;
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
	
	@RequestMapping(value="/beMyReserve", method = RequestMethod.GET)
	public String beMyReserve(Model model, @RequestParam String reserve_num, 
			@RequestParam String non_name_en, @RequestParam String non_email) {
		logger.info("beMyReserve 콘트롤러 :{}");		
		/*룸 정보를 제외한 것들을 가져오는 쿼리*/
		ReserveDTO  reserveDTO = unreserveservice.beMyReserve(reserve_num, non_name_en, non_email);   
		/*룸 정보를 가져오는 쿼리*/
		ArrayList<ReserveDTO>  roomDTO = unreserveservice.unBeMyReserve(reserve_num, non_name_en, non_email); 
        logger.info("데이터 들어갔니?:{}", roomDTO.size());
        // model.addAttribute("dto", dto); 
        model.addAttribute("roomDTO",roomDTO);
        model.addAttribute("dto", reserveDTO);
        
        return "unMyReserveDetail";
	}	
	
}
	