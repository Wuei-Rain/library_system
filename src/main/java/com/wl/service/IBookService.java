package com.wl.service;

import com.wl.domain.Book;
import com.wl.domain.Vo.BookVo;
import com.wl.utils.page.Page;

import java.util.List;

public interface IBookService {


    List<BookVo> selectBooksByBookPartInfo(String partInfo);


    Page<BookVo> findBooksByCategoryId(int categoryId, int pageNum);
    List<Book> getAllBooks();

    List<BookVo> searchBooksByQuery(String query);


}
