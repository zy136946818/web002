package com.neuedu.service;

import com.neuedu.dao.StudentDao;
import com.neuedu.dao.UserDao;
import com.neuedu.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class UserServiceImpl implements IuserService{

    @Resource
    private UserDao dao;


    @Override
    public List<User> getLogin(User uesr) {
        return dao.getLogin(uesr);
    }

    @Override
    public int updatePass(String password, String newPassword) {
        return dao.updatePass(password,newPassword);
    }


    @Override
    public String getUpdate(String password) {
        return dao.getUpdate(password);
    }

    @Override
    public List<User> getUser() {
        return dao.getUser();
    }

    @Override
    public int insertUser(User user) {
        return dao.insertUser(user);
    }

    @Override
    public List<User> getOneById(Integer id) {
        return dao.getOneById(id);
    }

    @Override
    public int updateUser(User user) {
        return dao.updateUser(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return dao.deleteUser(id);
    }


}
