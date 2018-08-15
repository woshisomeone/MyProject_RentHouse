package com.zugo.domain;

/**
 * 用户有几套房子，房子的状态
 * 
 * @author xzz
 * @date 2018年7月29日下午7:19:20
 */
public class UserWithHouse extends User{
	private int house_num;
	private int rent_num;
	private double rate;

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getHouse_num() {
		return house_num;
	}

	public void setHouse_num(int house_num) {
		this.house_num = house_num;
	}

	public int getRent_num() {
		return rent_num;
	}

	public void setRent_num(int rent_num) {
		this.rent_num = rent_num;
	}
}