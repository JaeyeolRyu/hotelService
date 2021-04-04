package com.sprHotelMbts.projectT3.hotelOptn;

public class HotelOptnDTO {

	private String hotelNo;
	private String hotelOptnNo;
	public String getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}
	public String getHotelOptnNo() {
		return hotelOptnNo;
	}
	public void setHotelOptnNo(String hotelOptnNo) {
		this.hotelOptnNo = hotelOptnNo;
	}
	
	@Override
	public String toString() {
		return "HotelOptnDTO [hotelNo=" + hotelNo + ", hotelOptnNo=" + hotelOptnNo + "]";
	}

}
