<%@ page import="java.util.List" %>
<%@ page import="com.zugo.domain.House" %>
<%@ page import="com.zugo.domain.PageBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>For Rent</title>
	<script type="text/javascript" src="js/ajax.js"></script>
 	<script type="text/javascript">
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
            city.options.length=1;
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
            }
        }
	</script>
</head>
<body>
<%@ include file="menu.txt"%>
		<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>租房</h2>
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
								<%--<ul id="myTab" class="nav nav-tabs left-tab" role="tablist">
									<li onclick="page(4)" role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true"><img src="images/menu1.png"></a></li>
									<li onclick="page(12)" role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile"><img src="images/menu.png"></a></li>
								</ul>--%>
								<div id="myTabContent" class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                                        <c:forEach var="housemap" items="${houseMap}">
                                            <div class="forsale-grids">
                                                <h4><a href="${pageContext.request.contextPath}/front/token?houseId=${housemap.key.house_id}">${housemap.key.house_name}</a></h4>
                                                <div class="forsale1">
                                                    <div class="forsale-left">
                                                        <img src="/zugo/housepic/${housemap.value[0].pic_path}"  width="240px" height="120px"/>
                                                    </div>
                                                    <div class="forsale-right">
                                                        <h5><label>￥</label> ${housemap.key.house_rent} Per Month - <span>${housemap.key.house_type}</span></h5>
                                                        <p>${housemap.key.house_desc}</p>
                                                        <a href="${pageContext.request.contextPath}/front/token?houseId=${housemap.key.house_id}"class="button4">查看</a>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <ul>
                                                        <li><span> ${housemap.key.house_area} </span>m<sup>2</sup></li>
                                                        <li><span> ${housemap.key.house_province} </span></li>
                                                        <li><span> ${housemap.key.house_city} </span></li>
                                                        <li><span> ${housemap.key.house_detailaddr} </span></li>
                                                        <li><span> ${housemap.key.publish_time} </span>发布</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:forEach>
									</div>
									<ul class="pager">
										<li class="previous"><a href="${pageContext.request.contextPath}/front/jump?currentPage=${pb.currentPage==1?1:pb.currentPage-1}">&larr; 上一页</a></li>
										<span>第${pb.currentPage}页/共${pb.totalPage}页</span>
										<li class="next"><a href="${pageContext.request.contextPath}/front/jump?currentPage=${pb.currentPage==pb.totalPage?pb.totalPage:pb.currentPage+1}">下一页 &rarr;</a> </li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 properties-right">
						<form  method="post" action="${pageContext.request.contextPath}/front/search">
							<div class="properties-top">
								<h4>你想要的，这都有~</h4>
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
							<h4>推荐好房</h4>
							<c:forEach items="${randHouse}" var="randhouse">
								<div class="feature-top">
									<a href="${pageContext.request.contextPath}/front/token?houseId=${randhouse.key.house_id}"><img src="/zugo/housepic/${randhouse.value[0].pic_path}" class="img-responsive" alt="/"></a>
									<h5>${randhouse.key.house_name}</h5>
									<p>${randhouse.key.house_province} ${randhouse.key.house_city} ${randhouse.key.house_detailaddr}</p>
								</div>
							</c:forEach>
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