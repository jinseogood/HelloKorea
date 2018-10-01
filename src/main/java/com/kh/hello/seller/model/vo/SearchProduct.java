package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class SearchProduct implements java.io.Serializable{
	//Company
	private int cId;
	private String companyName;
	private String companyPhone;
	private String companyAddress;
	private int mId;
		
	//Registration History
	private String term;
	private String status;
	
	public SearchProduct(){}

	public SearchProduct(int cId, String companyName, String companyPhone, String companyAddress, int mId, String term,
			String status) {
		super();
		this.cId = cId;
		this.companyName = companyName;
		this.companyPhone = companyPhone;
		this.companyAddress = companyAddress;
		this.mId = mId;
		this.term = term;
		this.status = status;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SearchProduct [cId=" + cId + ", companyName=" + companyName + ", companyPhone=" + companyPhone
				+ ", companyAddress=" + companyAddress + ", mId=" + mId + ", term=" + term + ", status=" + status + "]";
	}
	
}
