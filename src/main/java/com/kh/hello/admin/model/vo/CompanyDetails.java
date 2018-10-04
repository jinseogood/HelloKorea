package com.kh.hello.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class CompanyDetails implements java.io.Serializable{
	private int cId;
	private int crId;
	private String cName;
	private String cPhone;
	private String cAddress;
	private Date crDate;
	private Date apDate;
	private String crOpenTerm;
	private String rType;
	private int rCount;
	private String rPrice;
	private int rLimit;
	
	public CompanyDetails(){}

	public CompanyDetails(int cId, int crId, String cName, String cPhone, String cAddress, Date crDate, Date apDate,
			String crOpenTerm, String rType, int rCount, String rPrice, int rLimit) {
		super();
		this.cId = cId;
		this.crId = crId;
		this.cName = cName;
		this.cPhone = cPhone;
		this.cAddress = cAddress;
		this.crDate = crDate;
		this.apDate = apDate;
		this.crOpenTerm = crOpenTerm;
		this.rType = rType;
		this.rCount = rCount;
		this.rPrice = rPrice;
		this.rLimit = rLimit;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getCrId() {
		return crId;
	}

	public void setCrId(int crId) {
		this.crId = crId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public Date getCrDate() {
		return crDate;
	}

	public void setCrDate(Date crDate) {
		this.crDate = crDate;
	}

	public Date getApDate() {
		return apDate;
	}

	public void setApDate(Date apDate) {
		this.apDate = apDate;
	}

	public String getCrOpenTerm() {
		return crOpenTerm;
	}

	public void setCrOpenTerm(String crOpenTerm) {
		this.crOpenTerm = crOpenTerm;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public String getrPrice() {
		return rPrice;
	}

	public void setrPrice(String rPrice) {
		this.rPrice = rPrice;
	}

	public int getrLimit() {
		return rLimit;
	}

	public void setrLimit(int rLimit) {
		this.rLimit = rLimit;
	}

	@Override
	public String toString() {
		return "CompanyDetails [cId=" + cId + ", crId=" + crId + ", cName=" + cName + ", cPhone=" + cPhone
				+ ", cAddress=" + cAddress + ", crDate=" + crDate + ", apDate=" + apDate + ", crOpenTerm=" + crOpenTerm
				+ ", rType=" + rType + ", rCount=" + rCount + ", rPrice=" + rPrice + ", rLimit=" + rLimit + "]";
	}

	
	
}
