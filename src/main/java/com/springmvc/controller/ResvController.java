package com.springmvc.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.springmvc.domain.ResvVO;
import com.springmvc.service.MailService;
import com.springmvc.service.ResvService;

@Controller
public class ResvController {
	
	@Autowired
	private ResvService resvSvc;
	@Autowired
	private MailService mailSvc;
	
	//예약검색페이지 로딩
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserve(Model model) {
		System.out.println("::::: reserve 페이지 로딩 log");
		return "reserve";
	}	
	
	//방리스트검색
	@ResponseBody
	@RequestMapping(value="/schRoomList", method=RequestMethod.GET)
	public String getRoomlist(@RequestParam Map<String, Object> param) {
		System.out.println(":::schRoomList연결");
		System.out.println(param.get("rsv_in_dt"));
		System.out.println(param.get("rsv_out_dt"));
		
		return resvSvc.getRoomList(param);
	}
	
	
	//예약상세사항, 예약내용 확인 페이지(cart)
	@RequestMapping(value="/resv_cart", method=RequestMethod.POST)
	public String reserve_cart(@RequestParam Map<String, Object> param, Model model) {
		System.out.println("::::: resv_cart 페이지 로딩 log");
		//파라미터 받아서 리턴
		model.addAttribute("tempResvInfo", param);
		System.out.println("model::"+ param);
		return "resv_cart";
	}
	
	//예약 고객디테일 db인서트
    @RequestMapping(value="/resvForm", method=RequestMethod.POST)
    public ResponseEntity<String> insertResvForm(@RequestBody List<Map<String, Object>> formList){
    	String resvNum; 
    	try { 
			 System.out.println(":::::::::try obj>> "+formList); 
			 resvNum = resvSvc.insertResvForm(formList);
			 System.out.println("//서비스처리완료//");
			 
			
             String recipientEmail = (String) formList.get(0).get("rsv_mail_addr");  // 이메일 주소 추출
             mailSvc.sendReservationEmail(recipientEmail, resvNum, formList); //예약 메일전송
			 return new ResponseEntity<String>(resvNum, HttpStatus.OK); 
		 } catch (Exception e) { 
			 return new ResponseEntity<String>("Error saving data", HttpStatus.INTERNAL_SERVER_ERROR); 
		 }
    }

    //메일, 예약번호 로그인페이지
	@RequestMapping(value="/resv_cfm", method=RequestMethod.GET)
	public String reserve_confirm(Model model) {
		System.out.println("::::: resvCfm 페이지 로딩 log");
		return "resv_cfm";
	}
	
	//메일, 예약번호로 예약정보 리턴
	@RequestMapping(value="/getResv", method=RequestMethod.POST)
	@ResponseBody
    public ResponseEntity<Integer> getReservation(@RequestBody ResvVO resvVO) {
		System.out.println("::::resvSvs 탔다");
        int reservation = resvSvc.getReservation(resvVO.getRsv_mail_addr(), resvVO.getRsv_cd());
        return ResponseEntity.ok(reservation);
    }
	
	//조회한 예약정보로 상세페이지 이동
	@RequestMapping(value="/resv_gst_page", method=RequestMethod.POST)
	public String resvGstPage(HttpServletRequest request, Model model) {
		System.out.println("::::: resvGstPage 페이지 로딩 log");
		System.out.println(":: 메일주소 ::" + request.getParameter("find_mail_addr"));
		System.out.println(":: 예약번호 ::" + request.getParameter("find_rsv_cd"));
		
		//1. 파라미터 전송받은 데이터를 기반으로 예약 데이터를 가져온다
		String rsv_mail_addr = request.getParameter("find_mail_addr"); 
		String rsv_cd = request.getParameter("find_rsv_cd"); 
		List<ResvVO> resvVOList =  resvSvc.getResvInfo(rsv_mail_addr, rsv_cd);
		
		//2. model.attribute("key", value) 이렇게 세팅해서 리턴
		model.addAttribute("reservation", resvVOList);
		System.out.println("메일::"+resvVOList.get(0).getRsv_mail_addr());
		return "resv_gst_page";
	}
	
	//캔슬처리
	@RequestMapping(value="/resv_cancel", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> cancel(@RequestParam("rsv_cd") String rsv_cd) {		
		boolean success = resvSvc.updateRsvSt(rsv_cd);
		System.out.println("파라미터 가져왔니??"+rsv_cd);
		return success 
		        ? ResponseEntity.ok("Your reservation has been canceled.") 
		        : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
		                         .body("An error occurred.");
	}
	
	//메모 업데이트
	@RequestMapping(value="/update_memo", method=RequestMethod.POST)
	@ResponseBody
    public ResponseEntity<String> updateMemo(@RequestBody ResvVO resvVO) {
		resvSvc.updateMemo(resvVO);
        return ResponseEntity.ok("메모가 성공적으로 업데이트되었습니다.");
    }	
	
	
}
