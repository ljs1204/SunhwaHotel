package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.BoardDTO;

public interface BoardDAO {

	BoardDTO detail(String board_num);
	
	ArrayList<BoardDTO> list();
	
	int write(HashMap<String, String> params);
	
}