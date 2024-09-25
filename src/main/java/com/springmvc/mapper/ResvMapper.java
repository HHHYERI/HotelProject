package com.springmvc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.springmvc.domain.ResvVO;

public interface ResvMapper {
	void insertResvForm(Map<String, Object> record);
	int countByResvNum(String resvNum);
	int getReservation(@Param("rsv_mail_addr") String rsv_mail_addr, @Param("rsv_cd") String rsv_cd);
	List<ResvVO> getResvInfo(@Param("rsv_mail_addr") String rsv_mail_addr, @Param("rsv_cd") String rsv_cd);
	int updateRsvSt(@Param("rsv_cd") String rsv_cd);
	List<Map<String, Object>> getRoomlist(Map<String, Object> param);
	void updateMemo(ResvVO resvVO);
}
