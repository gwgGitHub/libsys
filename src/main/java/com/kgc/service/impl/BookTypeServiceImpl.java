package com.kgc.service.impl;

import com.github.pagehelper.PageInfo;
import com.kgc.mapper.BookTypeMapper;
import com.kgc.pojo.BookType;
import com.kgc.service.BookTypeService;
import com.kgc.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张亮
 * @date 2019-06-20 00:40
 */
@Service
public class BookTypeServiceImpl implements BookTypeService {
    @Autowired
    BookTypeMapper bookTypeMapper;
    @Override
    public PageInfo<BookType> getListByPage(PageUtil pageUtil) {
        return null;
    }

    @Override
    public List<BookType> getList() {
        return bookTypeMapper.selectByExample(null);
    }

    @Override
    public BookType getById(Integer id) {
        return null;
    }

    @Override
    public BookType getByString(String string) {
        return null;
    }

    @Override
    public boolean add(BookType booktype) {
        return false;
    }

    @Override
    public boolean updata(BookType booktype) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
