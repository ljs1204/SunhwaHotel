package co.kr.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.MileagePhotoDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ProductDTO;
import co.kr.hotel.dto.ReserveDTO;

public interface ManagerDAO {
	
	ArrayList<ProductDTO> adOrderList();
	
	int writing(HashMap<String, String> params);

	int del(String product_num);

	int writing(ProductDTO dto);
	
	ProductDTO detailing(String product_num);

	ArrayList<ReserveDTO> myReserveAllAdmin(String loginId);

	ArrayList<ReserveDTO> myReservePartsAdmin(String loginId);

// 20220323 회원 정보 보기
	MemberDTO memInfo(String mem_id);
	

	ArrayList<ManagerDAO> search(MemberDTO parameter);

	ArrayList<MypageDAO> adminmilesearch(MypageDTO parameter);

// 20220324 달력 데이터 SI
	ArrayList<ReserveDTO> reserveListGet();

	ArrayList<HashMap<String, String>> memlist_listCall(int pagePerCnt, int offset);

	int memlist_allCount();

	ArrayList<HashMap<String, String>> memlist();
	
	}
	/* 파일 업로드 관련
	void fileWrite(String product_num, String oriFileName, String newFileName);
	
	void fileWrite(int product_num, String oriFileName, String newFileName);
	
	ArrayList<MileagePhotoDTO> photoList(String product_num);
	*/
	

