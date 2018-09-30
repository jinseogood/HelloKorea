package com.kh.hello.seller.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Attachment implements java.io.Serializable{
	private int fId;
	private String filePath;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private String level;
	private int refNum;
	private String status;
	
	public Attachment(){}

	public Attachment(int fId, String filePath, String originName, String changeName, Date uploadDate, String level,
			int refNum, String status) {
		super();
		this.fId = fId;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.level = level;
		this.refNum = refNum;
		this.status = status;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getRefNum() {
		return refNum;
	}

	public void setRefNum(int refNum) {
		this.refNum = refNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fId=" + fId + ", filePath=" + filePath + ", originName=" + originName + ", changeName="
				+ changeName + ", uploadDate=" + uploadDate + ", level=" + level + ", refNum=" + refNum + ", status="
				+ status + "]";
	}
	
	
}
