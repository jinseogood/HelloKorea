package com.kh.hello.company.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Reservation2 implements Serializable{
	
	private int oid;				//주문아이디
	private Date rSdate;			//예약시작일
	private Date rEdate;			//예약종료일
	private int people;				//인원
	private int oRcount;			//객실수
	private int rid;				//객실아이디
	private int paId;				//결제아이디
	private String roomName;		//객실이름
	private String cAddress;		//업체주소
	
	public Reservation2(){}

	public Reservation2(int oid, Date rSdate, Date rEdate, int people, int oRcount, int rid, int paId, String roomName, String cAddress) {
		super();
		this.oid = oid;
		this.rSdate = rSdate;
		this.rEdate = rEdate;
		this.people = people;
		this.oRcount = oRcount;
		this.rid = rid;
		this.paId = paId;
		this.roomName = roomName;
		this.cAddress = cAddress;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public Date getrSdate() {
		return rSdate;
	}

	public void setrSdate(Date rSdate) {
		this.rSdate = rSdate;
	}

	public Date getrEdate() {
		return rEdate;
	}

	public void setrEdate(Date rEdate) {
		this.rEdate = rEdate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getoRcount() {
		return oRcount;
	}

	public void setoRcount(int oRcount) {
		this.oRcount = oRcount;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getPaId() {
		return paId;
	}

	public void setPaId(int paId) {
		this.paId = paId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	@Override
	public String toString() {
		return "Reservation2 [oid=" + oid + ", rSdate=" + rSdate + ", rEdate=" + rEdate + ", people=" + people
				+ ", oRcount=" + oRcount + ", rid=" + rid + ", paId=" + paId + ", roomName=" + roomName + ", cAddress="
				+ cAddress + "]";
	}


	
	

}



