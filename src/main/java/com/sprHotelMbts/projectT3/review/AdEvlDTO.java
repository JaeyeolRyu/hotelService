package com.sprHotelMbts.projectT3.review;

public class AdEvlDTO {

	private String evlNo;
	private String hotelName;
	private String custName;
	private int   evlScore;
	private String evlContent;
	
	
	
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getEvlNo() {
		return evlNo;
	}
	public void setEvlNo(String evlNo) {
		this.evlNo = evlNo;
	}
	public int getEvlScore() {
		return evlScore;
	}
	public void setEvlScore(int evlScore) {
		this.evlScore = evlScore;
	}
	public String getEvlContent() {
		return evlContent;
	}
	public void setEvlContent(String evlContent) {
		this.evlContent = evlContent;
	}
	
	@Override
	public String toString() {
		return "AdEvlDTO [evlNo=" + evlNo + ", hotelName=" + hotelName + ", custName=" + custName + ", evlScore="
				+ evlScore + ", evlContent=" + evlContent + "]";
	}
	
	
	
}
