package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.dto.MypageDTO;

public interface BoardDAO {

	BoardDTO detail(String board_num);
	
	int write(HashMap<String, String> params);

	ArrayList<BoardDTO> list();
	
	int delete(String board_num);
	

}