package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ManagerDAO {

	ArrayList<HashMap<String, String>> adOrderList();
	
	int writing(HashMap<String, String> params);
	

	
}
