<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
</head>
<style>
input{
 display: inline;
    color: #777;
    border: none;
    width: 60%;
    outline: none;
    font-size: 1em;
    padding: 1em 1em;
    border-bottom: 1px solid #BBB;
    background: transparent;
}
</style>
<body>
<%@ include file="menu.txt"%>
		<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>信息</h2>
			</div>
		</div>
		<!---banner--->
		<div class="content">
			<div class="properties-section">
				<div class="container">
				<div class="properties-grids">
					<div class="col-md-9 properties-left">
							<div class="additional-details">
							<h3>用户信息</h3>
							<form action="${pageContext.request.contextPath }/modifyUserInfo" name="userinfo" method="post">
							<ul>
								<li><span>用户名</span> <input type="text"  placeholder="" name="user_name" value=${userinfo.user_name }></li>
								<li><span>密 &nbsp; &nbsp;码</span>	<input type="text"  placeholder="" name="user_pwd" value=${userinfo.user_pwd }></li>
								<li><span>电 &nbsp; &nbsp; 话</span><input type="text"  placeholder="" name="user_phone" value=${userinfo.user_phone }></li>
							</ul>
							<br>
							<input type=submit value="修改信息" class="btn btn-info col-xs-2" style="margin-right:20px" >
							</form>
						</div>
						
						<br><br><hr>
						<a href="${pageContext.request.contextPath }/front/houseList?method=showOwn">查看房源信息</a>
						<a href="${pageContext.request.contextPath }/front/userRented">查看租房信息</a>
						
							
					<div class="clearfix"></div>
					
				<!-- 	<p style="margin-top:20px">上传房屋图片：</p>
					<div class="flexslider">
							<ul class="slides">
								<li data-thumb="images/d11.jpg">
									<div class="thumb-image"> <img src="images/d1.jpg" data-imagezoom="true" class="img-responsive"> </div>
								</li>
								<li data-thumb="images/d12.jpg">
									 <div class="thumb-image"> <img src="images/d2.jpg" data-imagezoom="true" class="img-responsive"> </div>
								</li>
								<li data-thumb="images/d13.jpg">
										<div class="thumb-image"> <img src="images/d3.jpg" data-imagezoom="true" class="img-responsive"> </div>
								</li>
								<li data-thumb="images/d14.jpg">
									   <div class="thumb-image"> <img src="images/d4.jpg" data-imagezoom="true" class="img-responsive"> </div>
								</li>
							</ul>
						</div> -->
				
					</div>
					<div class="col-md-3 properties-right">
						<div class="properties-top">
							<h4>Find Your Place</h4>
							<div class="yourplace">
								<h5>all location</h5>
								<select class="sel2">
									<option value="">All Locations</option>
									<option value="">New Jersey</option>
									<option value="">New York</option>
									<option value="">Australia</option>
									<option value="">Canada</option>
									<option value="">India</option>
								</select>
							</div>
							<div class="yourplace">
								<h5>all sub location</h5>
								<select class="sel2">
									<option value="">All Locations</option>
									<option value="">New Jersey</option>
									<option value="">New York</option>
									<option value="">Australia</option>
									<option value="">Canada</option>
									<option value="">India</option>
								</select>
							</div>
							<div class="yourplace">
								<h5>Property Status</h5>
								<select class="sel2">
									<option value="">All status</option>
									<option value="">none</option>
									<option value="">open house</option>
									<option value="">rent</option>
									<option value="">sale</option>
								</select>
							</div>
							<div class="yourplace">
								<h5>Property Type</h5>
								<select class="sel2">
									<option value="">All Type</option>
									<option value="">Commercial</option>
									<option value="">- Office</option>
									<option value="">- Buy</option>
									<option value="">Residential</option>
									<option value="">-Apartment</option>
								</select>
							</div>
							<div class="yourplace-grids">
								<div class="col-md-6 yourplace-grid">
									<h5>Min Beds</h5>
									<select class="sel3">
										<option value="">any</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
										<option value="">5</option>
									</select>
								</div>
								<div class="col-md-6 yourplace-grid">
									<h5>Min Baths</h5>
									<select class="sel3">
										<option value="">any</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
										<option value="">5</option>
									</select>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="yourplace-grids1">
								<div class="col-md-6 yourplace-grid">
									<h5>Min Price</h5>
									<select class="sel3">
										<option value="">any</option>
										<option value="">$500</option>
										<option value="">$1000</option>
										<option value="">$2000</option>
										<option value="">$3000</option>
										<option value="">$4000</option>
										<option value="">$5000</option>
										<option value="">$75000</option>
										<option value="">$10000</option>
									</select>
								</div>
								<div class="col-md-6 yourplace-grid">
									<h5>Max Price</h5>
									<select class="sel3">
										<option value="">any</option>
										<option value="">$1000</option>
										<option value="">$2000</option>
										<option value="">$3000</option>
										<option value="">$4000</option>
										<option value="">$5000</option>
										<option value="">$75000</option>
										<option value="">$10000</option>
									</select>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="search1">
							<form>
								<input type="submit" value="Search">
							</form>
							</div>
						</div>
						<div class="properties-middle">
						<h4>Mortgage Calculator</h4>
						<form>
							<span>Total Amount</span>
							<input type="text" placeholder="$">
							<span>Down Payment</span>
							<input type="text" placeholder="$">
							<span>Interest Rate</span>
							<input type="text" placeholder="%">
							<span>Amortization Period</span>
							<input type="text" placeholder="Year">
							<span>Payment Period</span>
							<select class="sel1">
								<option value="">Monthly</option>
								<option value="">Bi-Weekly</option>
								<option value="">Weekly</option>
							</select>
							<input type="submit" value="calculate">
							</form>
						</div>
						
					</div>
					<div class="clearfix"></div>
				</div>
				</div>
			</div>
		</div>
	<%@ include file="footer.txt" %>
</body>

</html>