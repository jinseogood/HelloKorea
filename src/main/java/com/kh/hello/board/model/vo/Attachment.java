package com.kh.hello.board.model.vo;

import java.sql.Date;

public class Attachment {
	private int fid;
	private String origin_name;
	private String file_path;
	private Date upload_date;
	private String change_name;
	private String status;
	private int a_level;
	private int bid;
	
	public Attachment(){}

	public Attachment(int fid, String origin_name, String file_path, Date upload_date, String change_name,
			String status, int a_level, int bid) {
		super();
		this.fid = fid;
		this.origin_name = origin_name;
		this.file_path = file_path;
		this.upload_date = upload_date;
		this.change_name = change_name;
		this.status = status;
		this.a_level = a_level;
		this.bid = bid;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getA_level() {
		return a_level;
	}

	public void setA_level(int a_level) {
		this.a_level = a_level;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	@Override
	public String toString() {
		return "Attachment [fid=" + fid + ", origin_name=" + origin_name + ", file_path=" + file_path + ", upload_date="
				+ upload_date + ", change_name=" + change_name + ", status=" + status + ", a_level=" + a_level
				+ ", bid=" + bid + "]";
	}
	
}
