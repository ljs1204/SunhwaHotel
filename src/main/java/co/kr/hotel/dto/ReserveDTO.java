package co.kr.hotel.dto;

import java.sql.Date;

public class ReserveDTO {

	// 유선화 메인페이지 예약하기 START 20220310
	
	private String checkindate;
	private String checkoutdate;
	private int adult_cnt;
	
	//유선화 마이페이지 START 20220314
	
	private int reserve_idx;
	private String mem_id;
	private String reserve_num;
	private String room_num;
	private Date reserve_date;
	private String reserve_state;
	
	// 김승일 예약조회 START 20220315
	private int reserve_amount;
	private int reserve_room_cnt;
	// 김승일 예약조회 END 20220315
	
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
	
	// 김승일 예약조회 START 20220315
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
	// 김승일 예약조회 END 20220315	
	
	
	
	private int child_cnt;
	private int infant_cnt;
	private int extrabed_cnt;
	private int breakfast_cnt;
	private String add_requests;
	
	
	
	
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
	
}
