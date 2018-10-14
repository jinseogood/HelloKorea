package com.kh.hello.company.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@Repository
public class Reservation2 implements Serializable{
	
	private int oid;				//주문아이디
	private String rSdate;			//예약시작일
	private String rEdate;			//예약종료일
	private int people;				//인원
	private int oRcount;			//객실수
	private int rid;				//객실아이디
	private int paId;				//결제아이디
	
	public Reservation2(){}

	public Reservation2(int oid, String rSdate, String rEdate, int people, int oRcount, int rid, int paId) {
		super();
		this.oid = oid;
		this.rSdate = rSdate;
		this.rEdate = rEdate;
		this.people = people;
		this.oRcount = oRcount;
		this.rid = rid;
		this.paId = paId;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getrSdate() {
		return rSdate;
	}

	public void setrSdate(String rSdate) {
		this.rSdate = rSdate;
	}

	public String getrEdate() {
		return rEdate;
	}

	public void setrEdate(String rEdate) {
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

	@Override
	public String toString() {
		return "Reservation [oid=" + oid + ", rSdate=" + rSdate + ", rEdate=" + rEdate + ", people=" + people
				+ ", oRcount=" + oRcount + ", rid=" + rid + ", paId=" + paId + "]";
	}
	
	

}



