package com.neuedu.test;

import com.alibaba.druid.pool.DruidDataSource;
import com.neuedu.dao.StudentDao;
import com.neuedu.pojo.Student;
import com.neuedu.service.IstudentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:application-Context.xml"})
public class DemoTest {
    @Resource
    private IstudentService dao;

    @Test
    public void test(){

//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("classpath:application-Context.xml");
//        DruidDataSource d=(DruidDataSource)context.getBean("dataSource");
//        System.out.println(d);
//        List<Student> lists = dao.getAll();
//        for (Student s: lists
//             ) {
//            System.out.println(s);
//        }

        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:application-Context.xml");
        Student student =(Student) applicationContext.getBean("student");
        System.out.println(student);

        Object car = applicationContext.getBean("car");


    }


}
