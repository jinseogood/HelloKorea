package com.kh.hello.member.model.vo;

public class BoardAndReply implements java.io.Serializable {
	private int bId;
	private String title;
	private int boardType;
	private int likey;
	private int mId;
	//리플
	private int replyId;
	private String content;
	
	public BoardAndReply(){}

	public int getbId() {
		return bId;
	}

	public String getTitle() {
		return title;
	}

	public int getBoardType() {
		return boardType;
	}

	public int getLikey() {
		return likey;
	}

	public int getmId() {
		return mId;
	}

	public int getReplyId() {
		return replyId;
	}

	public String getContent() {
		return content;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public void setLikey(int likey) {
		this.likey = likey;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "BoardAndReply [bId=" + bId + ", title=" + title + ", boardType=" + boardType + ", likey=" + likey
				+ ", mId=" + mId + ", replyId=" + replyId + ", content=" + content + "]";
	}
	
	
	
}
