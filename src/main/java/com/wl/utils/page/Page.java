package com.wl.utils.page;

import lombok.Data;

import java.util.List;


@Data
public class Page<T> {
    private List<T> list;//T类型的对象链表
    private int pageNum; //当前页码
    private int pageSize;//每页数量
    private int pageCount;//总页数
}
