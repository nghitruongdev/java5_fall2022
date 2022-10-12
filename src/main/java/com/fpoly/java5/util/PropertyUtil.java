package com.fpoly.java5.util;


import lombok.SneakyThrows;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class PropertyUtil {

    private static final Map<String, Properties> map = new HashMap<>();

    @SneakyThrows
    public static Properties get(String propertiesPath) {
        if (map.containsKey(propertiesPath)) return map.get(propertiesPath);

        Properties prop = new Properties();
        prop.load(PropertyUtil.class.getClassLoader().getResourceAsStream(propertiesPath));
        map.put(propertiesPath, prop);
        return prop;
    }
}
