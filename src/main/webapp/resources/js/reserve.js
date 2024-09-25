$(document).ready(function(){

	
}); //end of ready
    function getQueryParams() {
        var params = {};
        var queryString = window.location.search.substring(1);
        var regex = /([^&=]+)=([^&]*)/g;
        var m;
        while (m = regex.exec(queryString)) {
            params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
        }
        return params;
    }

    // 문서가 로드된 후 필드에 값을 설정
    document.addEventListener('DOMContentLoaded', function() {
        var params = getQueryParams();
        if (params.date_in) {
            document.getElementById('date_in').value = params.date_in;
        }
        if (params.date_out) {
            document.getElementById('date_out').value = params.date_out;
        }
    });

$(function(){
	//검색
	$('#btn_search').on('click',function(){
		getRoomList();
	});
});

var r_list_arr = new Array(); //방정보 데이터 담기
var s_list_arr = new Array();

//PlanRoomlist 호출
function getRoomList(){
	//validation추가할것
	var dateIn = $('#date_in').val();
	var dateOut = $('#date_out').val();
	if( dateIn == "" || dateOut == ""){
		alert("Please select a date.");
		return;
	}
	dateIn = changDateFormat(dateIn);
	dateOut = changDateFormat(dateOut);
	if( dateIn >= dateOut ){
		alert("Please select a date after check-in as the check-out date.");
		return;
	}

	var	param = {
		rsv_in_dt  : dateIn,
		rsv_out_dt : dateOut,
		adlt_num : $('#adlt_num').val(),
		chld_num : $('#chld_num').val(),
		room_cnt : $('#room_cnt').val(),
	}; 
	
	$.ajax({
		type: "get",
		url: "/Hotel/schRoomList",
		dataType : "json",
		contentType: "application/json",
		data: param,		
		success: function(data){
			console.log(data);
			if(data.length > 0 ){
				$(".no-list").hide();
				$(".r-list").show();
				r_list_arr = data;
				s_list_arr = param;
				bindRoomList(data);
			} else {
				$(".r-list").hide();
			    $(".no-list").show();
				$(".no-list td").text("Sorry your search returned no available rooms.");
			}
			
		},
		error: function(errorThrown){
			alert(errorThrown.statusText);
		}
	});	
	
}

function changDateFormat(p_date){
	var dt = new Date(p_date);
	var y = dt.getFullYear();
	var m = dt.getMonth()+1+"";
	if( m < 10 ) m = "0"+m;
	var d = dt.getDate();
	if( d < 10 ) d = "0"+d;
	
	return	y+m+d; 
}

function bindRoomList(r_list){
	$(".r-list:gt(0)").remove();
	
	for(var i=0; i<r_list.length; i++){
		var r_list_tb = $(".r-list:first").clone();
		$($(r_list_tb).find(".tb-room-list")[0]).html("<img src='./resources/img"+r_list[i].IMG_PATH+"' alt='No Image' class='room-img'>");
		var roomName = r_list[i].ROOM_NM.replace(/ /g, "<br>");
        $($(r_list_tb).find(".tb-room-list")[1]).html(roomName);
		//$($(r_list_tb).find(".tb-room-list")[1]).text(r_list[i].ROOM_NM);
		$($(r_list_tb).find(".tb-room-list")[2]).text(r_list[i].ROOM_SIZE);
		$($(r_list_tb).find(".tb-room-list")[3]).text(r_list[i].ROOM_CAP);
		var formattedPrice = r_list[i].BSIC_PRC.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $($(r_list_tb).find(".tb-room-list")[4]).text(formattedPrice);
		//$($(r_list_tb).find(".tb-room-list")[4]).text(r_list[i].BSIC_PRC);
		$($(r_list_tb).find(".resv-bt")[0]).attr("data-idx", i);
		$(".resv-room-list").append(r_list_tb);
	}
	
	$(".r-list:first").remove();
}

function goReserve(_this){
	var a = $(_this).parent().data("idx");
	console.log(a);
	console.log(r_list_arr[a]);	
	console.log("가격:" +r_list_arr[a].BSIC_PRC);	
	console.log("날짜:" +s_list_arr.rsv_in_dt);

	var form = document.createElement('form'); //form엘리먼트 생성  
	form.setAttribute("method", "post"); //POST 메서드 적용 
	form.setAttribute("action", "/Hotel/resv_cart");	 //데이터를 전송할 url 
				
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'BSIC_PRC'); 
	hiddenField.setAttribute('value', r_list_arr[a].BSIC_PRC); 
	form.appendChild(hiddenField);
		
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'IMG_PATH'); 
	hiddenField.setAttribute('value', r_list_arr[a].IMG_PATH); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'ROOM_CAP'); 
	hiddenField.setAttribute('value', r_list_arr[a].ROOM_CAP); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'ROOM_GR'); 
	hiddenField.setAttribute('value', r_list_arr[a].ROOM_GR); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'ROOM_NM'); 
	hiddenField.setAttribute('value', r_list_arr[a].ROOM_NM); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'ROOM_TP'); 
	hiddenField.setAttribute('value', r_list_arr[a].ROOM_TP); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'SMOK_YN'); 
	hiddenField.setAttribute('value', r_list_arr[a].SMOK_YN); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'ROOM_SIZE'); 
	hiddenField.setAttribute('value', r_list_arr[a].ROOM_SIZE); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'rsv_in_dt'); 
	hiddenField.setAttribute('value', s_list_arr.rsv_in_dt); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'rsv_out_dt'); 
	hiddenField.setAttribute('value', s_list_arr.rsv_out_dt); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'adlt_num'); 
	hiddenField.setAttribute('value', s_list_arr.adlt_num); 
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'chld_num'); 
	hiddenField.setAttribute('value', s_list_arr.chld_num); 
	form.appendChild(hiddenField);

	var hiddenField = document.createElement('input'); 	
	hiddenField.setAttribute('type', 'hidden'); //값 입력 
	hiddenField.setAttribute('name', 'room_cnt'); 
	hiddenField.setAttribute('value', s_list_arr.room_cnt); 
	form.appendChild(hiddenField);	
	
	document.body.appendChild(form);
	form.submit();	
	
	
}	

	
