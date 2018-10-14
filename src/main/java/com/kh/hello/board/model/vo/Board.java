package com.kh.hello.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Board implements java.io.Serializable{
	private int bid;
	private String title;
	private String text;
	private int board_type;
	private String regist_date;
	private String status;
	private String modify_date;
	private float grade;
	private int likey;
	private int m_id;
	private int origin_id;
	private String travel_date;
	
	public Board(){}

	public Board(int bid, String title, String text, int board_type, String regist_date, String status,
			String modify_date, float grade, int likey, int m_id, int origin_id, String travel_date) {
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
		this.origin_id = origin_id;
		this.travel_date = travel_date;
	}



	public Board(int bid, String title, String text, int board_type, String regist_date, String status, String modify_date,
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

	public String getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
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
				+ grade + ", likey=" + likey + ", m_id=" + m_id + ", origin_id=" + origin_id + ", travel_date="
				+ travel_date + "]";
	}

	public int getOrigin_id() {
		return origin_id;
	}

	public void setOrigin_id(int origin_id) {
		this.origin_id = origin_id;
	}

	public Board(int bid, String title, String text, int board_type, String regist_date, String status,
			String modify_date, float grade, int likey, int m_id, int origin_id) {
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
		this.origin_id = origin_id;
	}

	public String getTravel_date() {
		return travel_date;
	}

	public void setTravel_date(String travel_date) {
		this.travel_date = travel_date;
	}

	
	
}
