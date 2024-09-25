package com.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.springmvc.service.RoomsService;

@Controller
public class RoomsController {
		
	@Autowired
	private RoomsService roomSvc;

	
	@RequestMapping(value="/rooms", method=RequestMethod.GET)
	public String rooms(Model model) {
		System.out.println("::::: rooms 페이지 로딩 log");
		return "rooms";
	}
	
	@ResponseBody
	@RequestMapping(value = "/roomsList", method=RequestMethod.GET)
	public String getroomList() {
		System.out.println("::::::room list controller연결 log"+roomSvc.viewRoomsAll());
		return roomSvc.viewRoomsAll().toString();
	}
}