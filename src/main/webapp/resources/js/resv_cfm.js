$(function(){
    $("#findResv").on('submit', function(event) {
 				event.preventDefault();	
                var rsv_mail_addr = $('#resvEmail').val();
                var rsv_cd = $('#resvNumber').val();
                
                console.log(rsv_mail_addr);
                console.log(rsv_cd);

	        $.ajax({
	            type: "POST",
	            url: "/Hotel/getResv",
				contentType: "application/json; charset:UTF-8;",
				dataType: 'json',            
	            data: JSON.stringify({
                        rsv_mail_addr: rsv_mail_addr,
                        rsv_cd: rsv_cd
                    }),
	            success: function(data){
	               if (data == 0) {
		               alert('일치하는 예약이 없습니다. 이메일 주소와 예약 번호를 확인해주세요.');
		           } else {
		               console.log('Reservations:', data);
		               findResv(rsv_mail_addr, rsv_cd);
		           }
		        },
	            error: function(error) {
	            console.error('Error:', error);
	            }
       	 	});
			
			 function findResv(rsv_mail_addr, rsv_cd) {
				console.log("find를 탔다!");
       	 		var form = document.createElement('form'); //form엘리먼트 생성 
				form.setAttribute("method", "post"); //POST 메서드 적용 
				form.setAttribute("action", "/Hotel/resv_gst_page");	 //데이터를 전송할 url 
				//document.charset = "utf-8"; //인코딩 
				
				var hiddenField = document.createElement('input'); 	
				hiddenField.setAttribute('type', 'hidden'); //값 입력 
				hiddenField.setAttribute('name', 'find_mail_addr'); 
				hiddenField.setAttribute('value', rsv_mail_addr); 
				form.appendChild(hiddenField);

				var hiddenField = document.createElement('input'); 	
				hiddenField.setAttribute('type', 'hidden'); //값 입력 
				hiddenField.setAttribute('name', 'find_rsv_cd'); 
				hiddenField.setAttribute('value', rsv_cd); 
				form.appendChild(hiddenField);
					        
         		document.body.appendChild(form);
	       		form.submit();   
       	 	}
    	});
	});

