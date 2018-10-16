package com.kh.hello.company.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Reservations implements java.io.Serializable{
//	oid시퀀스, startdate, enddate, 인원, 객실수, rid(객실명) 업체주소
	private String people;
	private String roomcount;
	private int rid;
	private String price;
	private String rType;
	private String start;
	private String end;
	private String cName;
	private String cAddress;
	
	public Reservations(){}

	public Reservations(String people, String roomcount, int rid, String price, String rType, String start, String end, String cName, String cAddress) {
		super();
		this.people = people;
		this.roomcount = roomcount;
		this.rid = rid;
		this.price = price;
		this.rType = rType;
		this.start = start;
		this.end = end;
		this.cName = cName;
		this.cAddress = cAddress;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getRoomcount() {
		return roomcount;
	}

	public void setRoomcount(String roomcount) {
		this.roomcount = roomcount;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	@Override
	public String toString() {
		return "Reservations [people=" + people + ", roomcount=" + roomcount + ", rid=" + rid + ", price=" + price
				+ ", rType=" + rType + ", start=" + start + ", end=" + end + ", cName=" + cName + ", cAddress="
				+ cAddress + "]";
	}


	
	
	

}
