package com.neuedu.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class Handle {
    private Integer id;
    private String name;
    private Integer parentId;
    private Date createTime;
    private Date updateTime;
    private Integer status;
    private Integer sortOrder;
    private String img;


}
