<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<script src="./resources/js/home.js"  type="text/javascript"></script>
</head>
<body>
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="hero-text">
                        <h1>Sona A Luxury Hotel</h1>
                        <p>Here are the best hotel booking sites, including recommendations for international
                            travel and for finding low-priced hotel rooms.</p>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5 offset-xl-2 offset-lg-1">
                    <div class="booking-form" style="margin-top: 100px">
                        <h3>Booking Your Hotel</h3>
                        <form>
                            <div class="check-date">
                                <label for="date-in">Check In:</label>
                                <input type="text" class="date-input" id="date_in">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out">Check Out:</label>
                                <input type="text" class="date-input" id="date_out">
                                <i class="icon_calendar"></i>
                            </div>
                           	<!--  <div class="select-option">
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
                            -->
                            <button type="button" id="btn_search">Check Availability</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero-slider owl-carousel">
            <div class="hs-item set-bg" data-setbg="./resources/img/hero/hero-1.jpg"></div>
            <div class="hs-item set-bg" data-setbg="./resources/img/hero/hero-2.jpg"></div>
            <div class="hs-item set-bg" data-setbg="./resources/img/hero/hero-3.jpg"></div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Hotel Gallery</span>
                        <h2>Our Rooms</h2>	
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="blog-item set-bg" data-setbg="./resources/img/room/STD_SGL.png">
                        <div class="bi-text">
                            <h4><a href="/Hotel/rooms">Standard Single</a></h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog-item set-bg" data-setbg="./resources/img/room/DLX_TWN.jpg">
                        <div class="bi-text">
                            <h4><a href="/Hotel/rooms">Deluxe Twin</a></h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog-item set-bg" data-setbg="./resources/img/room/LUX_DBL.png">
                        <div class="bi-text">
                            <h4><a href="/Hotel/rooms">Luxury Double</a></h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="blog-item small-size set-bg" data-setbg="./resources/img/room/LUX_TWN.jpg">
                        <div class="bi-text">
                            <h4><a href="/Hotel/rooms">Luxury Twin</a></h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog-item small-size set-bg" data-setbg="./resources/img/room/SUT_FML.png">
                        <div class="bi-text">
                            <h4><a href=	"/Hotel/rooms">Suite Family</a></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

</body>
</html>