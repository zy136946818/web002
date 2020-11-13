package com.neuedu.dao;

import com.neuedu.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductDao {
    List<Product> getProducts(@Param("handleId") String handleId, @Param("status") String status,@Param("name") String name);
    List<Product> getAll();
    int insetPro(Product product);
    List<Product> getOneById(Integer id);
    int updatePro(Product product);
    int delPro(Integer id);

}
