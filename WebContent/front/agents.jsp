<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>推荐房主</title>
</head>
<body>
		<%@ include file="menu.txt"%>
		<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>推荐房主</h2>
			</div>
		</div>
		<!---banner--->
		<div class="content">
			<div class="agent-section">
				<div class="container">
				 <c:forEach varStatus="status" var="uwh" items="${userWithHouse}">
					<div class="agent-grids">
						<div class="col-md-6 agent-grid " style="margin-top:15px">
							<div class="agent-left"  >
								<img src="images/real1.jpg" class="img-responsive" alt="/" >
							</div>
							<div class="agent-right" style="height:255px">
								<h4>${uwh.user_name}</h4>
								<ul>
								<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>电话： ${uwh.user_phone}</li>
								<li>已租： ${uwh.rent_num}</li>
								<li>房屋总数：${uwh.house_num }</li>
								<li>租出比率:${uwh.rate}</li>
							</ul>
							<a href="${pageContext.request.contextPath }/front/houseList?method=showOther&user_id=${uwh.user_id}&user_phone=${uwh.user_phone}" class="button3 hvr-shutter-out-horizontal" style="height:30px;padding:4px">know more</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					</c:forEach>
					<div class="clearfix"></div> 
				</div>
			</div>
		</div>
<%@ include file="footer.txt"%>

</body>
</html>