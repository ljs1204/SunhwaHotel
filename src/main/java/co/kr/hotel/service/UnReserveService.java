package co.kr.hotel.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.UnReserveDAO;
import co.kr.hotel.dto.ReserveDTO;

@Service
public class UnReserveService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UnReserveDAO unreserveDao;
	
	public ReserveDTO beMyReserve(String reserve_num, String non_name_en, String non_email) {
	
		ReserveDTO  reserveDTO = unreserveDao.beMyReserve(reserve_num, non_name_en, non_email);
		logger.info("여기 서비스야 잘왔니? : {}",reserveDTO); 
		
		return reserveDTO;	
	}

	public ArrayList<ReserveDTO> unBeMyReserve(String reserve_num, String non_name_en, String non_email) {
		ArrayList<ReserveDTO> reserveDTO = unreserveDao.unBeMyReserve(reserve_num, non_name_en, non_email);
		logger.info("여기 서비스야 잘왔니? : {}",reserveDTO); 
		
		return reserveDTO;
	}

}
