$(document).ready(function(){
	$(".enetEn").keyup(function(event){
	    if (!(event.keyCode >=37 && event.keyCode<=40)) {
	        var inputVal = $(this).val();
	        $(this).val(inputVal.replace(/[^a-zA-Z0-9\s!@#$%^&*()_+=[\]{};':"\\|,.<>?~`-]/g, ''));    
		    }
		});
});

$(function(){
    $("#resv-bt").click(function(){		
 		if( validCheck() ){
 		//if(true){ //임시테스트용
			var form =[]; //jsonArray생성
			//방 갯수를 제어하는 클래스 .room을 이용하여, room개수만큼 배열 생성
			for (var i=0; i<$(".room").length; i++){
				var sty_p1 = $($(".room")[i]).find(".sty-tel1").val();
				var sty_p2 = $($(".room")[i]).find(".sty-tel2").val();
				var sty_p3 = $($(".room")[i]).find(".sty-tel3").val();
				var sty_p0 = '';
				sty_p0 = sty_p1+''+sty_p2+''+sty_p3 ;	
			
				//조식 선택에 따라 Y,N 변경
				var  meal_check = $($(".room")[i]).find('input.meal_y:checked').val();
				if (meal_check == 'Y') {
				    // meal_check가 'Y'인 경우, 그대로 유지
				} else {
				    // 빈값인 경우
				    meal_check = 'N'; 
				}
				
				//배열 추가
				form.push({
					"room_seq"      : String(i+1),
			    	"rsv_cus_nm"    : $('#rsv-name').val(),
			        "rsv_phon_num"  : $('#resv-tel0').val(),
			        "rsv_mail_addr" : $('#mail').val(),
			        "rsv_in_tm"     : $('#time').val(),
			        "cus_memo"      : $('#gMemo').val(),
			        "sty_cus_nm"    : $($(".room")[i]).find(".sty_cus_nm").val(),
			        "sty_phon_num"  : sty_p0,
			        "meal_yn"  		: meal_check,
		        	"rsv_in_dt"     : rsv_in_dt,
		        	"rsv_out_dt"    : rsv_out_dt,
		        	"room_gr"       : room_gr,
		        	"room_tp"       : room_tp,
		        	"smok_yn"       : smok_yn,
		        	"adlt_num"      : parseInt(adlt_num,10),
		        	"chld_num"      : parseInt(chld_num,10),
		        	"rsv_prc"       : parseInt(rsv_prc,10) + (meal_check == 'Y' ? (adlt_num * 20000) + (20000 * (chld_num / 2)) : 0),
			    });
			}
			console.log("form:"+form);
			console.log(JSON.stringify(form, null, 1));
	        
	        $.ajax({
	            type: "POST",
	            url: "/Hotel/resvForm",
	            dataType : "text", //리턴하는 데이터 타입
	            contentType: "application/json; charset=UTF-8",
	            data: JSON.stringify(form),
	            success: function(data){
	            	console.log("resvNum:"+ data);
	            	$('.breadcrumb-section').html(`
					    <div class="breadcrumb-section">
					        <div class="container">
					            <div class="row" style="height: 300px; margin-top: 100px;">
					            	<div class="col-lg-12">
					                    <div class="breadcrumb-text">
					                        <h2>Thank you for your reservation!</h2>
					                        <h2>Your reservation nuber is "${data}"</h2>
					                        <h5 style="color: red;">The reservation number has been sent to your email.</h5>
					                        <h5 style="color: red;">Your reservation number is required to confirm your reservation.</h5>
					                    </div>
				                    </div>
					            </div>
					        </div>
					    </div>
			            `).show();
			         $('.resv-Cart').html(`  
					    <section class="resv-Cart">
				        <div class="container">
				            </div>	
			            </div>		         
			         `).show();
	            },
	            error: function(errorThrown){
	                alert("error : " + errorThrown.statusText);
	            }
	        });
        }
    });
});

function validCheck(){
	//예약자 정보시작, 이름
	if($("#rsv-name").val() == ""){
	    alert("Please enter full name.");
	    $("#rsv-name").focus();
	    return false;
	}  
	
	//예약자 폰번호
	var tel = $("#resv-tel1").val() + $("#resv-tel2").val() + $("#resv-tel3").val()
	$("#resv-tel0").val(tel);
	if($("#resv-tel1").val() == ""){
	    alert("Please enter phone number.");
	    $("#resv-tel1").focus();
	    return false;
	}
	
	if($("#resv-tel2").val() == ""){
	    alert("Please enter phone number.");
	    $("#resv-tel2").focus();
	    return false;
	}
	
	if($("#resv-tel3").val() == ""){
	    alert("Please enter phone number.");
	    $("#resv-tel3").focus();
	    return false;
	}
	
	var email= $("#mail").val();
	var regexp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	if($("#mail").val() == ""){
	    alert("Please enter e-mail address.");
	    $("#mail").focus();
	    return false;
	}
	
	if (!regexp.test(email)) {
	    alert("Please use the [aaa@mail.com] format.");
	    $("#mail").focus();
	    return false;
	}
	
	//숙박자 정보
	if($("#sty-name").val() == ""){
	    alert("Please enter guest's full name.");
	    $("#sty-name").focus();
	    return false;
	}  
	
	// 숙박자 전화번호 유효성 검사
	var isEmpty = false; // 빈 값 체크를 위한 변수
	// 모든 전화번호 입력 필드에 대해 반복
	$('input[name="sty-tel"]').each(function() {
	    if ($(this).val().trim().length == 0) {
	        alert("Please enter guest's phone number."); // 경고 메시지
	        $(this).focus(); // 비어있는 필드에 포커스
	        isEmpty = true; // 빈 값이 있음을 표시
	        return false; 
	    }
	});
	if (isEmpty) {
   		return false; // 빈 값이 있는 경우 함수 종료
	}
	
	//조식
	var cnt = $("input[type=radio]:checked").length;
	if(cnt < room_cnt){
	    alert("Please select a breakfast option.");
	    $(".meal_n").focus();
	    return false;
	}
	
	return true;
}


document.addEventListener('DOMContentLoaded', function() {
	//pre버튼으로 전화면 돌아가기
	document.getElementById('pre_bt').addEventListener('click', function() {
		window.history.back();
	});
	
	//조식가격추가
    var mealRadios = document.querySelectorAll('input[name^="meal"]');
    var meal_st = document.getElementById('meal_st');
    var meal_prc = document.getElementById('meal_prc');
    var amountDisplay = document.getElementById('amountDisplay');
    var meal_unit_prc = 20000;
    var total_prc = 0; 
    var roomAmtPrc = amt_prc;
	
    mealRadios.forEach(function(radio) {
        radio.addEventListener('change', function() {
	        var meal_cnt = 0;
	        mealRadios.forEach(function(radio) {
	            if (radio.checked && radio.value == 'Y') {
	                meal_cnt++;
	            }
	        });
            if (this.value == 'Y') {
                total_prc = ((meal_unit_prc*adlt_num)+(meal_unit_prc*chld_num/2))*meal_cnt;
                meal_st.textContent = total_prc.toLocaleString(); // 가격 계산
                
            } else {
            	if(meal_cnt>0){
					var unit_prc = ((meal_unit_prc*adlt_num)+(meal_unit_prc*chld_num/2));
                	total_prc -= unit_prc;
                	newTotal -= unit_prc;	 
                	meal_st.textContent = total_prc.toLocaleString();   		
            	} else{
            		total_prc =0;
            		meal_st.textContent = "No Breakfast";
            	}
            }
         	var newTotal = roomAmtPrc+total_prc;
         	amountDisplay.textContent = newTotal.toLocaleString();
        });
	});
});



    



