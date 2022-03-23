package co.kr.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.RoomDAO;
import co.kr.hotel.dto.RoomDTO;

@Service
public class RoomService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomDAO roomdao;
	
	
	// 객실 상세정보
	public ArrayList<RoomDTO> roomlist() {
		// TODO Auto-generated method stub
		return roomdao.roomlist();
	}

	public RoomDTO roomdetaillist(String room_num) {
				
		return roomdao.roomdetaillist(room_num);
	}


	public ArrayList<RoomDTO> roomPhotodto(String room_num) {
		// TODO Auto-generated method stub
		return roomdao.roomPhotodto(room_num);
	}

// 20220321 객실 리스트 보기 SI START
	public HashMap<String, Object> roomsList() {
		ArrayList<RoomDTO> roomDto = roomdao.roomsList();
		ArrayList<RoomDTO> roomPhotos = roomdao.roomsPhotos();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("roomDto", roomDto);
		result.put("roomPhotos", roomPhotos);
		
		return result;
	}
// 20220321 객실 리스트 보기 SI END
	
}









