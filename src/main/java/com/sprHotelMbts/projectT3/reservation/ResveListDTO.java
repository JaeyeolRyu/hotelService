package com.sprHotelMbts.projectT3.reservation;

public class ResveListDTO {
private String resveNo;
private String checkIn;
private String checkOut;
private String hotelNm;
private String resvePc;
private String payDate;
private String payNm;
private String cancelAt;
private String hotelNo;
public String getHotelNo() {
	return hotelNo;
}
public void setHotelNo(String hotelNo) {
	this.hotelNo = hotelNo;
}
public String getResveNo() {
	return resveNo;
}
public void setResveNo(String resveNo) {
	this.resveNo = resveNo;
}
public String getCheckIn() {
	return checkIn;
}
public void setCheckIn(String checkIn) {
	this.checkIn = checkIn;
}
public String getCheckOut() {
	return checkOut;
}
public void setChaeckOut(String checkOut) {
	this.checkOut = checkOut;
}
public String getHotelNm() {
	return hotelNm;
}
public void setHotelNm(String hotelNm) {
	this.hotelNm = hotelNm;
}
public String getResvePc() {
	return resvePc;
}
public void setResvePc(String resvePc) {
	this.resvePc = resvePc;
}
public String getPayDate() {
	return payDate;
}
public void setPayDate(String payDate) {
	this.payDate = payDate;
}
public String getPayNm() {
	return payNm;
}
public void setPayNm(String payNm) {
	this.payNm = payNm;
}
public String getCancelAt() {
	return cancelAt;
}
public void setCancelAt(String cancelAt) {
	this.cancelAt = cancelAt;
}

@Override
public String toString() {
	return "ResveListDTO [resveNo=" + resveNo + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", hotelNm="
			+ hotelNm + ", resvePc=" + resvePc + ", payDate=" + payDate + ", payNm=" + payNm + ", cancelAt=" + cancelAt
			+ "]";
}



}
