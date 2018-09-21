package com.kh.hello.admin.model.vo;

import java.sql.Date;

public class Reservation {
	private int oId; //예약번호
	private String cName; //예약처
	private String paName; //예약자
	private Date rSDate; //예약 시작일
	private Date rEDate; //예약 종료일
	private Date pdDate; //예약일=결제일
	private String pdType; //결제 구분(구매, 환불)
	//예약 상태 결제 완료(pdType이 구매만 존재), 결제 취소(pdType 환불이 존재)
	public Reservation(){}
	
	public Reservation(int oId, String cName, String paName, Date rSDate, Date rEDate, Date pdDate, String pdType) {
		super();
		this.oId = oId;
		this.cName = cName;
		this.paName = paName;
		this.rSDate = rSDate;
		this.rEDate = rEDate;
		this.pdDate = pdDate;
		this.pdType = pdType;
	}

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getPaName() {
		return paName;
	}

	public void setPaName(String paName) {
		this.paName = paName;
	}

	public Date getrSDate() {
		return rSDate;
	}

	public void setrSDate(Date rSDate) {
		this.rSDate = rSDate;
	}

	public Date getrEDate() {
		return rEDate;
	}

	public void setrEDate(Date rEDate) {
		this.rEDate = rEDate;
	}

	public Date getPdDate() {
		return pdDate;
	}

	public void setPdDate(Date pdDate) {
		this.pdDate = pdDate;
	}

	public String getPdType() {
		return pdType;
	}

	public void setPdType(String pdType) {
		this.pdType = pdType;
	}

	@Override
	public String toString() {
		return "Reservation [oId=" + oId + ", cName=" + cName + ", paName=" + paName + ", rSDate=" + rSDate
				+ ", rEDate=" + rEDate + ", pdDate=" + pdDate + ", pdType=" + pdType + "]";
	}
	
	
}
