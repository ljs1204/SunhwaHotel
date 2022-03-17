package co.kr.hotel.dto;

import java.sql.Date;

public class MemberDTO {

   private String mem_id;
   private String mem_grade; 
   private String mem_pw;
   private String mem_name_kr;
   private String mem_name_en;
   private Date mem_birth;
   private String mem_phone;
   private String mem_email;
   private String credit_num;
   private int credit_validity;
   private String credit_type;
   
   //마일리지 테이블
   private int mileage_idx;
   private int mileage_price;
   private Date mileage_date;
   private int mileage_useable;

   public String getMem_id() {
      return mem_id;
   }
   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }
   public String getMem_grade() {
      return mem_grade;
   }
   public void setMem_grade(String mem_grade) {
      this.mem_grade = mem_grade;
   }
   public String getMem_pw() {
      return mem_pw;
   }
   public void setMem_pw(String mem_pw) {
      this.mem_pw = mem_pw;
   }
   public String getMem_name_kr() {
      return mem_name_kr;
   }
   public void setMem_name_kr(String mem_name_kr) {
      this.mem_name_kr = mem_name_kr;
   }
   public String getMem_name_en() {
      return mem_name_en;
   }
   public void setMem_name_en(String mem_name_en) {
      this.mem_name_en = mem_name_en;
   }
   public Date getMem_birth() {
      return mem_birth;
   }
   public void setMem_birth(Date mem_birth) {
      this.mem_birth = mem_birth;
   }
   public String getMem_phone() {
      return mem_phone;
   }
   public void setMem_phone(String mem_phone) {
      this.mem_phone = mem_phone;
   }
   public String getMem_email() {
      return mem_email;
   }
   public void setMem_email(String mem_email) {
      this.mem_email = mem_email;
   }
   public String getCredit_num() {
      return credit_num;
   }
   public void setCredit_num(String credit_num) {
      this.credit_num = credit_num;
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
public int getMileage_useable() {
	return mileage_useable;
}
public void setMileage_useable(int mileage_useable) {
	this.mileage_useable = mileage_useable;
}
   
   
}
