package com.spring.ex01.emp.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("storeDTO")
public class StoreDTO {
	
	// 스토어 정보 
	private String menu_id;	// 메뉴 아이디
	private String name;	// 메뉴명
	private int price;		// 메뉴 가격
	private String image;	// 메뉴 이미지
	
	// 스토어 카테고리
	private int menu_type;	// 메뉴 타입
	
	
	// 스토어 결제정보 (장바구니, 구매하기)
	private String user_id;
	private String cart_id;
	private int amount;	// 수량
	private int total;	// 총 금액
	private Date store_date;	// 제품 담은 시간
	private String store_pay;	// 결제여부 (장바구니 : N , 결제하기 : Y)
	
	
	
	
	
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(int menu_type) {
		this.menu_type = menu_type;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getStore_date() {
		return store_date;
	}
	public void setStore_date(Date store_date) {
		this.store_date = store_date;
	}
	public String getStore_pay() {
		return store_pay;
	}
	public void setStore_pay(String store_pay) {
		this.store_pay = store_pay;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCart_id() {
		return cart_id;
	}
	public String setCart_id(String cart_id) {
		return this.cart_id = cart_id;
	}
}
