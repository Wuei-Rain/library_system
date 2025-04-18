package com.wl.mapper;

import com.wl.domain.Book;
import com.wl.domain.BookExample;
import com.wl.domain.Vo.BookVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    long countByExample(BookExample example);

    int deleteByExample(BookExample example);

    int deleteByPrimaryKey(Integer bookId);

    int insert(Book record);

    int insertSelective(Book record);

    List<Book> selectByExample(BookExample example);

    List<Book> selectBooksByPartInfo(String bookPartInfo);

    Book selectByPrimaryKey(Integer bookId);

    int updateByExampleSelective(@Param("record") Book record, @Param("example") BookExample example);

    int updateByExample(@Param("record") Book record, @Param("example") BookExample example);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    //按书籍种类分页查找
    List<Book> selectByCategoryId(@Param("categoryId") int categoryId, @Param("currIndex") int currIndex, @Param("pageSize") int PageSize);

    //查找某一类别书籍的总数
    int selectBookCountByCategoryId(@Param("categoryId") int categoryId);
    List<Book> selectAllBooks();
    List<BookVo> searchBooksByQuery(@Param("query") String query);
}