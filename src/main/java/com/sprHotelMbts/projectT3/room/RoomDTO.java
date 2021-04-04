package com.sprHotelMbts.projectT3.room;

public class RoomDTO {

	private String roomNo;
	private String hotelNo;
	private String roomNm;
	private int roomPc;
	private String rHeadCount;
	private String roomPhoto;
	private String roomSize;
	private String sCount; //예약 횟수
	
	public RoomDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}

	public String getRoomNm() {
		return roomNm;
	}

	public void setRoomNm(String roomNm) {
		this.roomNm = roomNm;
	}

	public int getRoomPc() {
		return roomPc;
	}

	public void setRoomPc(int roomPc) {
		this.roomPc = roomPc;
	}

	public String getrHeadCount() {
		return rHeadCount;
	}

	public void setrHeadCount(String rHeadCount) {
		this.rHeadCount = rHeadCount;
	}

	public String getRoomPhoto() {
		return roomPhoto;
	}

	public void setRoomPhoto(String roomPhoto) {
		this.roomPhoto = roomPhoto;
	}

	public String getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}

	public String getsCount() {
		return sCount;
	}

	public void setsCount(String sCount) {
		this.sCount = sCount;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomNo=" + roomNo + ", hotelNo=" + hotelNo + ", roomNm=" + roomNm + ", roomPc=" + roomPc
				+ ", rHeadCount=" + rHeadCount + ", roomPhoto=" + roomPhoto + ", roomSize=" + roomSize + ", sCount="
				+ sCount + "]";
	}

}
