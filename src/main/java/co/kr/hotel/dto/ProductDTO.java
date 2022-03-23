package co.kr.hotel.dto;

public class ProductDTO {

	private String product_num;
	private String product_name;	
 	private String product_img;
	private int product_price;

// 20220318 예약 상세 컬럼추가 START - SI
	private int cnt_by_product;
	
	public int getCnt_by_product() {
		return cnt_by_product;
	}
	public void setCnt_by_product(int cnt_by_product) {
		this.cnt_by_product = cnt_by_product;
	}
// 20220318 예약 상세 컬럼추가 END - SI
	
	

	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	

		
	}	
