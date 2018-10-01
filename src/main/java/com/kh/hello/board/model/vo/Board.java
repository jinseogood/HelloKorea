package com.kh.hello.board.model.vo;

import java.sql.Date;

public class Board {
	private int bid;
	private String title;
	private String text;
	private int board_type;
	private Date regist_date;
	private String status;
	private Date modify_date;
	private float grade;
	private int likey;
	private int m_id;
	
	public Board(){}

	public Board(int bid, String title, String text, int board_type, Date regist_date, String status, Date modify_date,
			float grade, int likey, int m_id) {
		super();
		this.bid = bid;
		this.title = title;
		this.text = text;
		this.board_type = board_type;
		this.regist_date = regist_date;
		this.status = status;
		this.modify_date = modify_date;
		this.grade = grade;
		this.likey = likey;
		this.m_id = m_id;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getBoard_type() {
		return board_type;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}

	public Date getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public float getGrade() {
		return grade;
	}

	public void setGrade(float grade) {
		this.grade = grade;
	}

	public int getLikey() {
		return likey;
	}

	public void setLikey(int likey) {
		this.likey = likey;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", title=" + title + ", text=" + text + ", board_type=" + board_type
				+ ", regist_date=" + regist_date + ", status=" + status + ", modify_date=" + modify_date + ", grade="
				+ grade + ", likey=" + likey + ", m_id=" + m_id + "]";
	}
	
}
