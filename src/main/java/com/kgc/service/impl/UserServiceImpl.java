package com.kgc.service.impl;

import com.github.pagehelper.PageInfo;
import com.kgc.mapper.UserMapper;
import com.kgc.pojo.User;
import com.kgc.service.UserService;
import com.kgc.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张亮
 * @date 2019-06-20 00:40
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    
    @Override
    public PageInfo<User> getListByPage(PageUtil pageUtil) {
        return null;
    }
    
    @Override
    public List<User> getList() {
        return userMapper.selectByExample(null);
    }
    
    @Override
    public User getById(Integer id) {
        return null;
    }
    
    @Override
    public User getByString(String userName) {
        return userMapper.selectByUserName(userName);
    }
    
    @Override
    public boolean add(User user) {
        return userMapper.insertSelective(user) > 0;
    }
    
    @Override
    public boolean updata(User user) {
        return userMapper.updateByPrimaryKeySelective(user)>0;
    }
    
    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
