package com.neuedu.service;

import com.neuedu.dao.HandleDao;
import com.neuedu.dao.UserDao;
import com.neuedu.pojo.Handle;
import com.neuedu.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class HandleServiceImpl implements IhandleService{
    @Resource
    private HandleDao dao;

    @Override
    public List<Handle> getHandles(String name) {
        return dao.getHandles(name);
    }

    @Override
    public List<Handle> getOneById(Integer id) {
        return dao.getOneById(id);
    }

    @Override
    public int insertHandle(Handle handle) {
        return dao.insertHandle(handle);
    }

    @Override
    public int deleteHandle(Integer id) {
        return dao.deleteHandle(id);
    }

    @Override
    public int updateHandle(Handle handle) {
        return dao.updateHandle(handle);
    }

}
