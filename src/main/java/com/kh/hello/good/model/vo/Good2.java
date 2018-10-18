package com.kh.hello.good.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Good2 implements java.io.Serializable{
	
	private int lid;			//찜번호
	private String lType;		//구분
	private int originId;		//고유아이디
	private Date endDate;		//종료일
	private int mid;			//회원아이디
	
	public Good2(){}

	public Good2(int lid, String lType, int originId, Date endDate, int mid) {
		super();
		this.lid = lid;
		this.lType = lType;
		this.originId = originId;
		this.endDate = endDate;
		this.mid = mid;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getlType() {
		return lType;
	}

	public void setlType(String lType) {
		this.lType = lType;
	}

	public int getOriginId() {
		return originId;
	}

	public void setOriginId(int originId) {
		this.originId = originId;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	@Override
	public String toString() {
		return "Good2 [lid=" + lid + ", lType=" + lType + ", originId=" + originId + ", endDate=" + endDate + ", mid="
				+ mid + "]";
	}
	
	

}
