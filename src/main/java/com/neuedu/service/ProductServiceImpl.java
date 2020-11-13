package com.neuedu.service;

import com.neuedu.dao.ProductDao;
import com.neuedu.pojo.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Transactional
@Service
public class ProductServiceImpl implements IproductService{
    @Resource
    private ProductDao dao;

    @Override
    public List<Product> getProducts(String handleId, String status, String name) {
        return dao.getProducts(handleId,status,name);
    }

    @Override
    public List<Product> getAll() {
        return dao.getAll();
    }

    @Override
    public int insetPro(Product product) {
        return dao.insetPro(product);
    }

    @Override
    public List<Product> getOneById(Integer id) {
        return dao.getOneById(id);
    }

    @Override
    public int updatePro(Product product) {
        return dao.updatePro(product);
    }

    @Override
    public int delPro(Integer id) {
        return dao.delPro(id);
    }
}
