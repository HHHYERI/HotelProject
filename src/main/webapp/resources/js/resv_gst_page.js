$(document).ready(function(){	
	console.log(find_rsv_cd);
	var rsv_cd = find_rsv_cd;
	$('#cancel').on('click', function(){
		var confirmCancel = confirm("Are you canceling your reservation?");
		if (confirmCancel){
			$.ajax({
		        type: "POST",
		        url: "/Hotel/resv_cancel",
		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	            data:{
                        rsv_cd: rsv_cd
                    },	            
		        success: function(response){
					alert(response);
					location.href = "/Hotel/resv_cfm";
		        },	
				error: function(xhr){
	                alert("error : " + xhr.responseText);
	            }
			});
		}
	});
	
	$('#change').click(function() {
	    var memo = $('#gMemo').val();
	    var reservationId = find_rsv_cd;
    	
    	$.ajax({
        url: '/Hotel/update_memo',  
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(
        	{   rsv_cd: reservationId, 
        	  cus_memo: memo 
        	 }),
        success: function(response) {
            alert('Your note has been updated successfully.');
        },
        error: function(xhr, status, error) {
            alert('Failed to update note.');
        }
    	});
    });
});		