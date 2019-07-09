package com.kgc.utils;

/**
 * @author 张亮
 * @date 2019-06-20 00:09
 */
public class PageUtil {
    //当前页
    private Integer pageIndex = 1;
    //页面容量
    private Integer pageSize = 8;
    
    //图书类型id
    private Integer bookTypeId;
    
    //图书名称
    private String bookName;
    
    //是否借阅
    private Integer isBorrow;
    
    
    public Integer getPageIndex() {
        return pageIndex;
    }
    
    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }
    
    public Integer getPageSize() {
        return pageSize;
    }
    
    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
    
    
    //参数的get和set方法--调用去空格方法
    
    public Integer getBookTypeId() {
        return bookTypeId;
    }
    
    public void setBookTypeId(Integer bookTypeId) {
        this.bookTypeId = bookTypeId;
    }
    
    public String getBookName() {
        return bookName;
    }
    
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
    
    public Integer getIsBorrow() {
        return isBorrow;
    }
    
    public void setIsBorrow(Integer isBorrow) {
        this.isBorrow = isBorrow;
    }
    
}