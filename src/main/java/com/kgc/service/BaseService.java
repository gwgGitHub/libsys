package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.utils.PageUtil;

import java.util.List;

/**
 * @author 张亮
 * @date 2019-06-20 00:18
 */
public interface BaseService<T> {
    /**
     * 条件分页查询
     *
     * @param pageUtil 工具类,封装有pageIndex,pageSize,参数信息
     * @return 返回分页插件对象
     */
    PageInfo<T> getListByPage(PageUtil pageUtil);
    
    /**
     * 无条件查询
     *
     * @return 返回集合对象
     */
    List<T> getList();
    
    /**
     * 根据id查询
     *
     * @param id 主键id
     * @return pojo类对象
     */
    T getById(Integer id);
    
    /**
     * 根据字符串查询
     *
     * @param string 查询提供的字符串参数
     * @return 返回实体类
     */
    T getByString(String string);
    
    /**
     * 添加方法
     *
     * @param t pojo类,封装有数据
     * @return 返回布尔值
     */
    boolean add(T t);
    
    /**
     * 修改方法
     *
     * @param t pojo类,封装有数据
     * @return 返回布尔值
     */
    boolean updata(T t);
    
    /**
     * 根据id删除
     *
     * @param id 主键id
     * @return 返回布尔值
     */
    boolean delete(Integer id);
    
}