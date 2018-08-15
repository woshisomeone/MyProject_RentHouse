package com.zugo.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-24
 * Time: 下午4:49
 */
public class MapUtil {
    public static Map<String, Object> addCondition(String str1, String str2, Object o){
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("name",str1);
        map.put("rela",str2);
        map.put("value",o);
        return map;
    }

}
