package com.springmvc.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.domain.ResvVO;
import com.springmvc.mapper.ResvMapper;

@Service
@Transactional(readOnly = true)
public class ResvServiceImpl implements ResvService{

	@Autowired
	private ResvMapper mapper;

	//방리스트검색
	@SuppressWarnings("unchecked")
	@Override
	public String getRoomList(Map<String, Object> param) {
		int adlt_num = Integer.parseInt((String) param.get("adlt_num"));
		int chld_num = Integer.parseInt((String) param.get("chld_num"));
		float person_num = (float) (adlt_num+(chld_num*0.5));
		param.put("person_num", person_num);
		
		JSONArray jsonArray = new JSONArray();
		List<Map<String, Object>> roomList = mapper.getRoomlist(param);
		for (Map<String,Object> room : roomList) {
			JSONObject jsonObj = new JSONObject(room);
			jsonArray.add(jsonObj);
		}
		
		return jsonArray.toString();
	}	
	
	//예약번호를 부여하여, 입력받은 고객정보 db에 insert
	@Override
	public String insertResvForm(List<Map<String, Object>> formList) {
		String resvNum = generateUniqueResvNum();
		System.out.println("resvNum"+ resvNum);
		System.out.println("formList:::"+formList);
		int cnt=0;
		for (Map<String, Object> record : formList) {
			record.put("rsv_cd", resvNum);
			System.out.println("record:::"+record);
			mapper.insertResvForm(record);
			cnt++;
		}
		if( cnt == formList.size() ){
			return resvNum ;
		}else { 
			return "failed" ;
		}
	}	
	
    // 예약번호 생성 및 중복 체크
	private String generateUniqueResvNum() {
        String resvNum;
        do {
            resvNum = getResvNum();
        } while (mapper.countByResvNum(resvNum) > 0); // 중복 확인
        return resvNum;
    }
    
	//예약번호 생성
	public static String getResvNum() {
        StringBuilder resvNum = new StringBuilder();
        Random rd = new Random(); 
        int ranD = 10; // 예약번호의 길이
        for(int i=0; i<ranD; i++){
            resvNum.append(rd.nextInt(10));   
	}
		return resvNum.toString();
		
	}	

	//메일,예약번호로 예약정보 조회
    @Override
    public int getReservation(String rsv_mail_addr, String rsv_cd) {
        return mapper.getReservation(rsv_mail_addr, rsv_cd);
    }	   
	
    //예약정보 조회 리턴
    @Override
    public List<ResvVO> getResvInfo(String rsv_mail_addr, String rsv_cd) {
    	 return mapper.getResvInfo(rsv_mail_addr, rsv_cd);
    }
    
    //캔슬
	@Override
	public boolean updateRsvSt(String rsv_cd) {
		 return mapper.updateRsvSt(rsv_cd) > 0;
		
	}

	//메모업데이트
	@Override
	public void updateMemo(ResvVO resvVO) {
		mapper.updateMemo(resvVO);
	}
	
}
