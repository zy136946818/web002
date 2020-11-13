package com.neuedu.service;

import com.neuedu.dao.HandleDao;
import com.neuedu.pojo.Handle;

import java.util.List;

public interface IhandleService {
    List<Handle> getHandles(String name);
    List<Handle> getOneById(Integer id);
    int insertHandle(Handle handle);
    int deleteHandle(Integer id);
    int updateHandle(Handle handle);

}
