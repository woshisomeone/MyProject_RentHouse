# MyProject_RentHouse
A webProject for RENT HOUSE  
本项目主要功能是网上租房（前台）。技术：servlet+jsp+mysql 采用c3p0数据源
- 用户注册
- 登陆、注销
- 租房（未涉及付款）
- 发布房源
- 修改房源、上传房屋图片（需要在项目的Server文件夹server.xml中配置图片的虚拟路径）
- 按条件搜索房源
- 推荐房源
- 推荐房主
- 显示已租房屋
- 显示个人信息、房屋信息
## 数据库设计
  五张表，资源中可以下载
## 修改房源、上传多张照片功能点
- 该页面提供查看、修改房源；上传图片、删除图片；防止刷新地址栏导致提交空的表单而使房源信息变空，及回退页面导致提交重复房源。
图片上传：用bootstrap的inputfile工具实现多张上传；
图片删除：通过自己写一个叉的按钮用js实现页面隐藏，然后点击修改的时候获得点击叉的图片的id（写在隐藏域中），再通过ajax到数据库进行删除。
- Token和session解决表单重复提交。



---更多功能请下载源码（该项目未用框架）
