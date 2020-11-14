package com.neuedu.utlis;


import javax.servlet.http.Cookie;
import java.util.HashMap;
import java.util.Map;

public class CookieUtils {
    public static Map<String, Cookie> getCookie(Cookie[] cookies){
        Map<String , Cookie> maps= new HashMap<>();
        if (cookies!=null){
            for (Cookie c:cookies){
                maps.put(c.getName(),c);
            }

        }

        return maps;
    }
}
