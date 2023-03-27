package com.spring.ex01.emp.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("noticeDTO")
public class NoticeDTO {
	
	private int noticeNo;
	private String d2;
	private String title;
	private Date writeDate;
	private String writer;
	private int cnt;
	private String content;
	/**
	 * @return the noticeNo
	 */
	public int getNoticeNo() {
		return noticeNo;
	}
	/**
	 * @param noticeNo the noticeNo to set
	 */
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	/**
	 * @return the d2
	 */
	public String getD2() {
		return d2;
	}
	/**
	 * @param d2 the d2 to set
	 */
	public void setD2(String d2) {
		this.d2 = d2;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the writeDate
	 */
	public Date getWriteDate() {
		return writeDate;
	}
	/**
	 * @param writeDate the writeDate to set
	 */
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	/**
	 * @return the writer
	 */
	public String getWriter() {
		return writer;
	}
	/**
	 * @param writer the writer to set
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}
	/**
	 * @return the cnt
	 */
	public int getCnt() {
		return cnt;
	}
	/**
	 * @param cnt the cnt to set
	 */
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
