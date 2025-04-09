package com.wl.domain.Vo;

import com.wl.domain.Book;
import com.wl.domain.User;
import lombok.Data;


@Data
public class BorrowingBooksVo {
    private User user;
    private Book book;  //借阅书籍
    private String dateOfBorrowing;  //借书日期
    private String dateOfReturn;    //还书日期
}
