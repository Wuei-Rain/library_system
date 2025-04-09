package com.wl.domain;

import lombok.Data;

@Data
public class Book {
    private Integer bookId;

    private String bookName;

    private String bookAuthor;

    private String bookPublish;

    private Integer bookCategory;

    private Double bookPrice;

    private String bookIntroduction;

    private String bookStatic;

    private Boolean isExist;  // 是否可借
    private String isBorrowed;
}