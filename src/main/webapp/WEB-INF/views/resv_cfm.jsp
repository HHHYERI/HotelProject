<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Reservation confirmation</title>
<style type="text/css">


	.check-form {
		padding: 30px;
	}
	.box {
		width: 50%;
		margin: auto;
	}
	
</style>
<script src="./resources/js/resv_cfm.js"  type="text/javascript"></script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h3>If you want confirm reservation, </h3>
                        <h3>Enter E-Mail Address and Reservation number</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
                     
    <section class="mail-resv-check-section">
    	<div class="container  inner">
    		<div class="box">
	    		<form action="/Hotel/resv-gst-page" class="check-form" id="findResv">
				  <!-- Email input -->
				  <div data-mdb-input-init class="form-outline mb-4">
				  	<label class="form-label" for="resvEmail">Email address</label>
				    <input type="email" id="resvEmail" name="resvEmail" class="form-control" />
				  </div>
				
				  <!-- resv number input -->
				  <div data-mdb-input-init class="form-outline mb-4">
				  	<label class="form-label" for="resvNumber">Reservation number</label>
				    <input type="text" id="resvNumber" name="resvNumber" class="form-control" />
				  </div>
				
				  <!-- Submit button -->
				  <button type="submit" class="btn btn-primary btn-block mb-4" style="border: 1px solid #dfa974; background: #dfa974;">Check reservation</button>
				</form>
			</div>
    	</div>
    </section>                
	<div style="height: 100px;">
	
	</div>
</body>
</html>