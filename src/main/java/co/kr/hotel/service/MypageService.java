package co.kr.hotel.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.MypageDAO;
import co.kr.hotel.dto.ReserveDTO;

@Service
public class MypageService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageDAO mypageDao;
	
	
	public ArrayList<ReserveDTO> mypage2Reservelist(String loginId) {
		// TODO Auto-generated method stub
		return mypageDao.mypage2Reservelist(loginId);
	}


	public ReserveDTO reserInfo(String userId, String reserve_num) {
		// TODO Auto-generated method stub
		return mypageDao.reserInfo(userId,reserve_num);
	}


	public ReserveDTO payDto(String reserve_num) {
		// TODO Auto-generated method stub
		return mypageDao.payDto(reserve_num);
	}


	public ReserveDTO resernum(String loginId) {
		// TODO Auto-generated method stub
		return mypageDao.resernum(loginId);
	}

}
