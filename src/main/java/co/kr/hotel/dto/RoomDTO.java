package co.kr.hotel.dto;

public class RoomDTO {

	// 객실 상세정보 START 유선화 20220311 
	private String room_num;
	private int room_type;
	private int bed_type;
	private String room_size;
	private int room_price;
	private int room_capacity;
	private String room_type_name;
	private String room_img;
	
	// 예약 객실 리스트 START 유선화 20220311 
	private String checkindate;
	private String checkoutdate;
	private int adult_cnt;
	// 예약 객실 리스트 END 유선화 20220311
	
	// 객실 타입테이블 (메인객실상세) START 유선화 20220311
	private int roomType_type;
	private String roomType_name;
	private String roomType_price;
	private String roomType_size;
	private int roomType_capacity;
	
	
	// 객실 타입테이블 (메인객실상세) END 유선화 20220311
	
	
	
	public int getRoomType_capacity() {
		return roomType_capacity;
	}
	public void setRoomType_capacity(int roomType_capacity) {
		this.roomType_capacity = roomType_capacity;
	}
	public int getRoomType_type() {
		return roomType_type;
	}
	public void setRoomType_type(int roomType_type) {
		this.roomType_type = roomType_type;
	}
	public String getRoomType_name() {
		return roomType_name;
	}
	public void setRoomType_name(String roomType_name) {
		this.roomType_name = roomType_name;
	}
	public String getRoomType_price() {
		return roomType_price;
	}
	public void setRoomType_price(String roomType_price) {
		this.roomType_price = roomType_price;
	}
	public String getRoomType_size() {
		return roomType_size;
	}
	public void setRoomType_size(String roomType_size) {
		this.roomType_size = roomType_size;
	}
	private int photoflg;
	
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
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	public int getPhotoflg() {
		return photoflg;
	}
	public void setPhotoflg(int photoflg) {
		this.photoflg = photoflg;
	}
	public String getRoom_type_name() {
		return room_type_name;
	}
	public void setRoom_type_name(String room_type_name) {
		this.room_type_name = room_type_name;
	}
	public String getRoom_num() {
		return room_num;
	}
	public void setRoom_num(String room_num) {
		this.room_num = room_num;
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
	public String getRoom_size() {
		return room_size;
	}
	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public int getRoom_capacity() {
		return room_capacity;
	}
	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}
	
	// 객실 상세정보 END 유선화 20220311 
	
}
