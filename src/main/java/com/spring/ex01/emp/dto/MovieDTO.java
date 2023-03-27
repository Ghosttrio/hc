package com.spring.ex01.emp.dto;

import org.springframework.stereotype.Component;

@Component("movieDTO")
public class MovieDTO {

//	movie ���̺�
	private int articleNO;
	private String title;
	private String title_en;
	private String age;
	private String opendate;
	private int like_num;
	private int rate;
	private String explain;
	private String director;
	private String genre;
	private String runningtime;
	private String actor;
	private String poster_back;
	private String poster_main;

//	comment_1 ���̺� -> review ���̺�� ��ȯ�ϱ�
	private int lvl;
	private String comment_id;
	private int parentNO;
	private int commentNO;
	private int comment_rate;
	private String comment_text;
	private int recnum;
	private int level;
	private int count;
	
//	theater ���̺�
	private String theater_name;
	private String theater_id;
	
//	show ���̺�
	private String show_id;
	private String showdate;
	private String showtime;
	
//	area ���̺�
	private String area_id;
	private String area_name;
	
//	�����𸣰ڴ°͵�
	private String nickname;
	private String profile_image;
	private String articleNO1;
	
	
	
	
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle_en() {
		return title_en;
	}
	public void setTitle_en(String title_en) {
		this.title_en = title_en;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getOpendate() {
		return opendate;
	}
	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getPoster_back() {
		return poster_back;
	}
	public void setPoster_back(String poster_back) {
		this.poster_back = poster_back;
	}
	public String getPoster_main() {
		return poster_main;
	}
	public void setPoster_main(String poster_main) {
		this.poster_main = poster_main;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public int getParentNO() {
		return parentNO;
	}
	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
	}
	public int getCommentNO() {
		return commentNO;
	}
	public void setCommentNO(int commentNO) {
		this.commentNO = commentNO;
	}
	public int getComment_rate() {
		return comment_rate;
	}
	public void setComment_rate(int comment_rate) {
		this.comment_rate = comment_rate;
	}
	public String getComment_text() {
		return comment_text;
	}
	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
	public int getRecnum() {
		return recnum;
	}
	public void setRecnum(int recnum) {
		this.recnum = recnum;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(String theater_id) {
		this.theater_id = theater_id;
	}
	public String getShow_id() {
		return show_id;
	}
	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}
	public String getShowdate() {
		return showdate;
	}
	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public String getArea_id() {
		return area_id;
	}
	public void setArea_id(String area_id) {
		this.area_id = area_id;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getArticleNO1() {
		return articleNO1;
	}
	public void setArticleNO1(String articleNO1) {
		this.articleNO1 = articleNO1;
	}
	
}
