package com.kh.hello.member.model.vo;

import java.sql.Date;

public class MemberReservation {
	private int oId;
	private String rSdate;
	private String rEdate;
	private int people;
	private int oRcount;
	
	
	public MemberReservation(){}


	public int getoId() {
		return oId;
	}


	public String getrSdate() {
		return rSdate;
	}


	public String getrEdate() {
		return rEdate;
	}


	public int getPeople() {
		return people;
	}


	public int getoRcount() {
		return oRcount;
	}


	public void setoId(int oId) {
		this.oId = oId;
	}


	public void setrSdate(String rSdate) {
		this.rSdate = rSdate;
	}


	public void setrEdate(String rEdate) {
		this.rEdate = rEdate;
	}


	public void setPeople(int people) {
		this.people = people;
	}


	public void setoRcount(int oRcount) {
		this.oRcount = oRcount;
	}


	@Override
	public String toString() {
		return "MemberReservation [oId=" + oId + ", rSdate=" + rSdate + ", rEdate=" + rEdate + ", people=" + people
				+ ", oRcount=" + oRcount + "]";
	}


	
	
	
	
	
}
