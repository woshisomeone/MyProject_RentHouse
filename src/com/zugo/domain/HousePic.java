package com.zugo.domain;

/**
 * 类说明
 * 
 * @author xzz
 * @date 2018年7月25日下午4:52:04
 */
public class HousePic {
	private String pic_id, house_id, pic_path;

	public String getPic_id() {
		return pic_id;
	}

	public void setPic_id(String pic_id) {
		this.pic_id = pic_id;
	}

	public String getHouse_id() {
		return house_id;
	}

	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}

	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}

	public HousePic(String pic_id, String house_id, String pic_path) {
		super();
		this.pic_id = pic_id;
		this.house_id = house_id;
		this.pic_path = pic_path;
	}

	public HousePic() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
