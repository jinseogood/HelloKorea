package com.kh.hello.admin.model.vo;

import java.sql.Date;

public class DatePick implements java.io.Serializable{
	private Date startDate;
	private Date endDate;
	
	public DatePick(){}

	public DatePick(Date startDate, Date endDate) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "DatePick [startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	

}
