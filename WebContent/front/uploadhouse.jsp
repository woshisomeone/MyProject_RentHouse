<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布房源</title>
	<%@ include file="menu.txt"%>
<link href="inputfile/css/fileinput.css" media="all"rel="stylesheet" type="text/css" />
<script src="inputfile/js/fileinput.js"type="text/javascript"></script>

</head>
<style>
	input{
		margin:5px;
		background:white;
	}
	select{
	margin:5px;
	}
	.krajee-default.file-preview-frame .kv-file-content {
    width:170px;
    height: 70px;
}

/* /* .btn-primary{
	background-color: #357ebd;
}
.file-input .btn{
	float:right;
} */
</style>
<script>
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
<body>

<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>发布房源</h2>
			</div>
		</div>
		<!---banner--->
		<div class="content">
			<div class="blog-section">
				<div class="container">
					<div class="blog-grids">
						<div class="col-md-9 blog-grid">
					
							<!---RESPONSES--->
							<div class="coment-form">
								<div class="container">
									<h3>填写信息</h3>
									<form action="${pageContext.request.contextPath }/publishHouse" Method="post">
										<input type="text" id="house_name" placeholder="房屋所在小区名" name="house_name">
										<input type="text" id="house_area" placeholder="房屋面积（㎡）" name="house_area">
										<input type="text" id="house_rent" placeholder="租金（月/元）" name="house_rent">
										<textarea type="text"  id="house_desc" placeholder="详细描述（房屋细节）" name="house_desc"></textarea>
										房型：
											<select name="house_type">
												<option value="所有房型">所有房型</option>
												<option value="四室">四室</option>
												<option value="三室">三室</option>
												<option value="两室">两室</option>
												<option value="一室一厅">一室一厅</option>
												<option value="单间独卫">单间独卫</option>
												</select><br>
										位置：<select style="width: 100px;" id="province" name="province" onchange="area()">
										<option value="" selected>全国</option>
										<option value="广东省">广东省</option>
										<option value="福建省">福建省</option>
										</select>
										<select style="width: 100px;" id="city" name="city">
											<option value="" selected>全省</option>
										</select>
										<input type="text" id="house_detailaddr" placeholder="具体位置(楼/单元/门牌号)" name="house_detailaddr" style="display:inline;width:20%">
											<div class="clearfix"></div><br>
										<div ><input type="submit" value="发布" class="btn btn-info col-md-6" ></div>	
										</form>
								</div>
							</div>
							
				
						</div>
						<div class="col-md-3 blog-grid1">
							<div class="categ">
							<h3>Categories</h3>
							<ul>
							<li><a href="#">Lorem ipsum dolor sit amet</a></li>
		  						<li><a href="#">Duis aute irure dolor in culpa</a></li>
		  						<li><a href="#">Sunt in culpa qui illum</a></li>
		  						<li><a href="#">vel illum qui dolorem man</a></li>
		  						<li><a href="#">The wise man therefore culpa</a></li>
		  						<li><a href="#">Sunt in culpa qui officia</a></li>
		  						<li><a href="#">Lorem ipsum dolor sit qui</a></li>
		  						<li><a href="#">Duis aute irure dolor</a></li>
		  						<li><a href="#">Sunt in culpa qui officia</a></li>

							</ul>
							</div>
							<div class="tags">
								<h4>Tags</h4>
								<ul>
									<li><a href="blog.html">Lorem</a></li>
									<li><a href="blog.html">consectetur</a></li>
									<li><a href="blog.html">dolore</a></li>
									<li><a href="blog.html">aliqua</a></li>
									<li><a href="blog.html">sit amet</a></li>
									<li><a href="blog.html">ipsum</a></li>
									<li><a href="blog.html">Lorem</a></li>
									<li><a href="blog.html">consectetur</a></li>
									<li><a href="blog.html">dolore</a></li>
									<li><a href="blog.html">aliqua</a></li>
									<li><a href="blog.html">sit amet</a></li>
									<li><a href="blog.html">ipsum</a></li>
								</ul>
							</div>
							<div class="feature">
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
$("#testFile").fileinput({
    language: 'zh', //设置语言
    uploadUrl: "${ pageContext.request.contextPath}/front/uploadHousePic?house_id=house.house", //上传的地址
        allowedFileExtensions: ['jpg', 'gif', 'png', 'jpeg'],//接收的文件后缀
        maxFilesNum: 8,//上传最大的文件数量
        //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
        uploadAsync: true, //默认异步上传
        showUpload: true, //是否显示上传按钮
        showRemove: true, //显示移除按钮
        showPreview: true, //是否显示预览
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式
        //dropZoneEnabled: true,//是否显示拖拽区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 8, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount: true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({8}) 超过允许的最大数值{8}！",

    }).on('filepreupload', function (event, data, previewId, index) {     //上传中
        var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
        	/* alert(response); */
    });
</script>
</html>