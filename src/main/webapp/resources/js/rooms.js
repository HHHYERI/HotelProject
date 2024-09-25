$(document).ready(function(){
	getRoomList();
}); //end of ready

//roomlist 호출
function getRoomList(){
	$.ajax({
		type: "get",
		url: "/Hotel/roomsList",
		dataType : "json",
		contentType: "application/json",
		success: function(data){
			console.log(data);
			bindRoomList(data);
			if(CD_NM="Standardt"){
				console.log("룸 같은거 확인");
			}
		},
		error: function(errorThrown){
			alert(errorThrown.statusText);
		}
	});	
}
		
function bindRoomList(r_list){
	console.log("bindRoomList");
	for( var i=0; i<r_list.length; i++ ){
		var r_list_row = $(".row-roomList:first").clone();
		$($(r_list_row).find(".d-roomList")[0]).text(r_list[i].CD_NM);       //방등급
		$($(r_list_row).find(".d-roomList")[1]).text(r_list[i].ROOM_SZ);     //방크기
		$($(r_list_row).find(".d-roomList")[2]).text(r_list[i].ROOM_CP); //수용인원
		//$($(r_list_row).find(".d-roomList")[3]).text(r_list[i].ROOM_SERVICE);  //어메니티
		//$($(r_list_row).find(".d-roomList")[4]).text(r_list[i].ROOM_DETAIL);   //방설명
        $($(r_list_row).find(".d-roomList")[3]).text(r_list[i].ROOM_DES);   //방설명
		
        /*
        /room/STD_DBL.png^/room/STD_SGL.png^/room/STD_TRP.png^/room/STD_TWN.png
        imgList >> ["/room/STD_DBL.png",    "/room/STD_SGL.png",    "/room/STD_TRP.png",    "/room/STD_TWN.png"]
        */
        var imgList = r_list[i].IMG_LIST.split("^");
        for( var j=0; j<imgList.length; j++ ){
            var imgHtmlA = $(r_list_row).find(".d-imgList").html();
            //  "<img src='./resources/room/STD_DBL.png+"' alt='No Image' class='room-img'>" "<img src='./resources/img/room/STD_SGL.png' alt='No Image' class='room-img'>"
            var imgHtmlB = "<img src='./resources/img"+imgList[j]+"' alt='No Image' class='room-img'>";
            $(r_list_row).find(".d-imgList").html(imgHtmlA + imgHtmlB);
            console.log(i, imgList[j]);
        }
        console.log("---------------------------------------");

		$("#cont_roomList").append(r_list_row);
	}
	$(".row-roomList:first").remove();			
}



