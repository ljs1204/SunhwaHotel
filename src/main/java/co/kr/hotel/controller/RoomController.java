package co.kr.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.hotel.dto.RoomDTO;
import co.kr.hotel.service.RoomService;

@Controller
public class RoomController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomService roomservice;
	
	// 20220321 객실 리스트 보기 SI START
	@RequestMapping(value = "/roomsList", method = RequestMethod.GET)
	public String roomList( Model model ) {
		logger.info("roomList 요청");
		
		// 방 정보 가져오기( + 사진 )
		HashMap<String, Object> roomDto = roomservice.roomsList();
		model.addAttribute("roomsList", roomDto.get("roomDto"));
		model.addAttribute("roomPhotos", roomDto.get("roomPhotos"));
		
		
		return "roomsList";
	}
	
	
	
	//객실 상세정보 유선화 START 20220311 
	@RequestMapping(value = "/roomdetail", method = RequestMethod.GET)
	public String roomdetail( Model model,@RequestParam String room_num) {
		
		logger.info("roomdetail로 요청이 들어옴 " +room_num);
		RoomDTO roomdto = new RoomDTO();
		
		roomdto = roomservice.roomdetaillist(room_num);
		logger.info("roomdto" +roomdto);
		model.addAttribute("roomdetaillist", roomdto);
		
		ArrayList<RoomDTO> roomPhotodto = roomservice.roomPhotodto(room_num);
		model.addAttribute("roomPhotodto", roomPhotodto);
		
		return "roomdetail";
	}
	//객실 상세정보 유선화 END 20220311 
}
