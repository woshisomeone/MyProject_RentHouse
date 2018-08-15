<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房源列表</title>
</head><%@ include file="menu.txt"%>
<!-- <script type="text/javascript">
        window.onload=function () {
            $("#province").val("");
            $("#city").val("");
        }
        function area() {
            var province=document.getElementById("province").value;
            var city=document.getElementById("city");
            var map={
                "guangdong":["广州市","深圳市","惠州市"],
                "fujian":["厦门市","福州市","泉州市"]
            };
            city.options.length=0;
            switch (province){
                case "广东省":
                    for (var i=0;i<map.guangdong.length;i++){
                        city.add(new Option(map.guangdong[i]));
                    }
                    break;
                case "福建省":
                    for (var j=0;j<map.fujian.length;j++){
                        city.add(new Option(map.fujian[j]));
                    }
                    break;
                default:
                    city.add(new Option("全省","city"));

            }
        }
	</script> -->
<body>

		<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>房源列表</h2>
			</div>
		</div>
		<!---banner--->
		<div class="content">
			<div class="properties-section">
				<div class="container">
				<div class="properties-grids">
					<div class="col-md-9 forsales-left">
						<div class="forsale">
							<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
								<ul id="myTab" class="nav nav-tabs left-tab" role="tablist">
									<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true"><img src="images/menu1.png"></a></li>
								</ul>
								<div id="myTabContent" class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                                        <c:forEach varStatus="status" var="house" items="${houses}">
                                            <div class="forsale-grids">
                                                <h4><a href="#">${house.house_name}</a></h4>
                                                <div class="forsale1">
                                                    <div class="forsale-left">
                                                        <a href="#"><img src="/zugo/housepic/${house.pic_path}" class="img-responsive" alt="/"></a>
                                                    </div>
                                                    <div class="forsale-right">
                                                        <h5><label>￥</label> ${house.house_rent} Per Month - <span>${house.house_type}</span></h5>
                                                        <p>${house.house_desc}</p>
                                                        <a  href="${pageContext.request.contextPath}/front/token?houseId=${house.house_id}&user_phone=${user_phone}" class="button4" style="color:blue">了解更多</a>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <ul>
                                                        <li><span> ${house.house_area} </span>m<sup>2</sup></li>
                                                        <li><span> ${house.house_province} </span></li>
                                                        <li><span> ${house.house_city} </span></li>
                                                        <li><span> ${house.house_detailaddr} </span></li>
                                                        <li><span> ${house.publish_time} </span>发布</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 properties-right">
						<form  method="post" action="${pageContext.request.contextPath}/front/search">
							<div class="properties-top">
								<h4>Find Your house</h4>
								<div class="yourplace">
									<h5>省</h5>
									<select class="sel" id="province" name="province" onchange="area()">
										<option value="" selected>全国</option>
										<option value="广东省">广东省</option>
										<option value="福建省">福建省</option>
									</select>
								</div><br>
								<div class="yourplace">
									<h5>市</h5>
									<select class="sel" id="city" name="city">
										<option value="" selected>全省</option>
									</select>
								</div><br>
								<div class="yourplace">
									<h5>房型</h5>
									<select class="sel" name="type">
										<option value="" selected>所有房型</option>
										<option value="四室">四室</option>
										<option value="三室">三室</option>
										<option value="两室">两室</option>
										<option value="一室一厅">一室一厅</option>
										<option value="单间独卫">单间独卫</option>
									</select>
								</div><br>
								<div class="yourplace">
									<h5>最高价(￥/mon)</h5>
									<select class="sel" name="rent">
										<option value="" selected>不限</option>
										<option value="1000">1000</option>
										<option value="2000">2000</option>
										<option value="3000">3000</option>
										<option value="4000">4000</option>
										<option value="5000">5000</option>
									</select>
								</div>
								<div class="search1">
									<input type="submit" value="Search">
								</div><br>
							</div>
						</form>
						<div class="feature">
							<h4>Featured Properties</h4>
							<div class="feature-top">
							<img src="images/s6.jpg" class="img-responsive" alt="/">
									<h5>60 Merrick Way, Miami</h5>
									<p>Lorem ipsum dolor sit amet, consectetuer  elit,â¦ <a href="#">Know More</a></p>
							</div>
							<div class="feature-top top2">
							<img src="images/s7.jpg" class="img-responsive" alt="/">
									<h5>Villa in Hialeah, Dade</h5>
									<p>Lorem ipsum dolor sit amet, consectetuer  elit,â¦ <a href="#">Know More</a></p>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				</div>
			</div>
		</div>
			<%@ include file="footer.txt"%>
</body>
</html>
