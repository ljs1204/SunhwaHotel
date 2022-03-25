package co.kr.hotel.dto;

import java.sql.Date;

public class ReserveDTO {
		
	// 유선화 메인페이지 예약하기 START 20220310
	private String checkindate;
	private String checkoutdate;
	private int adult_cnt;
	
	//유선화 예약객실 가져오기 START 20220314
	
	
	
	//유선화 마이페이지 START 20220314
	private int reserve_idx;
	private String mem_id;
	private String reserve_num;
	private String room_num;
	
	private Date reserve_date;
	private String reserve_state;
	
	private int pay_idx;
	private String pay_num;
	private String credit_num;
	private Date pay_date;
	private int pay_state;
	private int credit_validity;
	private String credit_type;
	private int pay_price;
	private int pay_mileage;
	private int amount;
	
	private int child_cnt;
	private int infant_cnt;
	private int extrabed_cnt;
	private int breakfast_cnt;
	private String add_requests;
	
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	public String getPay_num() {
		return pay_num;
	}
	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}
	public String getCredit_num() {
		return credit_num;
	}
	public void setCredit_num(String credit_num) {
		this.credit_num = credit_num;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_state() {
		return pay_state;
	}
	public void setPay_state(int pay_state) {
		this.pay_state = pay_state;
	}
	public int getCredit_validity() {
		return credit_validity;
	}
	public void setCredit_validity(int credit_validity) {
		this.credit_validity = credit_validity;
	}
	public String getCredit_type() {
		return credit_type;
	}
	public void setCredit_type(String credit_type) {
		this.credit_type = credit_type;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public int getPay_mileage() {
		return pay_mileage;
	}
	public void setPay_mileage(int pay_mileage) {
		this.pay_mileage = pay_mileage;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getReserve_idx() {
		return reserve_idx;
	}
	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getReserve_num() {
		return reserve_num;
	}
	public void setReserve_num(String reserve_num) {
		this.reserve_num = reserve_num;
	}
	public String getRoom_num() {
		return room_num;
	}
	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReserve_state() {
		return reserve_state;
	}
	public void setReserve_state(String reserve_state) {
		this.reserve_state = reserve_state;
	}
	public int getChild_cnt() {
		return child_cnt;
	}
	public void setChild_cnt(int child_cnt) {
		this.child_cnt = child_cnt;
	}
	public int getInfant_cnt() {
		return infant_cnt;
	}
	public void setInfant_cnt(int infant_cnt) {
		this.infant_cnt = infant_cnt;
	}
	public int getExtrabed_cnt() {
		return extrabed_cnt;
	}
	public void setExtrabed_cnt(int extrabed_cnt) {
		this.extrabed_cnt = extrabed_cnt;
	}
	public int getBreakfast_cnt() {
		return breakfast_cnt;
	}
	public void setBreakfast_cnt(int breakfast_cnt) {
		this.breakfast_cnt = breakfast_cnt;
	}
	public String getAdd_requests() {
		return add_requests;
	}
	public void setAdd_requests(String add_requests) {
		this.add_requests = add_requests;
	}
	//유선화 마이페이지 END 20220314
	
	public String getCheckindate() {
		return checkindate;
	}
	public void setCheckindate(String checkindate) {
		this.checkindate = checkindate;
	}
	public String getCheckoutdate() {
		return checkoutdate;
	}
	public void setCheckoutdate(String checkoutdate) {
		this.checkoutdate = checkoutdate;
	}
	public int getAdult_cnt() {
		return adult_cnt;
	}
	public void setAdult_cnt(int adult_cnt) {
		this.adult_cnt = adult_cnt;
	}
	// 유선화 메인페이지 예약하기 END 20220310
	
	// 김승일 예약리스트 START 20220315
	private int reserve_amount;
	private int reserve_room_cnt;
	private String room_type_name;
	// 김승일 예약리스트 END 20220315
	
	// 김승일 예약상세 START 20220318
	private String reserve_name;
	private String reserve_phone;
	private String reserve_email;
	//private String room_type_name;	// 리스트 할 때 썼던거 그대로
	//private int adult_cnt;			// 총합 => 원래 있던 컬럼으로 사용
	//private int breakfast_cnt;		// " 
	//private int pay_price;			// "
	//private int pay_mileage;			// "
	//private int reserve_amount;		// "
	private int room_type;
	//private String room_num;			// "
	private int bed_type;
	//private int pay_price;
	private String mem_name_en;
	private String mem_name_kr;
	// 김승일 예약상세 END 20220318
	
	// 김승일 환불신청 START 20220319
	private String product_num;
	private String product_name;
	private int product_cnt;
	// 김승일 환불신청 END 20220319
	
	// 관리자 예약조회 20220325
	private String product_img;
	private String product_price;
	
	
	// 김승일 예약리스트 START 20220315
	public int getReserve_amount() {
		return reserve_amount;
	}
	public void setReserve_amount(int reserve_amount) {
		this.reserve_amount = reserve_amount;
	}
	public int getReserve_room_cnt() {
		return reserve_room_cnt;
	}
	public void setReserve_room_cnt(int reserve_room_cnt) {
		this.reserve_room_cnt = reserve_room_cnt;
	}
	public String getRoom_type_name() {
		return room_type_name;
	}
	public void setRoom_type_name(String room_type_name) {
		this.room_type_name = room_type_name;
	}
	// 김승일 예약리스트 END 20220315	
	
	// 김승일 예약상세 START 20220318
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public String getReserve_phone() {
		return reserve_phone;
	}
	public void setReserve_phone(String reserve_phone) {
		this.reserve_phone = reserve_phone;
	}
	public String getReserve_email() {
		return reserve_email;
	}
	public void setReserve_email(String reserve_email) {
		this.reserve_email = reserve_email;
	}
	public int getRoom_type() {
		return room_type;
	}
	public void setRoom_type(int room_type) {
		this.room_type = room_type;
	}
	public int getBed_type() {
		return bed_type;
	}
	public void setBed_type(int bed_type) {
		this.bed_type = bed_type;
	}
	public String getMem_name_en() {
		return mem_name_en;
	}
	public void setMem_name_en(String mem_name_en) {
		this.mem_name_en = mem_name_en;
	}
	public String getMem_name_kr() {
		return mem_name_kr;
	}
	public void setMem_name_kr(String mem_name_kr) {
		this.mem_name_kr = mem_name_kr;
	}
	// 김승일 예약상세 END 20220318	

	// 김승일 환불신청 START 20220319
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
	public int getProduct_cnt() {
		return product_cnt;
	}
	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}
	// 김승일 환불신청 END 20220319
	
	// 백유나 예약 상세보기 
	private String non_mem_code;
//	private int reserve_idx;
	private String non_email;
	private String non_phone;
	private String non_name_en;
	private String non_name_kr;

	public String getNon_mem_code() {
		return non_mem_code;
	}
	public void setNon_mem_code(String non_mem_code) {
		this.non_mem_code = non_mem_code;
	}
	public String getNon_email() {
		return non_email;
	}
	public void setNon_email(String non_email) {
		this.non_email = non_email;
	}
	public String getNon_phone() {
		return non_phone;
	}
	public void setNon_phone(String non_phone) {
		this.non_phone = non_phone;
	}
	public String getNon_name_en() {
		return non_name_en;
	}
	public void setNon_name_en(String non_name_en) {
		this.non_name_en = non_name_en;
	}
	public String getNon_name_kr() {
		return non_name_kr;
	}
	public void setNon_name_kr(String non_name_kr) {
		this.non_name_kr = non_name_kr;
	}
	
	// 관리자 예약조회
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	
	
	
	
	
}
