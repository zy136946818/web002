package com.neuedu.service;

import com.neuedu.dao.AddressDao;
import com.neuedu.pojo.Address;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AddressServiceImpl implements IaddressService{
    @Resource
    private AddressDao dao;

    @Override
    public List<Address> getList(Integer id) {
        return dao.getList(id);
    }

    @Override
    public int insertAddress(Address address) {
        return dao.insertAddress(address);
    }

    @Override
    public List<Address> getOneById(Integer id) {
        return dao.getOneById(id);
    }

    @Override
    public int updateAddress(Address address) {
        return dao.updateAddress(address);
    }

    @Override
    public int deleteAddress(Integer id) {
        return dao.deleteAddress(id);
    }

    @Override
    public List<Address> byNameMobileList(Address address) {
        return dao.byNameMobileList(address);
    }
}
