package com.zugo.util;

import java.util.UUID;

/**
 * <p>UUIDUtil类是用于生成32为UUID的工具类</p>
 *  	 yanjian
 * @version  1.0.0
 * @since    <p>Jan 13, 2013 5:09:18 PM</p>
 */
public final class UUIDUtil {
	/**
	 * <p>随机生成UUID字符串</p>
	 * @return	UUID字符串
	 */
	public static final String randomUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	public static void main(String[] args) {
		System.out.println(randomUUID());
	}
}
