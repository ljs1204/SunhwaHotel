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
import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.BoardDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.PageDto;
import co.kr.hotel.dto.ProductDTO;
import co.kr.hotel.dto.ReserveDTO;

@Service
public class MypageService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageDAO mypageDao;
	
// 20220316 회원 정보 조회 SI START
	public MemberDTO myInfo(String loginId) {
		// 회원 정보 쿼리
		MemberDTO result = mypageDao.myInfo(loginId);
		// 이용 실적 계산을 위한 해당 년도안의 예약 횟수 쿼리( 예약취소 제외 / 부분취소 포함 )
		ArrayList<ReserveDTO> reserveCnt = mypageDao.reserveCnt(loginId);
		int cnt = reserveCnt.size();		// 올 해 이용 실적
		if(cnt != 0) {
			result.setReserve_cnt_year(cnt);
		}
		
		//logger.info("사용 마일리지 : {}", result.getMileage_useable());
		//logger.info("누적 마일리지 : {}", result.getMileage_stacked());
		
		
		return result;
	}
	
	
// 20220316 회원 정보 조회 SI START
	
	
	
// 20220315 예약 리스트 조회 SI START
	public HashMap<String, Object> myReserve(String loginId, int num) {
		HashMap<String, Object> result = new HashMap<String, Object>();		
		
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
		
// 20220317 게시물 페이징 처리( 단위 : 5 ) START SI
		
		// 게시물 총 갯수
		 int count = processAll.size();
		  
		 // 한 페이지에 출력할 게시물 갯수
		 int postNum = 5;
		  
		 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		 int pageNum = (int)Math.ceil((double)count/postNum);
		  
		 // 게시물 시작 번호
		 int displayPost = (num - 1) * postNum;
		 
		 // 1번째 0~5
		 // displayPost ~ postNum * num
		 // 2번째 5~10
		 // displayPost ~ PostNum * num
		 // 3번째 10~15
		 // displayPost ~ PostNum * num
		 // 게시글 끝 번호
		 int endPost = postNum * num;
		 
		 
		 // 루프 돌면서 페이지 번호에 맞는 데이터만 남기기
		 Iterator<ReserveDTO> iter3 = processAll.iterator();
		 int reserveIdx = 0;
		 
		 logger.info("{}, {}" , displayPost, endPost);
		 
		 
		 // iterator 루프시키면서 게시글 시작 번호, 게시글 끝 번호 바깥에 있는 데이터는 지워주기
		 while (iter3.hasNext()) {
			 iter3.next();
			 
			if(reserveIdx < displayPost | reserveIdx >= endPost) {
				iter3.remove();
				logger.info("무한루프");
			}
			reserveIdx++;
		 }
		 
		 result.put("count", count);			// 게시물 총 갯수
		 result.put("pageNum", pageNum);		// 하단 페이징 번호
		 result.put("processAll", processAll);	// 예약 리스트
		 
// 20220317 게시물 페이징 처리( 단위 : 5 ) END SI
		 
// 20220317 페이징 번호를 5개씩 나누기 START SI => 현재는 Start 1 / end 2 라서 이전, 다음 표시가 안나옴니당
		 // 한번에 표시할 페이징 번호의 갯수
		 int pageNum_cnt = 5;

		 // 표시되는 페이지 번호 중 마지막 번호
		 int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);

		 // 표시되는 페이지 번호 중 첫번째 번호
		 int startPageNum = endPageNum - (pageNum_cnt - 1);
		 
		// 마지막 번호 재계산
		 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		  
		 if(endPageNum > endPageNum_tmp) {
		  endPageNum = endPageNum_tmp;
		 }
		 
		 result.put("startPageNum", startPageNum);
		 result.put("endPageNum", endPageNum);
		 result.put("pageNum_cnt", pageNum_cnt);
// 20220317 페이징 번호 나누기 END SI
		 
		 
		return result;		
	}
// 20220315 예약 리스트 조회 SI END
	
	public MypageDTO reserInfo(String userId, int reserve_idx) {
		// TODO Auto-generated method stub
		return mypageDao.reserInfo(userId,reserve_idx);
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


	public ArrayList<MypageDTO> myPagemilelist(String loginId) {
		// TODO Auto-generated method stub
		return mypageDao.myPagemilelist(loginId);
	}
	// 마일리지 리스트 페이징 START 유선화 2022.03.16
	public int milelistCount(String loginId) {
		// TODO Auto-generated method stub
		PageDto dto = new PageDto();
		dto.setLoginId(loginId);
		
		return mypageDao.milelistCount(loginId);
	}
	// 마일리지 리스트 페이징 ENd 유선화 2022.03.16

	public ArrayList<MemberDTO> milelistInfo(int displayPost, int postNum, String loginId) {
		PageDto dto = new PageDto();
		dto.setUserid(loginId);
		dto.setPostNum(postNum);
		dto.setDisplayPost(displayPost);
		logger.info("postNum : {}", postNum);
		
		return mypageDao.milelistInfo(displayPost,postNum,loginId);
	}

	public MypageDTO mypagedto(String loginId) {
		
		
		return mypageDao.mypagedto(loginId);
	}

	public MemberDTO memberlist(String loginId) {
		MemberDTO dto = new MemberDTO();
		
		String pw = dto.getMem_pw();
		logger.info("memberlist service pw : "+pw);
		
		return mypageDao.memberlist(loginId);
	}

	//글쓰기 
	public void tomemberboardwrite(HashMap<String, String> params) {
		int row = mypageDao.tomemberboardwrite(params);
		logger.info(" 입력된 건수 : {}",row);
	}


	// 20220318 예약 상세보기 SI	
	public HashMap<String, Object> myReserveDetail(String loginId, String reserve_num, int reserve_idx) {
		// 1. 마일리지 상품 정보를 제외한 결과 쿼리( 방별로 또 상품별로 갯수가 다르기 때문에 따로 쿼리 )
		ReserveDTO reserveDTO = mypageDao.myReserveDetail(loginId, reserve_num, reserve_idx);
		
		// 2. 마일리지 상품 정보 쿼리
		ArrayList<ProductDTO> productDTO = mypageDao.myReserveProduct(reserve_num);
		//logger.info("mypageDTO : {}", mypageDTO.getAdult_cnt());
		//logger.info("productDTO : {}", productDTO.get(1));
		
		// 3. 방 타입 정보 쿼리
		ArrayList<ReserveDTO> roomTypeName = mypageDao.myReserveRoom(loginId, reserve_num);
		
		// 3. hashmap에 담기
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("reserveDTO", reserveDTO);	// DTO 한 줄
		result.put("productDTO", productDTO);	// ArrayList
		result.put("roomTypeName", roomTypeName);
		
		return result;
	}

// 20220319 환불 신청 페이지 START - SI
	public HashMap<String, Object> myReserveRefund(String loginId, String reserve_num) {
	// 1. 컨트롤러로 보낼 Hashmap 생성
		HashMap<String, Object> result = new HashMap<String, Object>();
		
	// 2. 쿼리
		ArrayList<ReserveDTO> reserveDTO = mypageDao.myReserveRefund(loginId, reserve_num);
		
	// 3. iterator로 순회하면서 hashmap에 담기
		// 3-1. 변수 초기화
		Iterator<ReserveDTO> iter = reserveDTO.iterator();					// iterator
		ReserveDTO reserveIter = null;										// iterator에서 사용할 한줄 받을 DTO 
		ArrayList<ReserveDTO> reserveRoom = new ArrayList<ReserveDTO>();	// 객실별로 잘라서 담을 ArrayList( Hashmap의 values )
		String mapKey = "first";											// hashmap의 키 값
		int cnt = 0;														// while문 마지막 루프 확인할 변수
		int size = reserveDTO.size() - 1;										// 현재 쿼리문의 rows 수
		
		// 3-2. 예약순번을 가지고 있는 Int 변수 초기화
		int reserveIdx = 0;
		
		// 3-3. 순회하기		
		while(iter.hasNext()) {
			reserveIter = iter.next();
			// 3-4. 초회차는 무조건 한 개 추가
			if(reserveIdx == 0) {
				reserveRoom.add(reserveIter);
			}else {
			
				// 3-6. 현재 iterator의 예약 순번이 이전 순회의 예약순번과 같다면
				if(reserveIdx == reserveIter.getReserve_idx()) {
					// 3-7. 같은 객실정보이기 때문에 ArrayList에 추가
					reserveRoom.add(reserveIter);
				// 3-8. 예약순번이 달라졌다면
				}else if(reserveIdx != reserveIter.getReserve_idx()){
					// 3-9. 다른 객실정보이기 때문에 현재까지의 값을 hashmap에 저장
					result.put(mapKey, reserveRoom);
					// 3-10. hashmap의 키 값 바꿔주기( first -> second, second -> third )
					if(mapKey.equals("first")) {
						mapKey = "second";
					}else if(mapKey.equals("second")) {
						mapKey = "third";
					}
					// 3-11. 객실정보 초기화시키기
					reserveRoom = new ArrayList<ReserveDTO>();
					
					// 3-12. 현재 rows ArrayList에 담기
					reserveRoom.add(reserveIter);
				}
			}
			// 3-5. Int 변수에 현재 예약순번 저장( 다음 회차때 비교할 값 )
			reserveIdx = reserveIter.getReserve_idx();
			
			// 3-13. while의 마지막 루프땐 무조건 put
			if(cnt == size) {
				result.put(mapKey, reserveRoom);
			}
			cnt += 1;
		}
		
		return result;
	}
// 20220319 환불 신청 페이지 END - SI

// 20220320 구매한 마일리지 상품 확인 페이지 START - SI
	public ArrayList<ProductDTO> myReserveProduct(String reserve_num) {
		ArrayList<ProductDTO> result = mypageDao.myReserveProduct(reserve_num);
		
		return result;
	}

// 20220320 구매한 마일리지 상품 확인 페이지 END - SI

	
}















