package com.sprHotelMbts.projectT3.hotPlace;

public class HotDTO {

	private String hotNo;
	private String hotNm;
	private String address;
	private String photo;
	
	
	public String getHotNo() {
		return hotNo;
	}
	public void setHotNo(String hotNo) {
		this.hotNo = hotNo;
	}
	public String getHotNm() {
		return hotNm;
	}
	public void setHotNm(String hotNm) {
		this.hotNm = hotNm;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "HotDTO [hotNo=" + hotNo + ", hotNm=" + hotNm + ", address=" + address + ", photo=" + photo + "]";
	}
	
	
	
	
}
