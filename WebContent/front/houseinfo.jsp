<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<%@ include file="menu.txt"%>
<link href="inputfile/css/fileinput.css" media="all"rel="stylesheet" type="text/css" />
<script src="inputfile/js/fileinput.js"type="text/javascript"></script>

<title>房源信息</title> 
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
/* .file-drop-zone {
    border: none;
    } */
    .file-preview{
    margin-top:-20px;
    }
li img{
	width:170px;
	height: 150px;
}
.img-thumbnail{
height:150px;
}
.panle{
position: relative;
float:left;
}
.additional-details ul li:hover {
    background:white;
}
.additional-details ul li ul li{
	border:0;
	list-style: none;
	padding: 0;
}
.additional-details ul li ul{
	margin: 0;
}
.additional-details ul li{
border-top:0;
}
.krajee-default.file-preview-frame .kv-file-content {
    width:187px;
} 

.file-preview {
    border-radius: 5px;
    border: 1px solid #ddd;
    padding:0px;
    width:90%;
    margin-bottom: 5px;
}
/*     .file-drop-zone-title{
    display:none;
    }
     */
   .imgbig:hover{
   		 transform:scale(1.2);
   }
    .btn-primary{
	background-color:white;
	float:right;
	margin-right:80px;
} 

</style>
<body>

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
						<div class="additional-details">
							<h3>房源信息</h3>
							<form action="${pageContext.request.contextPath}/front/updateHouseInfo?oper=updateHouse&house_id=${house.house_id}" name="houseinfo" method="post">
							<input type="hidden" name="token" value="${token}">
							<ul>
								<li><span>房屋所在小区名</span> <input type="text" id="house_name" placeholder="房屋所在小区名" name="house_name" value=${house.house_name }></li>
								<li><span>房屋面积（㎡）</span>	<input type="text" id="house_area" placeholder="房屋面积（㎡）" name="house_area" value="${house.house_area }"></li>
								<li><span>租金（月/元）</span><input type="text" id="house_rent" placeholder="租金（月/元）" name="house_rent" value="${ house.house_rent}"></li>
								<li><span>详细描述（房屋细节）</span>	<input type="text"  id="house_desc" placeholder="详细描述（房屋细节）" name="house_desc" value="${house.house_desc }"></li>
							<li>	<input type="hidden" id="type" value="${house.house_type}">
											<span>	房型：</span><select id="house_type" name="house_type">
												<option value="所有房型">所有房型</option>
												<option value="四室">四室</option>
												<option value="三室">三室</option>
												<option value="两室">两室</option>
												<option value="一室一厅">一室一厅</option>
												<option value="单间独卫">单间独卫</option>
												</select></li>
								<li>		<input type="hidden" id="province" value="${house.house_province}">
									<input type="hidden"  id="city" value="${house.house_city}">
									位置：<select style="width: 100px;" id="house_province" name="house_province" onchange="area()">
										<option value="">全国</option>
										<option value="广东省">广东省</option>
										<option value="福建省">福建省</option>
									</select>
									<select style="width: 100px;" id="house_city" name="house_city">
										<option value="">全省</option>
									</select>
										<input type="text" id="house_detailaddr" placeholder="具体位置(楼/单元/门牌号)" name="house_detailaddr" style="display:inline;width:20%" value="${house.house_detailaddr }"></li>
							<li>
							<ul id="pic">
							  <c:forEach varStatus="status" var="housePic" items="${housePics}">
							<li><div  class="panle" ><p class="close" >x</p><div style="margin:15px"><img src="/zugo/housepic/${housePic.pic_path}" class="img-thumbnail"><input type="hidden" value="${housePic.pic_id } "></div></div>	
							</li></c:forEach>
								</ul>
								</li>
								<div class="clearfix"></div>
					<li style="margin-top:10px"><input id="testFile"  type="file" multiple name="file"></li>
					</ul>
								<div class="clearfix"></div>
							<div style="800px"><input type="button" id="submit"value="修改房源" class="btn btn-info col-xs-2" style="margin-right:20px" onclick="update()"><input type="button" value="删除房源" class="btn btn-info col-xs-2" onclick="deleteHouse()"></div>
							</form>
						</div>
						</div>	
					<div class="clearfix"></div>
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
<script type="text/javascript">
var str;
function area() {
    var province = document.getElementById("house_province").value;
    var city = document.getElementById("house_city");
    var map = {
        "guangdong": ["广州市", "深圳市", "惠州市"],
        "fujian": ["厦门市", "福州市", "泉州市"]
    };
    city.options.length = 1;
    switch (province) {
        case "广东省":
            for (var i = 0; i < map.guangdong.length; i++) {
                city.add(new Option(map.guangdong[i], map.guangdong[i]));
            }
            break;
        case "福建省":
            for (var j = 0; j < map.fujian.length; j++) {
                city.add(new Option(map.fujian[j], map.guangdong[i]));
            }
            break;
    }
}
window.onload=function(){
	/* 显示下拉列表默认值 */
	var provinces=$("#house_province").find("option");
	for (var j = 1; j < provinces.length; j++) {
		if ($(provinces[j]).val() == $("#province").val()) {
			$(provinces[j]).attr("selected", "selected");
		}
	}
    area();
    var cities=$("#house_city").find("option");
    var types=$("#house_type").find("option");
    for (var j = 1; j < cities.length; j++) {
        if ($(cities[j]).val() == $("#city").val()) {
			$(cities[j]).attr("selected", "selected");
		}
	} 
	for (var j = 1; j < types.length; j++) {
		if ($(types[j]).val() == $("#type").val()) {
			$(types[j]).attr("selected", "selected");
		}
	} 
	/* 页面删除图片 */
		var imgpath;
		var pic__id;
		var c=$("#pic li").children("div").children("p");
		c.click(function(){
	     	var id=$(this).next("div").children("input");
	     	pic_id=id.val();
	     	str=str+"/"+pic_id;
	       $(this).parent().parent().css("display","none");
	      });
		
		$("#pic li").children("div").find("img").click(function() {
			$(this).toggleClass("imgbig");
		}) ;
	
}
	
     /* 数据库更新图片 */
     function update() {
			$.ajax({
				   type: "POST",
				   url: "${pageContext.request.contextPath}/front/updateHouseInfo?oper=deletePic",
				   data: "str="+str,
				  /*  success: function(msg){
				   } */
				});
			   $("#submit").attr("type","submit");
     }
     
/* 数据库删除房源 */
function deleteHouse() {
    $.ajax({
        type: "get",
        url: "${pageContext.request.contextPath}/front/updateHouseInfo?oper=deleteHouse&house_id=${house.house_id}",
        success: function(msg){
            alert(msg);
            window.location.href="${pageContext.request.contextPath }/front/houseList?method=showOwn";
        } ,
        error: function(msg) {
            alert(msg);
        },
    });
}


/* 数据库上传图片 */
     $("#testFile").fileinput({
    	    language: 'zh', //设置语言
    	    uploadUrl: "${ pageContext.request.contextPath}/front/uploadHousePic?house_id=${house.house_id}", //上传的地址
    	        allowedFileExtensions: ['jpg', 'gif', 'png', 'jpeg'],//接收的文件后缀
    	        maxFilesNum: 4,//上传最大的文件数量
    	        //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
    	        uploadAsync: true, //默认异步上传
    	        showUpload: true, //是否显示上传按钮
    	        showRemove: true, //显示移除按钮
    	        showPreview: true, //是否显示预览
    	        showCaption: false,//是否显示标题
    	        browseClass: "btn btn-primary", //按钮样式
    	       dropZoneEnabled: true,//是否显示拖拽区域
    	        //minImageWidth: 50, //图片的最小宽度
    	        //minImageHeight: 50,//图片的最小高度
    	        //maxImageWidth: 1000,//图片的最大宽度
    	        //maxImageHeight: 1000,//图片的最大高度
    	        maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
    	        //minFileCount: 0,
    	        maxFileCount: 4, //表示允许同时上传的最大文件个数
    	        enctype: 'multipart/form-data',
    	        validateInitialCount: true,
    	        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
    	        msgFilesTooMany: "选择上传的文件数量({4}) 超过允许的最大数值{4}！",

    	    }).on('filepreupload', function (event, data, previewId, index) {     //上传中
    	        var form = data.form, files = data.files, extra = data.extra,
    	            response = data.response, reader = data.reader;
    	        /* 	alert(response); */
    	    });
    
    	   
</script>
</html>