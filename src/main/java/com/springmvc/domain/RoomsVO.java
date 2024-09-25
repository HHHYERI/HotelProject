package com.springmvc.domain;

import org.springframework.web.multipart.MultipartFile;

public class RoomsVO {
	private String room_hd, room_tp, room_service, room_detail;
	private int room_cap, room_amt;
	private double room_size;
	private MultipartFile roomImage;
	
	
	public MultipartFile getRoomImage() {
		return roomImage;
	}
	public void setRoomImage(MultipartFile roomImage) {
		this.roomImage = roomImage;
	}
	public String getRoom_hd() {
		return room_hd;
	}
	public void setRoom_hd(String room_hd) {
		this.room_hd = room_hd;
	}
	public String getRoom_tp() {
		return room_tp;
	}
	public void setRoom_tp(String room_tp) {
		this.room_tp = room_tp;
	}
	public String getRoom_service() {
		return room_service;
	}
	public void setRoom_service(String room_service) {
		this.room_service = room_service;
	}
	public String getRoom_detail() {
		return room_detail;
	}
	public void setRoom_detail(String room_detail) {
		this.room_detail = room_detail;
	}
	public int getroom_cap() {
		return room_cap;
	}
	public void setroom_cap(int room_cap) {
		this.room_cap = room_cap;
	}
	public int getRoom_amt() {
		return room_amt;
	}
	public void setRoom_amt(int room_amt) {
		this.room_amt = room_amt;
	}
	public double getRoom_size() {
		return room_size;
	}
	public void setRoom_size(double room_size) {
		this.room_size = room_size;
	}
	
	
}
