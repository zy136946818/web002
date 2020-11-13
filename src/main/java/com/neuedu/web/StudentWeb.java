package com.neuedu.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.pojo.Student;
import com.neuedu.service.IstudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class StudentWeb {
    @Resource
    private IstudentService service;
    @RequestMapping("/a.do")
    public String a(ModelMap map,Integer pageNum){
        if (pageNum ==null){
            pageNum=1;
        }
        PageHelper.startPage(pageNum,5);
        List<Student> lists = service.getAll();
        PageInfo<Student> pageInfo= new PageInfo<>(lists);
        map.addAttribute("pages",pageInfo);
        return "a";
    }

}
