package com.zugo.domain;

import java.util.Date;
import java.util.List;

/**  
 * 类说明
 * @author xzz
 * @date 2018年7月25日下午5:20:52
 */
public class HouseWithPic extends House{
	    private String  pic_path="";
	    
		public HouseWithPic(String pic_path) {
			super();
			this.pic_path = pic_path;
		}
		
		public HouseWithPic() {
			super();
		}
		public String getPic_path() {
			return pic_path;
		}
		public void setPic_path(String pic_path) {
			this.pic_path = pic_path;
		}
	
	
		
		
}
