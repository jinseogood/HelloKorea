package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Room implements java.io.Serializable{
	private int rId;
	private String roomType1;
	private int roomCount1;
	private String roomPrice1;
	private int roomPeople1;
	private String roomType2;
	private int roomCount2;
	private String roomPrice2;
	private int roomPeople2;
	private String roomType3;
	private int roomCount3;
	private String roomPrice3;
	private int roomPeople3;
	private int cId;
	
	public Room(){}

	public Room(int rId, String roomType1, int roomCount1, String roomPrice1, int roomPeople1, String roomType2,
			int roomCount2, String roomPrice2, int roomPeople2, String roomType3, int roomCount3, String roomPrice3,
			int roomPeople3, int cId) {
		super();
		this.rId = rId;
		this.roomType1 = roomType1;
		this.roomCount1 = roomCount1;
		this.roomPrice1 = roomPrice1;
		this.roomPeople1 = roomPeople1;
		this.roomType2 = roomType2;
		this.roomCount2 = roomCount2;
		this.roomPrice2 = roomPrice2;
		this.roomPeople2 = roomPeople2;
		this.roomType3 = roomType3;
		this.roomCount3 = roomCount3;
		this.roomPrice3 = roomPrice3;
		this.roomPeople3 = roomPeople3;
		this.cId = cId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getRoomType1() {
		return roomType1;
	}

	public void setRoomType1(String roomType1) {
		this.roomType1 = roomType1;
	}

	public int getRoomCount1() {
		return roomCount1;
	}

	public void setRoomCount1(int roomCount1) {
		this.roomCount1 = roomCount1;
	}

	public String getRoomPrice1() {
		return roomPrice1;
	}

	public void setRoomPrice1(String roomPrice1) {
		this.roomPrice1 = roomPrice1;
	}

	public int getRoomPeople1() {
		return roomPeople1;
	}

	public void setRoomPeople1(int roomPeople1) {
		this.roomPeople1 = roomPeople1;
	}

	public String getRoomType2() {
		return roomType2;
	}

	public void setRoomType2(String roomType2) {
		this.roomType2 = roomType2;
	}

	public int getRoomCount2() {
		return roomCount2;
	}

	public void setRoomCount2(int roomCount2) {
		this.roomCount2 = roomCount2;
	}

	public String getRoomPrice2() {
		return roomPrice2;
	}

	public void setRoomPrice2(String roomPrice2) {
		this.roomPrice2 = roomPrice2;
	}

	public int getRoomPeople2() {
		return roomPeople2;
	}

	public void setRoomPeople2(int roomPeople2) {
		this.roomPeople2 = roomPeople2;
	}

	public String getRoomType3() {
		return roomType3;
	}

	public void setRoomType3(String roomType3) {
		this.roomType3 = roomType3;
	}

	public int getRoomCount3() {
		return roomCount3;
	}

	public void setRoomCount3(int roomCount3) {
		this.roomCount3 = roomCount3;
	}

	public String getRoomPrice3() {
		return roomPrice3;
	}

	public void setRoomPrice3(String roomPrice3) {
		this.roomPrice3 = roomPrice3;
	}

	public int getRoomPeople3() {
		return roomPeople3;
	}

	public void setRoomPeople3(int roomPeople3) {
		this.roomPeople3 = roomPeople3;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	@Override
	public String toString() {
		return "Room [rId=" + rId + ", roomType1=" + roomType1 + ", roomCount1=" + roomCount1 + ", roomPrice1="
				+ roomPrice1 + ", roomPeople1=" + roomPeople1 + ", roomType2=" + roomType2 + ", roomCount2="
				+ roomCount2 + ", roomPrice2=" + roomPrice2 + ", roomPeople2=" + roomPeople2 + ", roomType3="
				+ roomType3 + ", roomCount3=" + roomCount3 + ", roomPrice3=" + roomPrice3 + ", roomPeople3="
				+ roomPeople3 + ", cId=" + cId + "]";
	}

	
}
