package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Blacklist implements java.io.Serializable{
	
	private int bRecordId;
	private Date inDate;
	private int mId;
	private String reason;
	private int period;
	private String bType;
	private String bTypeText;
	
	public Blacklist(){}

	public Blacklist(int bRecordId, Date inDate, int mId, String reason, int period, String bType, String bTypeText) {
		super();
		this.bRecordId = bRecordId;
		this.inDate = inDate;
		this.mId = mId;
		this.reason = reason;
		this.period = period;
		this.bType = bType;
		this.bTypeText = bTypeText;
	}

	public int getbRecordId() {
		return bRecordId;
	}

	public void setbRecordId(int bRecordId) {
		this.bRecordId = bRecordId;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbTypeText() {
		return bTypeText;
	}

	public void setbTypeText(String bTypeText) {
		this.bTypeText = bTypeText;
	}

	@Override
	public String toString() {
		return "Blacklist [bRecordId=" + bRecordId + ", inDate=" + inDate + ", mId=" + mId + ", reason=" + reason
				+ ", period=" + period + ", bType=" + bType + ", bTypeText=" + bTypeText + "]";
	}


}
