package com.kh.hello.seller.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class CompanySaleStat implements java.io.Serializable{
	private String month;
	private int price;
	
	public CompanySaleStat(){}

	public CompanySaleStat(String month, int price) {
		super();
		this.month = month;
		this.price = price;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CompanySaleStat [month=" + month + ", price=" + price + "]";
	}
	
	
}
