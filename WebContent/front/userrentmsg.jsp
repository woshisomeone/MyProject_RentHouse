<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>For Rent</title>
</head>
<body>
<%@ include file="menu.txt"%>
<!---banner--->
<div class="banner-section">
    <div class="container">
        <h2>个人租房</h2>
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
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                                    <c:forEach items="${renthouses}" var="housesmap">
                                        <div class="forsale-grids">
                                            <h4><a href="${pageContext.request.contextPath}/front/rentmsg?house_id=${housesmap.key.house_id}&rent_time=${housesmap.value}">${housesmap.key.house_name}</a></h4>
                                            <div class="forsale1">
                                                <div class="forsale-left">
                                                    <a href="#"><img src="images/p6.jpg" class="img-responsive" alt="/"></a>
                                                </div>
                                                <div class="forsale-right">
                                                    <h5><label>￥</label> ${housesmap.key.house_rent} Per Month - <span>${housesmap.key.house_type}</span></h5>
                                                    <p>${housesmap.key.house_desc}</p>
                                                    <a href="${pageContext.request.contextPath}/front/rentmsg?house_id=${housesmap.key.house_id}&rent_time=${housesmap.value}"class="button4">more details</a>
                                                </div>
                                                <div class="clearfix"></div>
                                                <ul>
                                                    <li><span> ${housesmap.key.house_area} </span>m<sup>2</sup></li>
                                                    <li><span> ${housesmap.key.house_province} </span></li>
                                                    <li><span> ${housesmap.key.house_city} </span></li>
                                                    <li><span> ${housesmap.key.house_detailaddr} </span></li>
                                                    <li><span> ${housesmap.value} </span>定租</li>
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