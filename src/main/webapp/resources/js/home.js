$(document).ready(function(){
	$('#btn_search').click(function() {
		var date_in  = $('#date_in').val();
		var date_out = $('#date_out').val();
		var adlt_num = $('#adlt_num').val();
		var chld_num = $('#chld_num').val();
		var room_cnt = $('#room_cnt').val();
		console.log(adlt_num+''+chld_num);
        
        // URL 쿼리 파라미터 생성
        var url = 'reserve?date_in=' + encodeURIComponent(date_in) + 
        		  '&date_out=' + encodeURIComponent(date_out) +	
        		  '&adlt_num=' + encodeURIComponent(adlt_num) + 
                  '&chld_num=' + encodeURIComponent(chld_num) + 
                  '&room_cnt=' + encodeURIComponent(room_cnt);
        
        // rsv.jsp로 이동
        window.location.href = url;		
		
    });


});