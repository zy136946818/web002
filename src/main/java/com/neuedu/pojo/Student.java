package com.neuedu.pojo;

import lombok.Data;

@Data
public class Student {

    private String sno;
    private String sname;
    private String ssex;
    private Integer sage;
    private String dept;

    public Student() {
    }

    public Student(String sno, String sname) {
        this.sno = sno;
        this.sname = sname;
    }
}
