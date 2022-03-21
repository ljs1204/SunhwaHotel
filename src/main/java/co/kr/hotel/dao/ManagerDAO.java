package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.MileagePhotoDTO;
import co.kr.hotel.dto.ProductDTO;

public interface ManagerDAO {

	ArrayList<ProductDTO> adOrderList();

	int writing(ProductDTO dto);
	
//	ProductDTO detailing(String product_num);
	
	void fileWriting(String product_num, String oriFileName, String newFileName);
	
	void fileWriting(int product_num, String oriFileName, String newFileName);
	
	ArrayList<MileagePhotoDTO> photoList(String product_num);

	int deleting(String product_num);
	//아래 내가 추가함 
	String writing(int product_price);

	int writing(HashMap<String, String> userupdate);
}
