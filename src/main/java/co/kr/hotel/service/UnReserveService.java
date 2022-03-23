package co.kr.hotel.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.UnReserveDAO;

@Service
public class UnReserveService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UnReserveDAO unreserveDao;
	
	public int beMyReserve(String reserve_num, String non_name_en, String non_email) {
		return unreserveDao.beMyReserve(reserve_num, non_name_en, non_email);
	}
	

}
