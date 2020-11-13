package com.neuedu.dao;

import com.neuedu.pojo.User;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface UserDao {

    List<User> getLogin(User user);
    String getUpdate(String password);
    int updatePass(@Param("password") String password,@Param("newPassword") String newPassword);
    List<User> getUser();
    int insertUser(User user);
    List<User> getOneById(@Param("id") Integer id);
    int updateUser(User user);
    int deleteUser(@Param("id")Integer id);
}
