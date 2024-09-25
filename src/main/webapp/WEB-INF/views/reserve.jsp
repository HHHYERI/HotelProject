<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.date-input{
			width: 100%;
		}
		.box{
			margin-top: -80px;
				
		}
		#btn_search{
			margin-top: 35px;
			margin-left: 10px; 
			width: 10%;
		}
		.row .check-date{
			width: 20%;
			margin: 2px;
			
		}
		.row .select-option{
			width: 15%;
			margin: 2px;
		}
		.room-name{
			text-align: left;
		}
		.title{
			padding: 10px;
		}
		.title .row{
			margin-bottom: 10px;
		}
		.title P{
			color: #707079;
			font-size: 30px;
			text-align: left;
		}
		.details-explanation{
			list-style: none;
			color: #707079;
			text-align: left;
			
		}
		.details-explanation-list{
			margin-bottom: 10px;
		}
		.plan-tb{
			width: 100%;
			
		}
		.plan-tb .tb-room-list{
			width: 200px;
			height: 100px;
			font-size: 20px;
			text-align: left;
		}
		.plan-tb button {
			display: block;
			font-size: 14px;
			text-transform: uppercase;
			border: 1px solid #dfa974;
			border-radius: 2px;
			color: #dfa974;
			font-weight: 500;
			background: transparent;
			width: 100%;
			height: 50px;
		}
		.r-list-img {
			width: 200px;
			height: 200px;
		
		}
		.resv-room-list {
			margin-top: 100px;
		}
	</style>
	<script src="./resources/js/reserve.js"  type="text/javascript"></script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Booking your room</h2>
                        <div class="bt-option">
                            <a href="./home">Home</a>
                            <span>Reserve</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    
	<section class="resv-search">
		<div class="container">
	        <div class="" style="margin-top: 20px;">
                <div class="box booking-form">   
        	        <form action="">                         
	                    <div class="container">
		                    <div class="row">
	                            <div class="check-date">
	                                <label for="date_in">Check In:</label>
	                                <input type="text" class="date-input" id="date_in">
	                                <i class="icon_calendar"></i>
	                            </div>
	                            <div class="check-date">
	                                <label for="date_out">Check Out:</label>
	                                <input type="text" class="date-input" id="date_out">
	                                <i class="icon_calendar"></i>
	                            </div>
	                            <div class="select-option">
	                                <label for="adlt_num">Adult(for 1 room):</label>
	                                <select id="adlt_num">
	                                    <option value="1">1 Adult</option>
	                                    <option value="2">2 Adult</option>
	                                    <option value="3">3 Adult</option>
	                                    <option value="4">4 Adult</option>
	                                    <option value="5">5 Adult</option>
	                                </select>
	                            </div>
	                            <div class="select-option">
	                                <label for="chld_num">Children(for 1 room):</label>
	                                <select id="chld_num">
	                                	<option value="0">No Children</option>
	                                    <option value="1">1 Children</option>
	                                    <option value="2">2 Children</option>
	                                    <option value="3">3 Children</option>
	                                    <option value="4">4 Children</option>
	                                    <option value="5">5 Children</option>
	                                </select>
                                </div>
	                            <div class="select-option">
	                                <label for="room_cnt">X Room:</label>
	                                <select id="room_cnt">
	                                    <option value="1">1 Room</option>
	                                    <option value="2">2 Room</option>
	                                    <option value="3">3 Room</option>
	                                    <option value="4">4 Room</option>
	                                    <option value="5">5 Room</option>
	                                </select>
	                            </div>
	                            <button type="button" id="btn_search">Check Availability</button>
                            </div>
	                        
	                    </div>
	                </form>
                </div>        
	        </div>
		</div>
	</section>
    
    <section class="resv-list" style="margin-top: 7	0px;">
    	<div class="container" id="resv-list">
      		<div class="resv-room-list">
       			<div class="row " >
	             	<table class="table plan-tb r-list" style="border: 1px solid #ddd;display:none;">
	             		<tr>
		               		<th colspan="2">Room</th>
		               		<th> Room size(㎡)</th>
		               		<th> Max people</th>
		               		<th colspan="2">Price per room</th>			                    		
	             		</tr>
						<tr class="room-list">
							<td class="tb-room-list r-list-img"></td>
							<td class="tb-room-list ">Room Type here</td>
							<td class="tb-room-list">20㎡</td>
							<td class="tb-room-list">Max</td>
							<td class="tb-room-list">30,000 W</td>
							<td class="resv-bt" data-info=""><button onclick="goReserve(this);">Reserve</button></td>
						</tr>
	           		</table>
	           		<table class="table plan-tb no-list" style="border: 1px solid #ddd;">
						<tr>
							<td colspan="6" style="height:90px; text-align:center; vertical-align:middle; font-size: 150%;">
								Select date and number of staying guests you wish to reserve.
							</td>
						</tr>
	           		</table>
      			</div>
  			</div>
    	</div>
    </section>
	    <div class="" style="height: 200px;">
	    </div> 
</body>
</html>
