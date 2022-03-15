package co.kr.hotel.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hotel.dao.ReserveDAO;
import co.kr.hotel.dto.RoomDTO;

@Service
public class ReserveService {

	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReserveDAO reserveDao;
	//객실 예약 리스트 START 유선화 20220311
	public ArrayList<RoomDTO> toReservelist(String checkin_date, String checkout_date, int cnt) {
		// TODO Auto
		
		return reserveDao.toReservelist(checkin_date,checkout_date,cnt);
	}
	//객실 예약 리스트 END 유선화 20220311
}
