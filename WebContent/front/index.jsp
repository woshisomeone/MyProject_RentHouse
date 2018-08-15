<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ include file="menu.txt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!---css--->
    <script src="js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: false,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
    <link href="css/owl.carousel.css" rel="stylesheet">
    <script src="js/owl.carousel.js"></script>
    <script>
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
        $(document).ready(function () {
            $("#owl-demo").owlCarousel({
                items: 1,
                lazyLoad: true,
                autoPlay: true,
                navigation: false,
                navigationText: false,
                pagination: true,
            });
        });
    </script>

</head>
<body>
<!---header--->

<!---header--->
<!---banner--->
<div class="slider">
    <div class="callbacks_container">
        <ul class="rslides" id="slider">
      <c:forEach items="${housesWithPic}" var="house">
        <div class="slid banner1">
      <div class="caption">
     <h3>${house.key.house_name} ${house.key.house_rent} /月 </h3> 
      <p>${house.key.house_desc}</p>
      <a href="${pageContext.request.contextPath}/front/token?houseId=${house.key.house_id}" class="button">查看更多</a>
      </div>
      </div>
            </c:forEach>
		</div>
            <!-- <div class="slid banner1">
                <div class="caption">
                    <h3>红木林 4室1厅 7500元</h3>
                    <p>年租优惠</p>
                    <a href="#" class="button">查看更多</a>
                </div>
            </div>
            <div class="slid banner2">
                <div class="caption">
                    <h3>国贸双井富力城A区,255平，随时看房</h3>
                    <p>此房空房，新刷的白墙，空间大，客厅三个落地窗，非常亮堂，拎包即住。</p>
                    <a href="#" class="button">查看更多</a>
                </div>
            </div>
            <div class="slid banner3">
                <div class="caption">
                    <h3>林肯公园两居室 交通方便 家具全齐</h3>
                    <p>年租优惠</p>
                    <a href="#" class="button">查看更多</a>
                </div> -
            </div>-->
        </ul>
    </div>
</div>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/">网页模板</a></div>
<!---banner--->
<div class="content">
    <div class="place-section">
        <div class="container">
            <h2>查找你想要的房子</h2>
            <form  method="post" action="${pageContext.request.contextPath}/front/search">
                <div class="place-grids">
                    <div class="col-md-3 place-grid">
                        <h5>省</h5>
                        <select class="sel" id="province" name="province" onchange="area()">
                            <option value="" selected>全国</option>
                            <option value="广东省">广东省</option>
                            <option value="福建省">福建省</option>
                        </select>
                    </div>
                    <div class="col-md-3 place-grid">
                        <h5>市</h5>
                        <select class="sel" id="city" name="city">
                            <option value="" selected>全省</option>
                        </select>
                    </div>
                    <div class="col-md-3 place-grid">
                        <h5>房型</h5>
                        <select class="sel" name="type">
                            <option value="" selected>所有房型</option>
                            <option value="四室">四室</option>
                            <option value="三室">三室</option>
                            <option value="两室">两室</option>
                            <option value="一室一厅">一室一厅</option>
                            <option value="单间独卫">单间独卫</option>
                        </select>
                    </div>
                    <div class="col-md-2 place-grid1">
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
                    <div class="clearfix"></div>
                </div>
                <div class="place-grids">
                    <div class="col-md-4 col-md-offset-3 search">
                        <input type="submit" value="搜索">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </form>
        </div>
    </div>
    <div class="friend-agent">
        <div class="container">
            <div class="friend-grids">
                <div class="col-md-4 friend-grid">
                    <img src="images/p.png">
                    <h4>房源广</h4>
                </div>
                <div class="col-md-4 friend-grid">
                    <img src="images/p1.png">
                    <h4>零中介</h4>
                </div>
                <div class="col-md-4 friend-grid">
                    <img src="images/p2.png">
                    <h4>安心租房</h4>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="offering">
        <div class="container">
            <h3>为你准备的精选好房</h3>
            <br>
            <c:forEach items="${housesWithPic}" var="house">
                <div class="col-md-6 offer-grid">
                    <div class="offer-grid1" id="randhouse">
                        <h4><a href="${pageContext.request.contextPath}/front/token?houseId=${house.key.house_id}">${house.key.house_name}</a></h4>
                        <div class="offer1">
                            <div class="offer-left col-md-3">
                                <img src="/zugo/housepic/${house.value[0].pic_path}"  class="img-responsive"  style="height:138px"/></a>
                            </div>
                            <div class="offer-right">
                                <h5><label>￥</label> ${house.key.house_rent} /月 - <span>${house.key.house_area}m<sup>2</sup></span></h5>
                                <p>${house.key.house_province} ${house.key.house_city} ${house.key.house_detailaddr}</p>
                                <a href="${pageContext.request.contextPath}/front/token?houseId=${house.key.house_id}" class="button1">查看</a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!---testimonials--->
    <div class="testimonials">
        <div class="container">
            <h3>优质房主</h3>
            <span></span>
            <div id="owl-demo" class="owl-carousel">
                <div class="item">
                    <div class="col-md-2 testmonial-img">
                        <img src="images/t1.png" class="img-responsive" alt=""/>
                    </div>
                    <div class="col-md-10 testmonial-text">
                        <p>Lorem ipsum dolor sit amet, offendit volutpat sea ex, at omnium scripta pro, at omnium
                            scripta pro, ei mea oratio malorum forensibus. ei mea oratio malorum forensibus. Sed ei
                            omnes laoreet posidonium ei mea oratio malorum forensibus.</p>
                        <h4><a href="#">Michael Feng</a></h4>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="item">
                    <div class="col-md-2 testmonial-img">
                        <img src="images/t2.png" class="img-responsive" alt=""/>
                    </div>
                    <div class="col-md-10 testmonial-text">
                        <p>Lorem ipsum dolor sit amet, offendit volutpat sea ex, at omnium scripta pro, at omnium
                            scripta pro, ei mea oratio malorum forensibus. ei mea oratio malorum forensibus. Sed ei
                            omnes laoreet posidonium ei mea oratio malorum forensibus.</p>
                        <h4><a href="#">Stacy Barron</a></h4>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="item">
                    <div class="col-md-2 testmonial-img">
                        <img src="images/t3.png" class="img-responsive" alt=""/>
                    </div>
                    <div class="col-md-10 testmonial-text">
                        <p>Lorem ipsum dolor sit amet, offendit volutpat sea ex, at omnium scripta pro, at omnium
                            scripta pro, ei mea oratio malorum forensibus. ei mea oratio malorum forensibus. Sed ei
                            omnes laoreet posidonium ei mea oratio malorum forensibus.</p>
                        <h4><a href="#">Johnson </a></h4>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <!---testmonials--->
</div>
<%@ include file="footer.txt" %>
</body>
</html>