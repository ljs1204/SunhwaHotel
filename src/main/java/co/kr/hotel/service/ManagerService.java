package co.kr.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.ManagerDAO;

@Service
public class ManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	   
	   @Autowired ManagerDAO dao;
	   
		public ArrayList<HashMap<String, String>> adOrderList() {
			return dao.adOrderList();
		}
		public void writing(HashMap<String, String> params) {
			//hashmap 자체를 XML 로 넘긴다.
			int row = dao.writing(params);
			logger.info(" 입력된 건수 : {}",row);		
		}
		
}
