package com.kgc.controller;

import com.kgc.pojo.Admin;
import com.kgc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author 张亮
 * @date 2019-06-20 08:29
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    AdminService adminService;
    
    /**
     * 请求登陆页面
     *
     * @return logina页面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPagea() {
        return "logina";
    }
    
    /**
     * 登陆
     *
     * @param adminName 管理员名
     * @param adminPwd  管理员密码
     * @return 响应体 字符串
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String login(String adminName, String adminPwd, HttpSession session) {
        //根据管理员名获取用户信息
        Admin admin = adminService.getByString(adminName);
        //判断提交的数据与数据库是否一直
        if (admin != null) {
            if (admin.getAdminPwd().equals(adminPwd)) {
                //密码正确,保存用户名
                session.setAttribute("adminName", adminName);
                //设置登陆状态,1代表管理员登陆
                session.setAttribute("requestType", "1");
                return "SUCCESS";
            } else {
                return "MISPASSWORD";
            }
        } else {
            return "NOUSER";
        }
    }
}
