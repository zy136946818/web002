package com.neuedu.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.pojo.Address;
import com.neuedu.pojo.User;
import com.neuedu.service.IaddressService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AddressWeb {

    @Resource
    private IaddressService service;

    @RequestMapping("/addressList.do")
    public String addressList(ModelMap map,Integer id,Integer pageNum){
        if (pageNum == null){
            pageNum=1;
        }
        PageHelper.startPage(pageNum,5);
        List<Address> list = service.getList(id);
        PageInfo<Address> pages=new PageInfo<>(list);
        List<Integer> userId=new ArrayList<>();
        userId.add(id);
        map.addAttribute("userId",userId);
        map.addAttribute("lists",pages);
        return "addressList";
    }

    @RequestMapping("/addAddress.do")
    public String addAddress(ModelMap map ,Integer user_id){
        List<Integer> list = new ArrayList<>();
        list.add(user_id);
        map.addAttribute("lists",list);
        return "addAddress";
    }
    @PostMapping("/doAddAddress.do")
    public String doAddAddress(Address address){
        System.out.println(address);
        int i = service.insertAddress(address);
        if (i>0){
            System.out.println("添加成功！");
            return "redirect:addressList.do";
        }else {
            return "redirect:addAddress.do";
        }
    }

    @RequestMapping("/updateAddress.do")
    public String updateAddress(ModelMap map,Integer id){
        System.out.println(id);
        List<Address> lists = service.getOneById(id);
        map.addAttribute("lists",lists);
        return "updateAddress";
    }
    @PostMapping("/doUpdateAddress")
    public  String doUpdateAddress(Address address){
        System.out.println(address);
        int i = service.updateAddress(address);
        if (i>0){
            System.out.println("修改成功！");
            return "redirect:addressList.do";
        }else {
            return "redirect:updateAddress.do";
        }

    }
    @RequestMapping("/deleteAddress")
    public String deleteAddress(Integer id){
        int i = service.deleteAddress(id);
        if (i>0){
            System.out.println("删除成功！");
            return "redirect:addressList.do";
        }else {
            return "redirect:updateAddress.do";
        }

    }
    @RequestMapping("/doAddressList.do")
    public String doAddressList(Address address){
        System.out.println("==========doAddressList============");
        System.out.println(address);
        List<Address> list = service.byNameMobileList(address);
        if (list.size()>0){
            return "redirect:addressList.do";
        }else {
            return "";
        }


    }



}
