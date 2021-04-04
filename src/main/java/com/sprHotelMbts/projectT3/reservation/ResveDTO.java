package com.sprHotelMbts.projectT3.reservation;

public class ResveDTO {

	private String resveNo;
	private String custNo;
	private String rumNo;
	private String payDay;
	private String payCode;
	private int resvePc;
	private String checkIn;
	private String checkOut;
	private char cancelAt;
	private String fUpdateDay;
	private String lUpdateDay;
	private String fUpdateId;
	private String lUpdateId;

	public String getResveNo() {
		return resveNo;
	}

	public void setResveNo(String resveNo) {
		this.resveNo = resveNo;
	}

	public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	public String getRumNo() {
		return rumNo;
	}

	public void setRumNo(String rumNo) {
		this.rumNo = rumNo;
	}

	public String getPayDay() {
		return payDay;
	}

	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}

	public String getPayCode() {
		return payCode;
	}

	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}

	public int getResvePc() {
		return resvePc;
	}

	public void setResvePc(int resvePc) {
		this.resvePc = resvePc;
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

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public char getCancelAt() {
		return cancelAt;
	}

	public void setCancelAt(char cancelAt) {
		this.cancelAt = cancelAt;
	}

	public String getfUpdateDay() {
		return fUpdateDay;
	}

	public void setfUpdateDay(String fUpdateDay) {
		this.fUpdateDay = fUpdateDay;
	}

	public String getlUpdateDay() {
		return lUpdateDay;
	}

	public void setlUpdateDay(String lUpdateDay) {
		this.lUpdateDay = lUpdateDay;
	}

	public String getfUpdateId() {
		return fUpdateId;
	}

	public void setfUpdateId(String fUpdateId) {
		this.fUpdateId = fUpdateId;
	}

	public String getlUpdateId() {
		return lUpdateId;
	}

	public void setlUpdateId(String lUpdateId) {
		this.lUpdateId = lUpdateId;
	}

	@Override
	public String toString() {
		return "ResveDTO [resveNo=" + resveNo + ", custNo=" + custNo + ", rumNo=" + rumNo + ", payDay=" + payDay
				+ ", payCode=" + payCode + ", resvePc=" + resvePc + ", checkIn=" + checkIn + ", checkOut=" + checkOut
				+ ", cancelAt=" + cancelAt + ", fUpdateDay=" + fUpdateDay + ", lUpdateDay=" + lUpdateDay
				+ ", fUpdateId=" + fUpdateId + ", lUpdateId=" + lUpdateId + "]";
	}

}
