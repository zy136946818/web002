package com.neuedu.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Cats {
    private Integer id;
    private String cname;
    private Integer cage;
    private List<Student> ts;
}
