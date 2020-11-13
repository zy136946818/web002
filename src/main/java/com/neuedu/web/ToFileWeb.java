package com.neuedu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@Controller
@MultipartConfig
public class ToFileWeb  {

    @ResponseBody
    @RequestMapping(value = "/doFileAndUpdate.do", method = RequestMethod.POST)
    public String doFileAndUpdate(HttpServletRequest req, HttpServletResponse resp,String cid,String sort) throws IOException, ServletException {
        System.out.println("cid============="+cid);
        System.out.println("sort============"+sort);

        System.out.println("文件提交");
        Part part = req.getPart("file");
        System.out.println("文件名："+part.getSubmittedFileName());
        String s = req.getServletContext().getRealPath("files")+"\\"+part.getSubmittedFileName();
        System.out.println("保存路径："+s);
        File file=new File(s);
        OutputStream os = new FileOutputStream(file);
        InputStream is = part.getInputStream();
        byte [] bytes = new byte[1024];
        int result = is.read(bytes);
        while(result!=-1){
            os.write(bytes,0,result);
            result=is.read(bytes);
        }
        os.close();
        return "";

    }

//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("文件提交");
//        Part part = req.getPart("file");
//        System.out.println("文件名："+part.getSubmittedFileName());
//        String s = req.getServletContext().getRealPath("files")+"\\"+part.getSubmittedFileName();
//        System.out.println("保存路径："+s);
//        File file=new File(s);
//        OutputStream os = new FileOutputStream(file);
//        InputStream is = part.getInputStream();
//        byte [] bytes = new byte[1024];
//        int result = is.read(bytes);
//        while(result!=-1){
//            os.write(bytes,0,result);
//            result=is.read(bytes);
//        }
//        os.close();
//
//
//    }



}
