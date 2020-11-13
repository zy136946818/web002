package com.neuedu.dao;

import com.neuedu.pojo.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressDao {
    List<Address> getList(@Param("id") Integer id);
    int insertAddress(Address address);
    List<Address> getOneById(Integer id);
    int updateAddress(Address address);
    int deleteAddress(Integer id);
    List<Address> byNameMobileList(Address address);
}
