package com.neuedu.service;

import com.neuedu.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IuserService {

    List<User> getLogin(User uesr);

    int updatePass(@Param("password") String password, @Param("newPassword") String newPassword);

    String getUpdate(String password);
    List<User> getUser();
    int insertUser(User user);
    List<User> getOneById(Integer id);
    int updateUser(User user);
    int deleteUser(@Param("id")Integer id);
}
