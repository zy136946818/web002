package com.neuedu.dao;

import com.neuedu.pojo.Handle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HandleDao {
    List<Handle> getHandles(@Param("name") String name);
    List<Handle> getOneById(Integer id);
    int insertHandle(Handle handle);
    int deleteHandle(Integer id);
    int updateHandle(Handle handle);
}
