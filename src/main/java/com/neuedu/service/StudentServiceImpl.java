package com.neuedu.service;

import com.neuedu.dao.StudentDao;
import com.neuedu.pojo.Student;
import com.neuedu.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class StudentServiceImpl implements IstudentService{
    @Resource
    private StudentDao dao;
    @Override
    public List<Student> getAll() {
        return dao.getAll();
    }


}
