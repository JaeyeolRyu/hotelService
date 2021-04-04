package com.sprHotelMbts.projectT3.hotel;

public class HotelDTO {

	private String hotelNo;
	private String hotelNm;
	private String hotelAddress;
	private String hotelTel;
	private String hotelExplain;
	private String hotelHomepage;
	private String hotelPhoto;
	
	public String getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}
	public String getHotelNm() {
		return hotelNm;
	}
	public void setHotelNm(String hotelNm) {
		this.hotelNm = hotelNm;
	}
	public String getHotelAddress() {
		return hotelAddress;
	}
	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}
	public String getHotelTel() {
		return hotelTel;
	}
	public void setHotelTel(String hotelTel) {
		this.hotelTel = hotelTel;
	}
	public String getHotelExplain() {
		return hotelExplain;
	}
	public void setHotelExplain(String hotelExplain) {
		this.hotelExplain = hotelExplain;
	}
	public String getHotelHomepage() {
		return hotelHomepage;
	}
	public void setHotelHomepage(String hotelHomepage) {
		this.hotelHomepage = hotelHomepage;
	}
	public String getHotelPhoto() {
		return hotelPhoto;
	}
	public void setHotelPhoto(String hotelPhoto) {
		this.hotelPhoto = hotelPhoto;
	}
	
	@Override
	public String toString() {
		return "HotelDTO [hotelNo=" + hotelNo + ", hotelNm=" + hotelNm + ", hotelAddress=" + hotelAddress
				+ ", hotelTel=" + hotelTel + ", hotelExplain=" + hotelExplain + ", hotelHomepage=" + hotelHomepage
				+ ", hotelPhoto=" + hotelPhoto + "]";
	}
	
}
