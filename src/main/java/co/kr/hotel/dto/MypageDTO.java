package co.kr.hotel.dto;

import java.util.Date;

public class MypageDTO {

	private int board_num;
	private String mem_id;
	private int board_orinum;
	private int re_num;
	private int board_type;
	private String board_title;
	private String board_content;
	private String reg_datetime;
	
	
	//마이페이지 마일리지 조회 유선화 2022.03.15 START 
	private int mileage_useable;
	private int mileage_price;
	private Date mileage_date;

	
	// 유선화 마이페이지 환불상세 START 20220316

	private String checkindate;
	private String checkoutdate;
	private int adult_cnt;
	
	
	
	public int getMileage_useable() {
		return mileage_useable;
	}
	public void setMileage_useable(int mileage_useable) {
		this.mileage_useable = mileage_useable;
	}
	
	
	private int reserve_idx;
	
	private String reserve_num;
	private String room_num;
	private Date reserve_date;
	private String reserve_state;
	
	
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
	public int getReserve_idx() {
		return reserve_idx;
	}
	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
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
	private int reserve_amount;
	private int reserve_room_cnt;
	private String room_type_name;
	
	// 유선화 마이페이지 환불상세 END 20220316
	
	
	private int mileage_idx;
	
	public int getMileage_idx() {
		return mileage_idx;
	}
	public void setMileage_idx(int mileage_idx) {
		this.mileage_idx = mileage_idx;
	}
	public int getMileage_price() {
		return mileage_price;
	}
	public void setMileage_price(int mileage_price) {
		this.mileage_price = mileage_price;
	}
	public Date getMileage_date() {
		return mileage_date;
	}
	public void setMileage_date(Date mileage_date) {
		this.mileage_date = mileage_date;
	}

	
	
	
	//마이페이지 마일리지 조회 유선화 2022.03.15 START 
	
	
	
	
	
	
	
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getBoard_orinum() {
		return board_orinum;
	}
	public void setBoard_orinum(int board_orinum) {
		this.board_orinum = board_orinum;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getReg_datetime() {
		return reg_datetime;
	}
	public void setReg_datetime(String reg_datetime) {
		this.reg_datetime = reg_datetime;
	}
}
