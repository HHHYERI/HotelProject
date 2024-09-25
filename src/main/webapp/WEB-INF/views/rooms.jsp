<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.room-img{
			width:300px;
			height: 300px;
		}
	</style>
	<script src="./resources/js/rooms.js"  type="text/javascript"></script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Our Rooms</h2>
                        <div class="bt-option">
                            <a href="/home.jsp">Home</a>
                            <span>Rooms</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    
    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container" id="cont_roomList">
            <div class="row row-roomList">
                <div class="col-xl-7 col-lg-6 d-imgList">
                	<!--<img src="./resources/img/room/room-details.jpg" alt="No Image">-->
                </div>
                <div class="col-xl-5 col-lg-6">
	               	<div class="room-details-item">                     
	                    <div class="rd-text">
	                        <div class="rd-title">
	                            <h3 class="d-roomList">Standard</h3>
	                        </div>
	                        <table>
	                            <tbody>
	                                <tr>
	                                    <td class="r-o">Room Size(㎡):</td>
	                                    <td class="d-roomList">30 ㎡ ~ 30 ㎡</td>
	                                </tr>
	                                <tr>
	                                    <td class="r-o">Capacity:</td>
	                                    <td class="d-roomList">Max 5</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>    
                </div>    
                <div class="room-details-explanation">
                    <p class="f-para d-roomList">Motorhome or Trailer that is the question for you. Here are some of the
                        advantages and disadvantages of both, so you will be confident when purchasing an RV.
                        When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth
                        wheeler? The advantages and disadvantages of both are studied so that you can make your
                        choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an
                        achievement of a lifetime. It can be similar to sojourning with your residence as you
                        search the various sites of our great land, America.</p>
                </div>
			</div>
		</div> 		
		
	</section>
</body>

</html>