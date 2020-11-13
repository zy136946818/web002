package com.neuedu.service;

import com.neuedu.pojo.Address;

import java.util.List;

public interface IaddressService {
    List<Address> getList(Integer id);
    int insertAddress(Address address);
    List<Address> getOneById(Integer id);
    int updateAddress(Address address);
    int deleteAddress(Integer id);
    List<Address> byNameMobileList(Address address);
}
