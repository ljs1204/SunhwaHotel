package co.kr.hotel.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dao.MypageDAO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ReserveDTO;

@Service
public class MypageService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageDAO mypageDao;
	
	public ArrayList<ReserveDTO> myReserve(String loginId) {
		ArrayList<ReserveDTO> result = new ArrayList<ReserveDTO>();
		
		logger.info("여기");
		
		// process1 => loginId의 예약리스트를 예약번호별로 group, 그 결과를 예약날짜, 
		//예약상태 순으로 내림차순한 결과
		// ==> 해당 사용자의 모든 예약의 상태를 볼 수 있음
		ArrayList<ReserveDTO> process1 = mypageDao.myReserve1(loginId);
		
		// process2 => loginId의 예약리스트 중 예약상태가 1인 정보를 가져옴( 처음 예약할 때 정보 )
		// ==> 초기 예약 때의 객실 수를 체크 가능
		ArrayList<ReserveDTO> process2 = mypageDao.myReserve2(loginId);
		
		// process1 + process 2 = result
		logger.info("process1 길이 : {}", process1.size());
		logger.info("process2 길이 : {}", process2.size());
		
		
		return result;
		
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


	public ModelAndView tomemberboardlist() {
		
		logger.info("Mypage 서비스 시작");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tomemberboardlist");
		ArrayList<MypageDTO> tomemberboardlist = mypageDao.tomemberboardlist();		
		logger.info("리스트 갯수 : {}",tomemberboardlist.size());
		mav.addObject("tomemberboardlist", tomemberboardlist);
		
		return mav;
	}
}
