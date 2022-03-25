package co.kr.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dao.ManagerDAO;
import co.kr.hotel.dao.MypageDAO;
import co.kr.hotel.dto.MemberDTO;
import co.kr.hotel.dto.MypageDTO;
import co.kr.hotel.dto.ProductDTO;
import co.kr.hotel.dto.ReserveDTO;


@Service
public class ManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	   
	   @Autowired ManagerDAO dao;
	   
		public ArrayList<ProductDTO> adOrderList() {
			return dao.adOrderList();
		}
		
		public void writing(HashMap<String, String> params) {
			int row = dao.writing(params);
			logger.info(" 입력된 건수 : {}",row);		
		}
		
		public int del(String product_num) {
			return dao.del(product_num);
		}
		
		public ProductDTO detailing(String product_num) {
			return dao.detailing(product_num);

		}

		public void updating(HashMap<String, String> params) {

			
		}

		public HashMap<String, Object> myReserveAdmin(String loginId, int num) {
			HashMap<String, Object> result = new HashMap<String, Object>();		
			
			// process1 => loginId의 예약리스트를 예약번호별로 group, 그 결과를 예약날짜, 
			//예약상태 순으로 내림차순한 결과
			// ==> 해당 사용자의 모든 예약의 상태를 볼 수 있음
			ArrayList<ReserveDTO> processAll = dao.myReserveAllAdmin(loginId);
			
			// process2 => loginId의 예약리스트 중 예약상태가 1인 정보를 가져옴( 처음 예약할 때 정보 )
			// ==> 초기 예약 때의 객실 수를 체크 가능
			ArrayList<ReserveDTO> processParts = dao.myReservePartsAdmin(loginId);
			
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

	// 20220323 멤버 정보 확인 SI
		public MemberDTO memInfo(String mem_id) {
			
			return dao.memInfo(mem_id);
		}
		
/*
		public ModelAndView memlist() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminmemsearch"); //adminmemsearch.jsp
			ArrayList<ManagerDAO> memlist = dao.memlist();		
			logger.info("리스트 갯수 : {}",memlist.size());
			mav.addObject("memlist", memlist);
			
			return mav;
		}
*/
		public ModelAndView search(MemberDTO parameter) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminmemsearchresult");
			ArrayList<ManagerDAO> search = dao.search(parameter);		
			logger.info("리스트 갯수 : {}",search.size());
			mav.addObject("memlist", search);
			return mav;
	
	}

		public ModelAndView adminmilesearch(MypageDTO parameter) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminmilesearch");
			ArrayList<MypageDAO> adminmilesearch = dao.adminmilesearch(parameter);		
			logger.info("리스트 갯수 : {}",adminmilesearch.size());
			mav.addObject("milelist",adminmilesearch) ;
			
			return mav;
		}

// 20220324 달력 데이터 - SI
		public ArrayList<ReserveDTO> reserveListGet() {
			
			
			return dao.reserveListGet();
		}
		
		public ArrayList<HashMap<String, String>> memlist_listCall(int currPage, int pagePerCnt) {
			int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-9, 2:10-19 이런식으로해야함
			logger.info("currpage : {}" , currPage);
			if(offset < 0) {
				offset = 0;
			}
			
			logger.info("offset : {}" , offset);
			ArrayList<HashMap<String, String>> listCall = dao.memlist_listCall(pagePerCnt,offset);
			logger.info("listcall 쿼리문 실행");
			
			return listCall;
		}
		public int memlist_rangecall(int currPage, int pagePerCnt) {
			int totalCount = dao.memlist_allCount(); // 일단 테이블 글이 몇개인지? 
			logger.info("totalCount : {}" , totalCount);
			
			int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수
			logger.info("range : {}" , range);

			return range;
		}

		public ArrayList<HashMap<String, String>> memlist() {

		     return dao.memlist();
		  }
	}
		





