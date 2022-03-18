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

import co.kr.hotel.dao.ManagerDAO;
import co.kr.hotel.dto.MileagePhotoDTO;
import co.kr.hotel.dto.ProductDTO;


@Service
public class ManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	   
	   @Autowired ManagerDAO dao;
	   
		public ArrayList<HashMap<String, String>> adOrderList() {
			return dao.adOrderList();
		}

		public String writing(MultipartFile[] photos, HashMap<String, String> params) {		
			String page = "adminOrderList";				
			//우리는 방금 insert 한 글의 idx 번호를 알아내야 한다.
			// -- 성공하면 특정 상세보기로 넘어갈때 글 번호가 필요해서
			// -- 파일을 업로드 한 경우 photo 테이블에 글번호를 넣어야 하기 때문에
			
			// 방금 넣은 데이터에 대한 idx를 알고 싶다면 몇가지 조건이 있다.
			//조건1. 파라메터는 DTO 형태로 넣을것		
			ProductDTO dto = new ProductDTO();
			dto.setProduct_num(params.get("product_num"));
			dto.setProduct_name(params.get("product_name"));
			dto.setProduct_price(params.get("product_price"));			
			dao.writing(dto);
			
			//그렇게 실행하고 나면 dto 에 방금 넣은 게시글에 대한 idx 가 담겨져 나온다.
			//String product_num = '';
			
			String product_num = dto.getProduct_num();		
			logger.info("product_num : "+product_num);
			if(product_num != "NULL"){
			//    page = "redirect:/detail?product_num="+product_num;
				saveFile(product_num,photos);// 파일 저장 처리			
			}
					
			return page;
		}
			
		private void saveFile(String product_num, MultipartFile[] photos) {		
			for (MultipartFile photo : photos) {			
				
				try {
					String oriFileName = photo.getOriginalFilename();//원본파일명 추출
					int index = oriFileName.lastIndexOf(".");//뒤에서 부터 . 을 찾아 해당 인덱스 번호를 반환
					logger.info("index : {}",index);
					
					//방어코드 : 예외 발생이 예상되는 지점을 피해가도록 처리
					if(index >0) {
						String ext = oriFileName.substring(index);//확장자(보여주기 시작할 인덱스)
						String newFileName = System.currentTimeMillis()+ext;//새로운 파일명 생성(중복을 피하기 위해서)
						logger.info(oriFileName+" => "+newFileName);			
						//파일 저장(photo 로부터 byte 를 뽑아내 경로를 지정하여 넣는다.)
						byte[] bytes = photo.getBytes();
						Path path = Paths.get("C:/upload/"+newFileName);
						Files.write(path, bytes);
						//Files.writing(path, bytes);
						logger.info(oriFileName+" SAVE OK!!");
						dao.fileWriting(index,oriFileName,newFileName);//DB 에 저장한 파일명을 기록					
					}
					
					
					Thread.sleep(1);
				} catch (Exception e) {
					System.out.println(e.toString());
					e.printStackTrace();
				}					
			}
			
		}

		public ArrayList<MileagePhotoDTO> photoList(String product_num) {		
			return dao.photoList(product_num);
		}	

		public HashMap<String, Object> profileUpdate(HashMap<String, String> userupdate) {
			logger.info("파라메터가 서비스에 도착함? {}",userupdate);
			int row = dao.writing(userupdate);	
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("success", row);
			logger.info("성공했니? {}",row);
			
			return map;
		}		
		
		
}