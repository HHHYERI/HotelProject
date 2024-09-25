package com.springmvc.service;

import java.util.List;
import java.util.Map;


import com.springmvc.domain.ResvVO;

public interface ResvService {

	String insertResvForm(List<Map<String,Object>> formList);
	int getReservation(String rsv_mail_addr, String rsv_cd);
	List<ResvVO> getResvInfo(String rsv_mail_addr, String rsv_cd);
	boolean updateRsvSt(String rsv_cd);
	String getRoomList(Map<String, Object> param);
	void updateMemo(ResvVO resvVO);
	
}
