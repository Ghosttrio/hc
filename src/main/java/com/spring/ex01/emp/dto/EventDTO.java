package com.spring.ex01.emp.dto;

import java.sql.Date;

public class EventDTO {
	
	public EventDTO() {
		System.out.println("EventDTO 생성자 실행");
	}
	
	public EventDTO(String id, String title, String firstimage, String firstimagead , String secondimage, String eventday ) {
		this.id=id;
		this.title=title;
		this.firstimage=firstimage;
		this.firstimagead=firstimagead;
		this.secondimage=secondimage;
		this.eventday=eventday;
	}
	
	public EventDTO(int level, int articleNO, int parentNO, String replyTitle , String content, String replyId, Date writeDate ) {
		this.level = level;
		this.articleNO = articleNO;
		this.parentNO = parentNO;
		this.replyTitle = replyTitle;
		this.content = content;
		this.replyId = replyId;
		this.writeDate = writeDate;
	}
	
	public EventDTO(String id, String title, String firstimage, String secondimage, String eventday ) {
		this.id=id;
		this.title=title;
		this.firstimage=firstimage;
		this.secondimage=secondimage;
		this.eventday=eventday;
	}
	
	
	private int level;
	private	 int articleNO;
	private int parentNO;
	private String replyTitle;
	private String content;
	private String replyId;
	private Date writeDate;
	
	
	private String id;
	private String title;
	private String firstimage;
	private String firstimagead;
	private String secondimage;
	private String eventday;
	
	
	
	public String getReplyTitle() {
		return replyTitle;
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public int getLevel() {
		return level;
	}

	public int getArticleNO() {
		return articleNO;
	}

	public int getParentNO() {
		return parentNO;
	}

	

	public String getContent() {
		return content;
	}

	

	public Date getWriteDate() {
		return writeDate;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}

	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
	}

	

	public void setContent(String content) {
		this.content = content;
	}

	

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getFirstimagead() {
		return firstimagead;
	}

	public void setFirstimagead(String firstimagead) {
		this.firstimagead = firstimagead;
	}

	public String getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}

	public String getEventday() {
		return eventday;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public void setEventday(String eventday) {
		this.eventday = eventday;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public String getSecondimage() {
		return secondimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public void setSecondimage(String secondimage) {
		this.secondimage = secondimage;
	}
	
	
}
