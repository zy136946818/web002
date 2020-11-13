package com.neuedu.service;

import com.neuedu.pojo.Product;

import java.util.List;

public interface IproductService {
    List<Product> getProducts(String handleId,String status,String name);
    List<Product> getAll();
    int insetPro(Product product);
    List<Product> getOneById(Integer id);
    int updatePro(Product product);
    int delPro(Integer id);
}
