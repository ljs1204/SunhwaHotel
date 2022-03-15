package co.kr.hotel.dao;

import java.util.ArrayList;

import co.kr.hotel.dto.RoomDTO;

public interface RoomDAO {

	ArrayList<RoomDTO> roomlist();

	RoomDTO roomdetaillist(String room_num);

	ArrayList<RoomDTO> roomPhotodto(String room_num);

}
