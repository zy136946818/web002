package com.neuedu.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.neuedu.pojo.Handle;
import com.neuedu.service.IhandleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import java.util.List;

@Controller
public class HandleWeb {
    @Resource
    private IhandleService service;
    @RequestMapping("/list.do")
    public String list(ModelMap map,Integer pageNum,String name){
        if (pageNum == null){
            pageNum=1;
        }
        if (StringUtils.isBlank(name)){
            name=null;
        }
        PageHelper.startPage(pageNum,5);
        List<Handle> lists = service.getHandles(name);
        PageInfo<Handle> pages=new PageInfo<>(lists);
        map.addAttribute("lists",pages);
        map.addAttribute("name",name);
        return "list";
    }

    @RequestMapping("/update.do")
    public String update(ModelMap map,Integer id){
        System.out.println(id);
        List<Handle> oneById = service.getOneById(id);
        map.addAttribute("oneById",oneById);
        System.out.println(oneById);
        return "update";
    }

    @PostMapping("/doUpdate.do")
    public String doUpdate(String img,String name,Integer sort,Integer id){

        System.out.println(img);
        System.out.println(name);
        System.out.println(sort);
        System.out.println(id);
        Handle handle= new Handle();
        handle.setImg(img);
        handle.setName(name);
        handle.setSortOrder(sort);
        handle.setId(id);
        int i = service.updateHandle(handle);
        System.out.println(i);

        if (i>0){
            System.out.println("修改成功！");
            return "redirect:list.do";
        }else {
            System.out.println("修改失败！");
            return "redirect:update.do";
        }
    }

    @RequestMapping("/add.do")
    public String add(){
        return "add";
    }

    @PostMapping("/doAdd.do")
    public String doAdd(String img,String name,Integer sortOrder){
        System.out.println(img);
        System.out.println(name);
        System.out.println(sortOrder);
        Handle handle = new Handle();
        handle.setImg(img);
        handle.setName(name);
        handle.setSortOrder(sortOrder);
        int i = service.insertHandle(handle);
        if (i>0){
            return "redirect:list.do";
        }else {
            return "redirect:add.do";

        }

    }

    @RequestMapping("/delete.do")
    public String delete(Integer id){
        System.out.println("id=============="+id);
        int i = service.deleteHandle(id);
        System.out.println(i);
        if (i>0) {
            System.out.println("删除成功！");
        }
        return "redirect:list.do";

    }



}
