package com.kgc.service;

import com.kgc.pojo.Book;

import java.util.List;

/**
 * @author 张亮
 * @date 2019-06-20 00:35
 */
public interface BookService extends BaseService<Book> {
    boolean deletBooks(Integer[] bookIds);
    
    List<Book> getBooks();
}
