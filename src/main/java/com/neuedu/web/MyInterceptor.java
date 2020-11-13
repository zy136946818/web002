package com.neuedu.web;
/*
 * 拦截器
 * */
import com.neuedu.pojo.User;
import com.neuedu.service.IuserService;
import com.neuedu.utlis.MySessionContext;
import com.sun.net.httpserver.HttpsServer;
import org.springframework.stereotype.Service;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Hashtable;
import java.util.List;

public class MyInterceptor implements HandlerInterceptor {
    @Resource
    private IuserService service;

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        /*登录时，cookie和session的验证可以写在这*/
        System.out.println("进入拦截器");
        HandlerMethod h =(HandlerMethod) handler;
        System.out.println(h.getMethod());

        User user =new User();
        user.setUsername(user.getUsername());



       // String id = (String) req.getSession().getAttribute("username");
//        HttpSession session = req.getSession();
//        String sessionid = (String) session.getAttribute("sessionid");
//        String username = (String) session.getAttribute("sessionid");
//        System.out.println("===================="+sessionid);
//        System.out.println("username"+username);

//        Cookie cookie= new Cookie("username","admin");
//        // cookie保存时间
//        cookie.setMaxAge(60*60*24*7);
//        resp.addCookie(cookie);
//        String id = (String) req.getSession().getAttribute("username");
//        System.out.println("id============="+id);
//        HttpSession session = MySessionContext.getSession("username");
//        System.out.println("session================"+session);




//        if (id != null) {
//            req.setAttribute("id", id);
//            req.getRequestDispatcher("WEB-INF/pages/pass.jsp").forward(req, resp);
//            return false;
//        }
//
//        //List<User> login = service.getLogin(user);
//        Cookie cookie= new Cookie("username",id);
//        // cookie保存时间
//        cookie.setMaxAge(60*60*24*7);
//        resp.addCookie(cookie);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle方法执行后返回的视图名称的拦截");
        System.out.println("视图名称："+modelAndView.getViewName());
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion响应页面的拦截");


    }
}
