package com.zugo.factory;

import java.util.ResourceBundle;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-24
 * Time: 下午4:59
 */
public class BeanFactory {
    private static ResourceBundle bundle;
    static {
        bundle=ResourceBundle.getBundle("instance");
    }

    public static <T> T getInstance(String key,Class<T> clas){
        String className=bundle.getString(key);
        try {
            return (T) Class.forName(className).newInstance();
        } catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
