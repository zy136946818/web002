package com.neuedu.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class Address {
    private Integer id;
    private Integer userId;
    private String userName;
    private String userPhone;
    private String userMobile;
    private String userProvince;
    private String userCity;
    private String userDistrict;
    private String userAddress;
    private String userZip;
    private Date createTime;
    private Date updateTime;

}
