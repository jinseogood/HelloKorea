package com.kh.hello.admin.model.vo;

import java.sql.Date;

public class Question {
    private int qRecordId;
    private int sendId;
    private String title;
    private Date sendDate;
    private String content;
    private Date pDate;
    private String status;
    
    public Question(){}

	public Question(int qRecordId, int sendId, String title, Date sendDate, String content, Date pDate, String status) {
		super();
		this.qRecordId = qRecordId;
		this.sendId = sendId;
		this.title = title;
		this.sendDate = sendDate;
		this.content = content;
		this.pDate = pDate;
		this.status = status;
	}

	public int getqRecordId() {
		return qRecordId;
	}

	public void setqRecordId(int qRecordId) {
		this.qRecordId = qRecordId;
	}

	public int getSendId() {
		return sendId;
	}

	public void setSendId(int sendId) {
		this.sendId = sendId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Question [qRecordId=" + qRecordId + ", sendId=" + sendId + ", title=" + title + ", sendDate=" + sendDate
				+ ", content=" + content + ", pDate=" + pDate + ", status=" + status + "]";
	}
	
}