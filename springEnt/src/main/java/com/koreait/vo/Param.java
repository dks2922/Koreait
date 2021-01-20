package com.koreait.vo;

public class Param {
	private String subject;
	private int idx;
	private int startNo;
	private int endNo;
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	@Override
	public String toString() {
		return "Param [subject=" + subject + ", idx=" + idx + ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}
	
	
}
