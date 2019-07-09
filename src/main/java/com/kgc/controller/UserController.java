package com.kgc.controller;

import com.kgc.pojo.User;
import com.kgc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @author 张亮
 * @date 2019-06-21 21:12
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    
    /**
     * 请求注册的页面
     *
     * @return register页面
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage() {
        return "register";
    }
    
    /**
     * Ajax异步请求,验证是否被注册
     *
     * @param userName 用户名
     * @return 响应体 success或failed字符串
     */
    @RequestMapping(value = "/regverify", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String regverify(String userName) {
        //根据用户名获取用户信息
        User user = userService.getByString(userName);
        if (user == null) {
            return "SUCCESS";
        } else {
            return "FAILED";
        }
    }
    
    /**
     * 注册
     *
     * @param user pojo类接收注册参数
     * @return 响应体 js
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String register(User user) {
        //设置注册时间
        user.setRegisterTime(new Date());
        if (userService.add(user)) {
            return "<script>alert('注册成功!');location.href='/';</script>";
        } else {
            return "<script>alert('注册超时，请稍后重试!');history.go(-1);</script>";
        }
    }
    
    /**
     * 请求登陆页面
     *
     * @return loginu页面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPageu() {
        return "loginu";
    }
    
    /**
     * 登陆
     *
     * @param userName 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String login(String userName, String password, HttpSession session) {
        //根据用户名获取用户信息
        User user = userService.getByString(userName);
        //判断前台提交数据与数据库是否一直
        if (user != null) {
            if (user.getPassword().equals(password)) {
                //设置登陆时间
                user.setLastLogintime(new Date());
                userService.updata(user);
                //如果数据一直,保存用户名
                session.setAttribute("userName", userName);
                //设置登陆状态,2代表用户登陆
                session.setAttribute("requestType", 2);
                return "SUCCESS";
            } else {
                return "MISPASSWORD";
            }
        } else {
            return "NOUSER";
        }
        
    }
    
    
}
