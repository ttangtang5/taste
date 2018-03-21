package com.tang.taste.common.util;

import java.io.FileInputStream;
import java.util.Properties;

public class Config {

    private static Properties p = new Properties();
    
    static {
        try {
            String path = Class.forName("cn.tyky.sjcp.common.util.Config").getResource("/").getPath();
            p.load(new FileInputStream(path + "properties/resource.properties"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getConfig(String key){
        return p.getProperty(key);
    }
    
    public static void setConfig(String key,String value){
    	p.setProperty(key, value);
    }
    
    public static Properties getAllSettings(){
    	return p;
    }
}
