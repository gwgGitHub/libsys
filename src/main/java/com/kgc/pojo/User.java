package com.kgc.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@SuppressWarnings("AlibabaClassMustHaveAuthor")
public class User {
    private Integer userId;

    private String userName;

    private String password;

    private String email;

    private String gender;

    private Date registerTime;

    private Date lastLogintime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getLastLogintime() {
        return lastLogintime;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setLastLogintime(Date lastLogintime) {
        this.lastLogintime = lastLogintime;
    }
    
    @Override
    public String toString() {
        return "User{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}