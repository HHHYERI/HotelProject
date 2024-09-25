<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.resv-detail{
		width: 100%;
	}
	.detail-title{
		width: 20%;
	}
	.gst-memo{
		height: 100px;
	}
	.title{
		margin: 20px 0px 10px;
	
	}
	.resv-st-num {
	padding: 50px;
	padding-bottom: 10px;
	align-items: center;
}

</style>
<script src="./resources/js/resv_gst_page.js"  type="text/javascript">
</script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <c:forEach var="reservation" items="${reservation}">
    	<c:set var="totalPrice" value="${totalPrice + reservation.rsv_prc}" />
	</c:forEach>
    <c:forEach var="reservation" items="${reservation}" varStatus="status">
    <c:if  test="${status.index == 0}">
	    <div class="resv-st-num">
	        <div class="container">
	            <div class="row">
	               	<h2>
	               	<c:if test="${reservation.rsv_st eq '00'}">
	               	    <script>
	        				var find_rsv_cd = "${reservation.rsv_cd}";
	    				</script>
	               		<span style="color: green;">
							Reservation number ${reservation.rsv_cd} has been reserved.
						</span>
					</c:if>
	               	<c:if test="${reservation.rsv_st eq'04'}">
	               		<span style="color: red;">
							Reservation number ${reservation.rsv_cd} has been cancelled.
						</span>
					</c:if> 
					</h2>
	            </div>
	        </div>
	    </div>
    <!-- Breadcrumb Section End -->

    	<div class="container">
	        <div class="row">
                <div class="col-lg-12 title">
             		<h2>Reservation detail</h2>
                </div>   
	            <div class="resv-detail">
	                <table class="table table-bordered">
	                    <tr>
	                        <th class="detail-title">Reservation E-mail</th>
	                        <td>${reservation.rsv_mail_addr}</td>
	                    </tr>	                
	                    <tr>
	                        <th class="detail-title">Reserve date</th>
	                        <td>${reservation.rsv_reg_dtm}</td>
	                    </tr>
	                    <tr>
	                        <th class="detail-title">Name</th>
	                        <td>${reservation.rsv_cus_nm} </td>
	                    </tr>
	                    <tr>
	                        <th class="detail-title">Phone number</th>
	                        <td>${fn:substring(reservation.rsv_phon_num, 0, 3)}
	                           -${fn:substring(reservation.rsv_phon_num, 3, 7)}
	                           -${fn:substring(reservation.rsv_phon_num, 7, 10)}</td>
	                    </tr>                 
	                    <tr>
	                        <th class="detail-title">Check-in date</th>
	                        <td>${fn:substring(reservation.rsv_in_dt, 0, 4)}
	                           /${fn:substring(reservation.rsv_in_dt, 4, 6)}
	                           /${fn:substring(reservation.rsv_in_dt, 6, 8)}</td>
	                    </tr>
	                    <tr>
	                        <th class="detail-title">Check-out date</th>
	                        <td>${fn:substring(reservation.rsv_out_dt, 0, 4)}
	                           /${fn:substring(reservation.rsv_out_dt, 4, 6)}
	                           /${fn:substring(reservation.rsv_out_dt, 6, 8)}</td>	                        
	                    </tr>
	                    <tr>
	                        <th class="detail-title">Check-in time </th>
	                        <td>${reservation.rsv_in_tm}</td>
	                    </tr>	                    
	                    <tr>	                    
	                    <tr>
	                        <th class="detail-title">Total Amount</th>
	                        <td><fmt:formatNumber value="${totalPrice}" pattern="#,###" /> </td>
	                    </tr>
	                    <tr>
	                        <th class="detail-title">Inquiry or message<p style="color: red;">*You can change message.</p></th>
	                        <td class="gst-memo">
	                        <form>
	                        	<textarea class="form-control" id="gMemo" name="gMemo" style="text-align: left; resize: none;">${reservation.cus_memo}</textarea>
	                        </form>
                        	</td>
	                    </tr>
	                </table>    
	            </div>
        	</div> 
       	</div>
	</c:if>
		<div class="container">
		    <div class="row">	     
                <div class="col-lg-12 title">
             		<h4>Room ${status.index + 1} </h4>
                </div>
		        <div class="resv-detail">
	                <table class="table table-bordered">
	                    <tr>
	                        <th class="detail-title">Room Type</th>
	                        <td>${reservation.room_nm}</td>
	                    </tr>		                
	                    <tr>
	                        <th class="detail-title">Stay guest's name</th>
	                        <td>${reservation.sty_cus_nm}</td>
	                    </tr>
	                    <tr>
	                        <th class="detail-title">Stay guest's phone number</th>
	                        <td>${fn:substring(reservation.sty_phon_num, 0, 3)}
	                           -${fn:substring(reservation.sty_phon_num, 3, 7)}
	                           -${fn:substring(reservation.sty_phon_num, 7, 10)}</td>	                        
	                    </tr>	   	                
	                    <tr>
	                        <th class="detail-title">Guests of adult </th>
	                        <td>${reservation.adlt_num}</td>
	                    </tr>
	                    <tr>
	                        <th class="detail-title">Guests of children </th>
	                        <td>${reservation.chld_num}</td>
	                    </tr>	
	                    <tr>
	                        <th class="detail-title">Breakfast option</th>
	                        <td>
	                        	<c:if test="${reservation.meal_yn == 'Y'}">
        							Add Breakfast
    							</c:if>
	                        	<c:if test="${reservation.meal_yn == 'N'}">
        							NO Breakfast
    							</c:if>    							
    						</td>
	                    </tr> 
	                    <tr>
	                        <th class="detail-title">Amount</th>
	                        <td><fmt:formatNumber value="${reservation.rsv_prc}" pattern="#,###" /> </td>
	                    </tr>	                                                              	                                        	                    
                    </table>    
		        </div>
	        </div>
	         
	        <c:if test="${reservation.rsv_st eq '00' and status.last}">
		        <div class="inner" style="text-align: center; margin: 20px;">
		            <button type="button" id="change" class="btn btn-secondary" style="border: 1px solid #dfa974; color: #dfa974; background-color: #fff; margin: 20px; width:200px;"> Change detail</button>
		            <button type="button" onclick = "cancel()" id="cancel" class="btn btn-secondary" style="border: 1px solid #dfa974; background: #dfa974; margin: 20px; width:200px;"> Cancel reservation</button>
		        </div>
			</c:if> 
	        <c:if test="${reservation.rsv_st eq '04' and status.last}">
		        <div ></div>
			</c:if> 			
        </div>
	    	
	</c:forEach>
	<div style="height: 100px;">
	</div>
</body>
</html>