package com.neuedu.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.pojo.Handle;
import com.neuedu.pojo.User;
import com.neuedu.service.IuserService;
import com.sun.org.apache.regexp.internal.RE;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class UserWeb {
    @Resource
    private IuserService service;

    @RequestMapping("/login.do")
    public String loginIn(){
        return "login";
    }

    @PostMapping("/doLogin.do")
    public String doLogin(HttpServletResponse resp,HttpServletRequest req,User user) throws IOException {

        List<User> list = service.getLogin(user);
        System.out.println("=====list===="+list);
        for (User u: list
             ) {
            System.out.println(u);
        }
        Cookie cookie= new Cookie("username",user.getUsername());
        // cookie保存时间
        cookie.setMaxAge(60*60*24*7);
        resp.addCookie(cookie);
        String username = (String) req.getSession().getAttribute("username");
        if (list.size()>0 ){
            return "redirect:index.do";
        }else {
            return "redirect:login.do";
        }

    }


    @RequestMapping("/pass.do")
    public String pass(){
        return "pass";
    }

    @PostMapping("/doUpdatePass.do")
    public String doUpdatePass(String mpass,String newpass,String renewpass){

        System.out.println(mpass);
        System.out.println(newpass);
        System.out.println(renewpass);
        String update = service.getUpdate(mpass);
        System.out.println(update);
        if (update !=null){
            int i = service.updatePass(update, newpass);
            if (i>0){
                System.out.println("修改成功！");

            }else {
                System.out.println("修改失败！");
            }
        }
        return "redirect:pass.do";

    }


    @RequestMapping("/index.do")
    public String index(){
        return "index";
    }

    @RequestMapping("/userList.do")
    public  String userList(ModelMap map,Integer pageNum){
        if (pageNum == null){
            pageNum=1;
        }
        PageHelper.startPage(pageNum,5);
        List<User> user = service.getUser();
        PageInfo<User> pages=new PageInfo<>(user);
        map.addAttribute("lists",pages);
        return "userList";
    }

    @RequestMapping("/addUser.do")
    public String addUser(){
        return "addUser";
    }
    @PostMapping("/doAddUser")
    public String doAddUser(User user){
        System.out.println(user);
        int i = service.insertUser(user);
        if (i>0){
            System.out.println("添加成功");
            return "redirect:userList.do";
        }else {
            System.out.println("添加失败！");
            return "redirect:addUser.do";
        }

    }

    @RequestMapping("/updateUser.do")
    public String updateUser(ModelMap map,Integer id){
        System.out.println(id);
        List<User> oneById = service.getOneById(id);
        map.addAttribute("lists",oneById);
        return "updateUser";
    }
    @PostMapping("/doUpdateUser")
    public String doUpdateUser(User user){
        System.out.println(user);
        int i = service.updateUser(user);
        if (i>0){
            System.out.println("修改成功");
            return "redirect:userList.do";
        }else {
            System.out.println("修改失败！");
            return "redirect:updateUser.do";
        }
    }
    @RequestMapping("/deleteUser")
    public String deleteUser(Integer id){
        System.out.println(id);
        int i = service.deleteUser(id);
        if (i>0){
            System.out.println("删除成功！");
        }
        return "redirect:userList.do";
    }

}
