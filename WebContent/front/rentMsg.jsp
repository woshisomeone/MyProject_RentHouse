<%--
  Created by IntelliJ IDEA.
  User: skylin
  Date: 18-7-29
  Time: 下午10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.zugo.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%
    User user=(User)request.getSession().getAttribute("user");
    String user_name="";
    if (user!=null){
        user_name=user.getUser_name();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Single</title>
    <%@ include file="menu.txt"%>
    <style type="text/css">
        .carousel-inner img{
            width: 100%;
        }
        .carousel-indicators li .active{
            background-color: white;
        }
    </style>
</head>
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
								<h3>${house.house_name}</h3>
								<p>发布时间:${house.publish_time} <a href="#">房屋编号:${house.user_id}</a> 房屋面积: ${house.house_area}m<sup>2</sup>  &nbsp;&nbsp;租金:<b>￥${house.house_rent} /月</b></p>
								<a href="single.jsp"><img src="images/b1.jpg" class="img-responsive" alt=""/></a>
								<p>这座房子位于 ${house.house_province} ${house.house_city} ${house.house_detailaddr},${house.house_desc}</p>
							</div>
                    <div class="history">
                        <h4>更多图片</h4>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- 轮播（Carousel）指标 -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>
                            <!-- 轮播（Carousel）项目 -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="images/d1.jpg">
                                </div>
                                <div class="item">
                                    <img src="images/d2.jpg">
                                </div>
                                <div class="item">
                                    <img src="images/d3.jpg">
                                </div>
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
                    <div class="clearfix"></div>
                    <div class="coment-form">
								<div class="container">
		<p class="popover-options">
		<a type="button" class="btn btn-default" title="租购"  onclick="show()"
		   data-container="body" data-toggle="popover" data-content=" <p id='user_info'></p>">联系房主~</a>
	</p>
								</div>
							</div>
                </div>
                <div class="col-md-3 blog-grid1">
                  
                    <div class="feature" style="position: relative;top:-55px">
                        <h4>Featured Properties</h4>
                        <div class="feature-top">
                            <img src="images/s4.jpg" class="img-responsive" alt="/">
                            <h5>60 Merrick Way, Miami</h5>
                            <p>Lorem ipsum dolor sit amet, consectetuer  elit,â¦ <a href="#">Know More</a></p>
                        </div>
                        <div class="feature-top top2">
                            <img src="images/s3.jpg" class="img-responsive" alt="/">
                            <h5>Villa in Hialeah, Dade</h5>
                            <p>Lorem ipsum dolor sit amet, consectetuer  elit,â¦ <a href="#">Know More</a></p>
                        </div>
                        <div class="feature-top top2">
                            <img src="images/s5.jpg" class="img-responsive" alt="/">
                            <h5>Villa in Hialeah, Dade</h5>
                            <p>Lorem ipsum dolor sit amet, consectetuer  elit,â¦ <a href="#">Know More</a></p>
                        </div>
                        <div class="feature-top top2">
                            <img src="images/s6.jpg" class="img-responsive" alt="/">
                            <h5>60 Merrick Way, Miami</h5>
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
<script type="text/javascript">
$(function () {
	$(".popover-options a").popover({html : true });
 });
 function show(){
	$.ajax({
	type:"get",
	url:"${pageContext.request.contextPath}/front/showUserInfo?method=showByHouse",
	data:"user_id=${house.user_id}",
	success:function(msg){
		arr=msg.split(',');
		$("#user_info").html(arr[0]+":"+arr[1]);
	},
	error:function(msg){
	}
	});
}

</script>
</html>

