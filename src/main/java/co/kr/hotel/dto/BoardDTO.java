package co.kr.hotel.dto;

import java.sql.Date;

public class BoardDTO {

	private int board_num;
	private String mem_id;
	private String board_orinum;
	private String re_num;
	private int board_type;
	private String board_title;
	private String board_content;
	private Date reg_datetime;
	
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
	public String getBoard_orinum() {
		return board_orinum;
	}
	public void setBoard_orinum(String board_orinum) {
		this.board_orinum = board_orinum;
	}
	public String getRe_num() {
		return re_num;
	}
	public void setRe_num(String re_num) {
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
	public Date getReg_datetime() {
		return reg_datetime;
	}
	public void setReg_datetime(Date reg_datetime) {
		this.reg_datetime = reg_datetime;
	}
	

	
	
	
	
	

}
