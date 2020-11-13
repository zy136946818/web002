package com.neuedu.web;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.pojo.Handle;
import com.neuedu.pojo.Product;
import com.neuedu.pojo.Student;
import com.neuedu.service.IhandleService;
import com.neuedu.service.IproductService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.plugin.javascript.ocx.JSObject;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ProductWeb {

    @Resource
    private IproductService service;

    @Resource
    private IhandleService ihandleService;

    @RequestMapping("/getProducts.do")
    private String getProduct(ModelMap map,Integer pageNum,String handleId,String status,String name){
        if (StringUtils.isBlank(handleId)){
            handleId=null;
        }
        if (StringUtils.isBlank(status)){
            status=null;
        }
        if (StringUtils.isBlank(name)){
            name=null;
        }
        if (pageNum==null){
            pageNum=1;
        }

        PageHelper.startPage(pageNum,5);
        List<Product> lists = service.getProducts(handleId,status,name);
        PageInfo<Product> pages = new PageInfo<>(lists);
        List<Handle> handles = ihandleService.getHandles(null);
        map.addAttribute("handles",handles);
        map.addAttribute("lists",pages);
        return "pro";

    }

    @RequestMapping("/addPro.do")
    public String addPro(){
        return "addPro";
    }

    @PostMapping("/doAddPro.do")
    public String doAddPro(Product product ){
        System.out.println("===========doAddPro============");
        System.out.println(product);
        int i = service.insetPro(product);
        System.out.println(i);
        if (i>0){

            return "redirect:getProducts.do";
        }else {
            return "redirect:addPro.do";
        }

    }


    @RequestMapping("/getStock.do")
    public String getStock(){
        return "info";
    }
    @RequestMapping("/getPro.do")
    @ResponseBody
    public String getPro(){
        List<Product> list = service.getAll();
        return JSONObject.toJSONString(list);
    }

    @RequestMapping("/updatePro.do")
    public String updatePro(ModelMap map,Integer id){
        System.out.println("update");
        System.out.println("=========id======="+id);
        List<Product> oneById = service.getOneById(id);
        map.addAttribute("lists",oneById);
        return "updatePro";
    }
    @RequestMapping("/doUpdatePro.do")
    public String doUpdatePro(Product product){
        System.out.println("===============doUpdatePro===========");
        System.out.println(product);
        int i = service.updatePro(product);
        if (i>0){
            System.out.println("修改成功！");
            return "redirect:getProducts.do";
        }else {
            return "redirect:updatePro.do";
        }



    }

    @RequestMapping("/delPro.do")
    public String delPro(Integer id){
        System.out.println("===============delPro===========");
        System.out.println(id);
        int i = service.delPro(id);
        System.out.println(i);
        System.out.println("删除成功！");
        return "redirect:getProducts.do";

    }


}
