package co.kr.hotel.dao;

import java.util.ArrayList;

import co.kr.hotel.dto.RoomDTO;

public interface RoomDAO {

	ArrayList<RoomDTO> roomlist();

	RoomDTO roomdetaillist(String room_num);

	ArrayList<RoomDTO> roomPhotodto(String room_num);

	// 20220321 객실 리스트 보기 SI
	ArrayList<RoomDTO> roomsList();
	ArrayList<RoomDTO> roomsPhotos();

	

}
