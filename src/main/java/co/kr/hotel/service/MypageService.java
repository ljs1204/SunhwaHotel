package co.kr.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dao.MypageDAO;
import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ReserveDTO;

@Service
public class MypageService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageDAO mypageDao;
	
// 20220315 예약 리스트 조회 SI START
	public ArrayList<ReserveDTO> myReserve(String loginId) {
				
		// process1 => loginId의 예약리스트를 예약번호별로 group, 그 결과를 예약날짜, 
		//예약상태 순으로 내림차순한 결과
		// ==> 해당 사용자의 모든 예약의 상태를 볼 수 있음
		ArrayList<ReserveDTO> processAll = mypageDao.myReserveAll(loginId);
		
		// process2 => loginId의 예약리스트 중 예약상태가 1인 정보를 가져옴( 처음 예약할 때 정보 )
		// ==> 초기 예약 때의 객실 수를 체크 가능
		ArrayList<ReserveDTO> processParts = mypageDao.myReserveParts(loginId);
		
		// processAll에 processParts 입혀주기
		logger.info("process1 길이 : {}", processAll.size());
		logger.info("process2 길이 : {}", processParts.size());
		
		// iterator
		Iterator<ReserveDTO> iter1 = processAll.iterator();
		Iterator<ReserveDTO> iter2 = processParts.iterator();
		
		ReserveDTO reserveDTO1 = null;
		ReserveDTO reserveDTO2 = null;
		
		// iterator로 돌리면서 예약한 방 갯수 입력해주기
		while (iter1.hasNext()) {
			// iterator로 next() 하며 한개씩 확인
			 reserveDTO1 = iter1.next();
			 while(iter2.hasNext()) {
				 reserveDTO2 = iter2.next();
				 // reserveDTO1의 예약번호와 reserveDTO2의 예약번호가 같다면 reserve_room_cnt 입혀주기
				 if(reserveDTO1.getReserve_num().equals(reserveDTO2.getReserve_num())) {
					 reserveDTO1.setReserve_room_cnt(reserveDTO2.getReserve_room_cnt());
					 logger.info("확인하는 중 : {}", reserveDTO1.getReserve_room_cnt());
					 break;
				 }
			 }		
			 // iter2 초기화( 비교하는 테이블 인덱스 초기화 )
			 iter2 = processParts.iterator();
		}
		
		return processAll;		
	}
// 20220315 예약 리스트 조회 SI END
	
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

	public ModelAndView tomemberboarddetail(String board_num) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tomemberboarddetail");
		BoardDTO dto = mypageDao.tomemberboarddetail(board_num);
		mav.addObject("tomemberboarddetail", dto);		
		return mav;
	}
	
	//리스트
	public ModelAndView tomemberboardlist(String loginId) {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tomemberboardlist");
		ArrayList<BoardDTO> tomemberboardlist = mypageDao.tomemberboardlist(loginId);		
		logger.info("리스트 갯수 : {}",tomemberboardlist.size());
		mav.addObject("tomemberboardlist", tomemberboardlist);
		return mav;
	}
	//글쓰기 
	public void tomemberboardwrite(HashMap<String, String> params) {
		int row = mypageDao.tomemberboardwrite(params);
		logger.info(" 입력된 건수 : {}",row);
	}
	

	
}
