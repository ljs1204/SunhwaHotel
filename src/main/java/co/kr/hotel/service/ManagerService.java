package co.kr.hotel.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hotel.dao.ManagerDAO;
import co.kr.hotel.dto.MileagePhotoDTO;
import co.kr.hotel.dto.ProductDTO;


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
	}
		
