<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Gallery</title>
<!-- pop-up -->
<link rel="stylesheet" href="css/swipebox.css">
			<script src="js/jquery.swipebox.min.js"></script> 
			    <script type="text/javascript">
					jQuery(function($) {
						$(".swipebox").swipebox();
					});
				</script>
<!-- pop-up -->
</head>
<body>
<%@ include file="menu.txt"%>
<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>浏览房源</h2>
			</div>
		</div>
		<!---banner--->
		<div class="content">
			<div class="gallery-section">
				<div class="container">
					<div class="gallery-grids">
						<div class="col-md-6 gallery-grid2">
						<a href="images/g1.jpg" class="swipebox"><span class="rollover1"> </span></a>
						<img src="images/g1.jpg" class="img-responsive" alt="/">
						</div>
						<div class="col-md-6 gallery-grid2">
						<a href="images/g2.jpg" class="swipebox"><span class="rollover1"> </span></a>
						<img src="images/g2.jpg" class="img-responsive" alt="/">
						</div>
						<div class="clearfix"></div>
					</div>
					
				<!-- 	<div class="gallery-grids galry">
						<div class="col-md-6 gallery-grid2">
						<a href="images/g3.jpg" class="swipebox"><span class="rollover1"> </span></a>
						<img src="images/g3.jpg" class="img-responsive" alt="/">
						</div>
						<div class="col-md-6 gallery-grid2">
						<a href="images/g4.jpg" class="swipebox"><span class="rollover1"> </span></a>
						<img src="images/g4.jpg" class="img-responsive" alt="/">
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="gallery-grids galry">
						<div class="col-md-6 gallery-grid2">
						<a href="images/g1.jpg" class="swipebox"><span class="rollover1"> </span></a>
						<img src="images/g1.jpg" class="img-responsive" alt="/">
						</div>
						<div class="col-md-6 gallery-grid2">
						<a href="images/g3.jpg" class="swipebox"><span class="rollover1"> </span></a>
						<img src="images/g3.jpg" class="img-responsive" alt="/">
						</div>
						<div class="clearfix"></div>
					</div> -->
				</div>
			</div>
		</div>
		<%@ include file="footer.txt"%>
</body>
</html>