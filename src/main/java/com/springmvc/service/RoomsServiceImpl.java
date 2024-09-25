package com.springmvc.service;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.mapper.RoomsMapper;

@Service
public class RoomsServiceImpl implements RoomsService {
	@Autowired
	private RoomsMapper mapper;
	
	
	@Override	
	public JSONArray viewRoomsAll(){
		//1. 다오를 호출해서 새로운 맵에 일단 담아 둔다
		//2. 맵으로 받은 결과값을 제이슨으로 변환한다
		//3. 제이슨으로 변환한 데이터를 리턴해준다.
		JSONArray jsonArray = new JSONArray();
		List<Map<String, Object>> roomList = this.mapper.viewRoomsAll();
		System.out.println(":::::roomList: "+roomList);
		for (Map<String, Object> map:roomList) {
			jsonArray.put(convertMapToJson(map));
		}
		
		//from ssong
		/*
		 * org.json.simple.JSONArray jsonArr = new org.json.simple.JSONArray(); for( int
		 * i=0; i<roomList.size(); i++ ) { org.json.simple.JSONObject jsonObj = new
		 * org.json.simple.JSONObject(roomList.get(i)); jsonArr.add(jsonObj); }
		 * 
		 * for( Map<String, Object> m:roomList ) { org.json.simple.JSONObject jObj = new
		 * org.json.simple.JSONObject(m); }
		 */
		
		System.out.println("::::jsonArray: "+jsonArray); 
		return jsonArray; 
	}
	

	public JSONObject convertMapToJson(Map<String, Object> map) {
	    JSONObject json = new JSONObject();
	    for (Map.Entry<String, Object> entry : map.entrySet()) {
	        String key = entry.getKey();
	        Object value = entry.getValue();
	        json.put(key, value);
	    }
	    System.out.println(":::::json Obj: "+json);
	    return json;
	}

	@Override
	public String test() {
		System.out.println("RoomsServiceImpl > test!! ");
		return mapper.test();
	}

}



