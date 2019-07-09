package com.kgc.service.impl;

import com.github.pagehelper.PageInfo;
import com.kgc.mapper.AdminMapper;
import com.kgc.pojo.Admin;
import com.kgc.service.AdminService;
import com.kgc.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张亮
 * @date 2019-06-20 15:52
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public PageInfo<Admin> getListByPage(PageUtil pageUtil) {
        return null;
    }

    @Override
    public List<Admin> getList() {
        return adminMapper.selectByExample(null);
    }

    @Override
    public Admin getById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public Admin getByString(String string) {
        return adminMapper.selectByAdminName(string);
    }

    @Override
    public boolean add(Admin admin) {
        return false;
    }

    @Override
    public boolean updata(Admin admin) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
