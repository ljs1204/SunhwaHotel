package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.MileagePhotoDTO;
import co.kr.hotel.dto.ProductDTO;

public interface ManagerDAO {
	
	ArrayList<ProductDTO> adOrderList();
	
	int writing(HashMap<String, String> params);

	int del(String product_num);

	int writing(ProductDTO dto);
	
	ProductDTO detailing(String product_num);
	
	}
	/* 파일 업로드 관련
	void fileWrite(String product_num, String oriFileName, String newFileName);
	
	void fileWrite(int product_num, String oriFileName, String newFileName);
	
	ArrayList<MileagePhotoDTO> photoList(String product_num);
	*/
	

