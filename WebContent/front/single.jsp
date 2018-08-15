<%@ page import="com.zugo.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Single</title>
    <%@ include file="menu.txt"%>
    <link rel="stylesheet" href="css/swipebox.css">
</head>
<!-- pop-up -->
<script src="js/jquery.swipebox.min.js"></script> 
    <script type="text/javascript">
		jQuery(function($) {
			$(".swipebox").swipebox();
		});
	</script>
<!-- pop-up -->
<style type="text/css">

.col-md-6{
width:100%;
}
.gallery-grid2:hover span.rollover1{
width:100%;
height:100%;
}
</style>
<body>
<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>详细信息</h2>
			</div>
		</div>
		<!---banner--->
		<div class="content">
			<div class="blog-section">
				<div class="container">
					<div class="blog-grids">
						<div class="col-md-9 blog-grid">
							<div class="blog">
								<h3 style="float:left">${house.house_name} </h3>
							<p style="float:right">发布时间:${house.publish_time}</p>
							<div class="clearfix"></div>
							<p>房屋面积: <b>${house.house_area}m<sup>2</sup></b>  &nbsp;&nbsp;租金:<b>￥${house.house_rent} /月</b></p>
						<%-- 	<a href="single.jsp"><img src="/zugo/housepic/${housePics[0].pic_path}" class="img-thumbnail img-responsive center-block"  width="400px" height="350px"></a> --%>
								<p>省：<b>${house.house_province}</b>  市：<b>${house.house_city}  </b>具体位置：<b>${house.house_detailaddr}</b></p>
								<p>房主描述：${house.house_desc}</p>
							</div>
							<div class="history">
								<br>
								<div id="myCarousel" class="carousel slide" data-ride="carousel">
									<!-- 轮播（Carousel）指标 -->
									<ol class="carousel-indicators">
										<c:forEach varStatus="h" items="${housePics}" var="housepic">
											<li data-target="#myCarousel" data-slide-to="${h.index}"></li>
										</c:forEach>
									</ol>
									<!-- 轮播（Carousel）项目 -->
									<div class="carousel-inner gallery-grids">
										<c:forEach varStatus="h" items="${housePics}" var="housepic">
											<div class=" col-md-6 gallery-grid2 item">
												<a href="/zugo/housepic/${housepic.pic_path}"  class="swipebox"><span class="rollover1"> </span></a>
												<img src="/zugo/housepic/${housepic.pic_path}" >
											</div>
										</c:forEach>
									</div>
									<!-- 轮播（Carousel）导航 -->
									<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
										<span class="icon-prev" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a>
									<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
										<span class="icon-next" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
							<center><p>房屋图片</p></center>
							<div class="clearfix"></div>
							<!---RESPONSES--->
							<div class="coment-form">
								<div class="container">
								<p class="popover-options">
							<a type="button" class="btn btn-default" title="租购"  onclick="show()"
		  				 data-container="body" data-toggle="popover" data-content=" <p id='user_info'></p>">联系房主~</a>
							</p>
									<form style="width:720px;text-align: center" method="post" action="${pageContext.request.contextPath}/front/addrent">
										<input type="hidden" name="house_id" value="${house.house_id}">
										<label ><input type="checkbox" value="Consent Agreement" id="checkbox" >同意我们的条款</label><br><br>
										<input style="width: 170px" type="button" value="租房" id="submit" onclick="con()" class="btn btn-info col-md-5 col-md-offset-5">
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-3 blog-grid1">
							<div class="feature" style="position: relative;top:-55px">
								<h4>推荐好房</h4>
								<c:forEach items="${housesWithPic}" var="houseWithPic">
									<div class="feature-top">
									<a href="${pageContext.request.contextPath}/front/token?houseId=${houseWithPic.key.house_id}">	<img src="/zugo/housepic/${houseWithPic.value[0].pic_path}" class="img-responsive" alt="/"></a>
											<h5>${houseWithPic.key.house_name}</h5>
											<p>${houseWithPic.key.house_province} ${houseWithPic.key.house_city} ${houseWithPic.key.house_detailaddr}</p>
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
<script type="text/javascript">
$(function () {
	$("ol li:first").addClass('active');
	$(".carousel-inner div:first").addClass('active');
});
function check() {
	var check=document.getElementById("checkbox");
	if (check.checked){
        document.getElementById("submit").removeAttribute("disabled");
	}else {
        document.getElementById("submit").setAttribute("disabled","disabled");
	}
}
    function check() {
		var check=document.getElementById("checkbox");
		if (check.checked){
            document.getElementById("submit").removeAttribute("disabled");
		}else {
			alert("请同意协议");
            document.getElementById("submit").setAttribute("disabled","disabled");
		}
    }
    function con() {
    	var check=document.getElementById("checkbox");
		if (check.checked){
			 if($("#show_name").text()!=""){
		            if(!confirm("确定要租这套房子吗？"))
		                return false;
		            else
		            	$("#submit").attr("type","submit");
		        }else {
		            document.getElementById("login").click();
		            return false;
		        }
		}else {
			alert("请同意协议");
		}
    }
    
    $(function () {
    	$(".popover-options a").popover({html : true });
     });
     function show(){
    	$.ajax({
    	type:"get",
    	url:"${pageContext.request.contextPath}/front/showUserInfo?method=showByHouse",
    	data:"user_id=${house.user_id}",
    	success:function(msg){
    		//alert("s");
    		arr=msg.split(',');
    		$("#user_info").text(arr[0]+":"+arr[1]);
    	},
    	});
    }
</script>
</html>
