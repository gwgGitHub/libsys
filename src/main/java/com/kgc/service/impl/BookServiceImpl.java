package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.mapper.AdminMapper;
import com.kgc.mapper.BookMapper;
import com.kgc.mapper.BookTypeMapper;
import com.kgc.mapper.UserMapper;
import com.kgc.pojo.Book;
import com.kgc.pojo.BookExample;
import com.kgc.service.BookService;
import com.kgc.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * @author 张亮
 * @date 2019-06-20 00:37
 */
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookMapper bookMapper;

    @Autowired
    BookTypeMapper booktypeMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    AdminMapper adminMapper;

    @Override
    public PageInfo<Book> getListByPage(PageUtil pageUtil) {
        //示例查询
        BookExample bookExample = new BookExample();
        //封装排序参数
        bookExample.setOrderByClause("book_id");
        //创建条件对象
        BookExample.Criteria criteria = bookExample.createCriteria();
        //判断封装查询条件
        if (pageUtil != null) {
            if (pageUtil.getBookTypeId() != null && pageUtil.getBookTypeId() != -1) {
                criteria.andBookTypeIdEqualTo(pageUtil.getBookTypeId());
            }
            if (pageUtil.getBookName() != null&&!"".equals(pageUtil.getBookName())) {
                criteria.andBookNameLike("%"+pageUtil.getBookName()+"%");
            }
            if (pageUtil.getIsBorrow() != null && pageUtil.getIsBorrow() != -1) {
                criteria.andIsBorrowEqualTo(pageUtil.getIsBorrow());
            }
            //分页设置
            PageHelper.startPage(pageUtil.getPageIndex(), pageUtil.getPageSize());
        }
        //查询得到结果集
        List<Book> books = bookMapper.selectByExample(bookExample);
        if (books != null) {
            for (Book book : books) {
                //查询图书类型并封装到books中
                book.setBookType(booktypeMapper.selectByPrimaryKey(book.getBookTypeId()));
            }
        }
        //封装到PageInfo工具类，并返回
        return new PageInfo<>(books, 3);
    }

    @Override
    public List<Book> getList() {
        return bookMapper.selectByExample(null);
    }

    @Override
    public Book getById(Integer bookId) {
        //根据id查询书籍
        Book book = bookMapper.selectByPrimaryKey(bookId);
        //查询图书分类封装到book中
        book.setBookType(booktypeMapper.selectByPrimaryKey(book.getBookTypeId()));
        return book;
    }

    @Override
    public Book getByString(String bookName) {
        return null;
    }

    @Override
    public boolean add(Book book) {
        return bookMapper.insertSelective(book) > 0;
    }

    @Override
    public boolean updata(Book book) {
        return bookMapper.updateByPrimaryKeySelective(book) > 0;
    }

    @Override
    public boolean delete(Integer bookId) {
        return bookMapper.deleteByPrimaryKey(bookId) > 0;
    }

    @Override
    public boolean deletBooks(Integer[] bookIds) {
        //示例对象
        BookExample bookExample = new BookExample();
        //封装条件
        bookExample.createCriteria().andBookIdIn(Arrays.asList(bookIds));
        //查询并返回
        return bookMapper.deleteByExample(bookExample) > 0;
    }
    
    @Override
    public List<Book> getBooks() {
        return bookMapper.selectByExample(null);
    }
    
}

