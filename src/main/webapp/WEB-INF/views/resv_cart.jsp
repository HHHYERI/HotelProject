<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="myValue" value="${param}" />

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	.revs-detail-tb {
		width: 100%;
		height: 20px;
	}
	.revs-detail-room-li {
		list-style: none;
	}
	.title-text{
		color: #dfa974;
	}
	.meal{
		color: #6b6b6b;
	}
	
	.form-control {
		margin: ;
		margin-bottom: 10px;
	}
	.amount {
		color: red;
		font-weight: 700;
	}
	.meal-bt{
		width:15px;
		height:15px;
		border:1px;
	}
	.btn {
		margin-top: 30px;
	}
	.pre-bt {
		width: 35%;
		margin-right: 12px;
	}
	.com-bt {
		width: 60%;
	}
	
	.impor {
		color: red;
		font-weight: 700;
	}
	
	</style>
	<style>
	.warn{
		color: red;
		font-size: 11px;
		display: none;
	}
	</style>
	<script>
    	var rsv_in_dt  = "${param.rsv_in_dt}";
    	var rsv_out_dt = "${param.rsv_out_dt}";
    	var adlt_num  = "${param.adlt_num}";
    	var chld_num  = "${param.chld_num}";
    	var room_cnt  = "${param.room_cnt}";
    	var room_gr   = "${param.ROOM_GR}";
    	var room_tp   = "${param.ROOM_TP}";
    	var room_nm   = "${param.ROOM_NM}";
    	var smok_yn   = "${param.SMOK_YN}";
    	var room_size = "${param.ROOM_SIZE}";
    	var rsv_prc   = "${param.BSIC_PRC}";
	</script>
	<script src="./resources/js/resv_cart.js"  type="text/javascript"></script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Check your reservation</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    
    <!-- RESV CART Section Start -->
    <section class="resv-Cart">
        <div class="container">
            <div class="row">
                <h3 class="title-text">Enter reservation's information details</h3>
            </div>
            <div class="row">
	            <div class="col-lg-8">
	                <form action= "" class="needs-validation" id="resvform" novalidate>
	                <!--  /Hotel/resvGstPage" -->
	                    <div class="row g-3">
	                        <div class="col-sm-6 req-div">
	                            <span class="impor">*</span>Full name(English only)
	                            <input type="text" class="form-control enetEn" id="rsv-name" name="rsv-name" maxlength="20" pattern="[A-Za-z]+" required>
	                            <!-- <p class="warn">성을 입력해주시기 바랍니다</p> -->
	                        </div>         
	                        <div class="col-sm-12">
	                            <label> 
	                            	<span style="float: left;"> <span class="impor">*</span>Phone number </span><br>
	                            	<input type="text" class="form-control resv-p1" style="width: 100px; float: left;" id="resv-tel1" name="resv-tel" placeholder="000" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '')"/><span style="float: left;"> - </span> 
	                            	<input type="text" class="form-control resv-p2" style="width: 100px; float: left;" id="resv-tel2" name="resv-tel" placeholder="0000" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')"/><span style="float: left;"> - </span> 
	                            	<input type="text" class="form-control resv-p3" style="width: 100px; float: left;" id="resv-tel3" name="resv-tel" placeholder="0000" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')"/>
	                        		<input type="hidden" class="resv-p0" name="resv-tel" id="resv-tel0"/>
	                        	</label>
	                        </div>
	                        <div class="col-sm-6">
	                            <span class="impor">*</span>Email (Reservation details will be sent via email.)
	                            <input type="email" class="form-control" id="mail" name="mail" placeholder="you@example.com">
	                        </div>
	                        <div class="col-sm-12">
	                            When would you like to check-in? 
	                            <input type="time" class="form-control" style="width: 250px;" id="time" name="time" placeholder="14:00">
	                        </div>
	                        <div class="col-sm-12">
	                            Please write your inquiry or message.(English only)
	                            <textarea class="form-control enetEn" id="gMemo" name="gMemo" rows="3" style="height:100px; resize: none;"></textarea>
	                        </div>
	                    </div>
	                    
	                    <!-- STAY GST INFO 1-->
						<c:forEach  var="cnt" begin="1" end="${param.room_cnt}">	
						<div class="room">                    
		                    <hr class="my-4">
								<h4>
									<span class="title-text">Enter guest information for each room</span>
								</h4>
							<div class="container">		   
								<h4 style="text-decoration: underline;">Room ${cnt}</h4>
			                    <div class="g-3">
			                        <div class="col-sm-6">
			                            <span class="impor">*</span>Full name(English only)
			                            <input type="text" class="form-control sty_cus_nm enetEn" id="sty-name" name="sty-name" maxlength="20" required>
			                        </div>         
			                        <div class="col-sm-12">
			                            <label> 
			                            	<span style="float: left;"> <span class="impor">*</span>Phone number </span><br>
			                            	<input type="text" class="form-control sty-tel1" style="width: 100px; float: left;" name="sty-tel" placeholder="000" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '')"/><span style="float: left;"> - </span> 
			                            	<input type="text" class="form-control sty-tel2" style="width: 100px; float: left;" name="sty-tel" placeholder="0000" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')"/><span style="float: left;"> - </span> 
			                            	<input type="text" class="form-control sty-tel3" style="width: 100px; float: left;" name="sty-tel" placeholder="0000" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')"/>
			                        		<input type="hidden" name="sty-tel0" class="sty-tel0" />
			                        	</label>
			                        </div>
			                    </div>
		                    </div>
		                    <!-- CHECK MEAL INFO -->          
							<div class="meal-op">
								<h4>
									<span class="impor">*</span>
									<span class="title-text">Select breakfast option</span>
								</h4>
									<div class="col-lg-4 order-md-last">
		                                <ul class="list-group mb-3">
		                           			<li class="ist-group-item d-flex justify-content-between lh-sm meal">
		                           				Adult: 20,000 won per person
		                           			</li>
		                           			<li class="ist-group-item d-flex justify-content-between lh-sm meal">
		                           				Children: 10,000 won per child
		                           			</li>
		                           		</ul>
	                           		</div>
		                        <div class="form-check">
		                        	<label> 
	                            		<input type="radio" class="form-check-input meal-bt meal_n" name="meal${cnt}" value="N" checked>No breakfast
	                            	</label>
	                           	</div>
	                           	<div class="form-check">
	                           		<label> 
	                           			<input type="radio" class="form-check-input meal-bt meal_y" name="meal${cnt}" value="Y">Add breakfast(Additional breakfast is charged according to the number of people.)
	                           		</label>
	                           	</div>			
	                       </div> 
                       </div>
                       </c:forEach>   
                       <input type="hidden" id="rsv_prc" name="rsv_prc" value="0" />
					   <hr class="my-4">
                	</form> 
				</div>
				
				<!-- Reservation Details INFO -->
                <div class="col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="title-text">Reservation Details</span>
                    </h4>
	                    <ul class="list-group mb-3">
	   	                	<li class="list-group-item d-flex justify-content-between lh-sm">
	                    		<table class="revs-detail-tb">
	                    			<tr>
	                    				<td>Check-In :</td>
	                    				<td>
	                    					${fn:substring(param.rsv_in_dt, 0, 4)}
	                           			   /${fn:substring(param.rsv_in_dt, 4, 6)}
	                          			   /${fn:substring(param.rsv_in_dt, 6, 8)}
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<td>Check-Out :</td>
	                    				<td>
	                    					${fn:substring(param.rsv_out_dt, 0, 4)}
	                           			   /${fn:substring(param.rsv_out_dt, 4, 6)}
	                          			   /${fn:substring(param.rsv_out_dt, 6, 8)}	                    				
	                    				</td>
	                    			</tr>
	                			    <tr>
	                    				<td>Rooms :</td>
	                    				<td>${param.room_cnt} Rooms</td>
	                    			</tr>
               				        <tr>
	                    				<td>Breakfast :</td>
	                    				<td id="meal_st">No Breakfast</td>
	                    			</tr>               			
	                    		</table>
	                    	</li>
	                    	<li class="list-group-item d-flex justify-content-between lh-sm">
			                	<table class="revs-detail-tb">
	                			    <tr>
	                    				<c:set var="r_prc" value="${param.BSIC_PRC}" />
										<c:set var="cnt" value="${param.room_cnt}" />
										<c:set var="amt_prc" value="${r_prc * cnt}" />	                			    
	                    				<td>Amount :</td>
	                    				<td class="amount" id="amountDisplay">
	                    					<fmt:formatNumber value="${amt_prc}" pattern="#,###" />
	                    					<script>
	                    						var amt_prc = ${amt_prc};
	                    					</script>
	                    				</td>
	                    			</tr>                    			
	                    		</table>
	                    	</li>
                   		</ul>
    	            <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="title-text">Room Details</span>
                    </h4>
                    <ul class="list-group mb-3">
						<c:forEach  var="cnt" begin="1" end="${param.room_cnt}">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<table class="revs-detail-tb">
                    			<tr>
                    				<td colspan="2" style="font-size: 20px; font-weight: bold;">Room ${cnt}</td>
                    			</tr>
                    			<tr>
                    				<td >Room Type :</td>
                    				<td>${param.ROOM_NM}</td>
                    			</tr>
                			    <tr>
                    				<td>Guests :</td>
                    				<td>${param.adlt_num} Adult</td>
                    			</tr>
                    			<tr>
                    				<td></td>
                    				<td>${param.chld_num} Children</td>
                    			</tr>     
                			    <tr>
                    				<td>Room Rate :</td>
                    				<td class="amount">
                    					<fmt:formatNumber value="${param.BSIC_PRC}" pattern="#,###" /> 
                    				</td>
                    			</tr>                  			
                    		</table>
						</li>
						</c:forEach>	
                	</ul>
                	<div class="container">
				    	<button type="button" class="btn btn-secondary pre-bt" id="pre_bt" style="border: 1px solid #dfa974; color: #dfa974; background-color: #fff;">Previous</button>
					    <button type="button" class="btn btn-secondary com-bt" id="resv-bt" style="border: 1px solid #dfa974; background: #dfa974;">Complete reservation</button>
				   </div>
            	</div>
            </div>
		</div>
	    <div class="" style="height: 200px;">
	    </div>    
    </section>

</body>
</html>
