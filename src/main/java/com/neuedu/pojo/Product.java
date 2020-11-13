package com.neuedu.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class Product {
    private Integer id;
    private String name;
    private Integer handleId;
    private String subtitle;
    private String mainImage;
    private String subImage;
    private Integer status;
    private double price;
    private Integer stock;
    private String detail;
    private Date createTime;
    private Date updateTime;
}
