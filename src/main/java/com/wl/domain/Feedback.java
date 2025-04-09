package com.wl.domain;

import lombok.Data;

import java.util.Date;

@Data
public class Feedback {
    private Integer id;
    private String username;
    private String email;
    private String message;
    private Date createdAt;


}
