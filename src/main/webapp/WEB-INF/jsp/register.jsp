<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-06-20
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico"/>
</head>
<body background="${pageContext.request.contextPath}/img/login.png">

<h1 class="title_style">图书管理系统平台--注册</h1>

<div id="content_register">
    <div class="login-header">
        <img src="${pageContext.request.contextPath}/img/logo.png">
    </div>
    <form id="submitForm" action="${pageContext.request.contextPath}/user/register" method="post">
        <div class="login-input-box" align="center">
            <span class="icon icon-user">用户</span>
            <input id="userName" name="userName" type="text" placeholder="由4-8位字母组成"/>
            <span style="font-size: 10px;color: #8d8f95" id="user_name">必填</span>
        </div>
        <div class="login-input-box" align="center">
            <span class="icon icon-password">密码</span>
            <input id="password" name="password" type="password" placeholder="由8-16位字母和数字组成"/>
            <span style="font-size: 10px;color: #8d8f95" id="pwd">必填</span>
        </div>
        <div class="login-input-box" align="center">
            <span class="icon icon-password">确认</span>
            <input id="passwordu" name="passwordu" type="password" placeholder="输入以确认密码"/>
            <span style="font-size: 10px;color: #8d8f95" id="pwdu">必填</span>
        </div>
        <div class="login-input-box" align="center">
            <span class="icon icon-user">性别</span>
            <select id="gender" name="gender">
                <option value="-1">请选择</option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
            <span style="font-size: 10px ;color: #8d8f95" id="sex">必选</span>
        </div>
        <div class="login-input-box" align="center">
            <span class="icon icon-password">邮箱</span>
            <input id="email" name="email" type="email" placeholder="字母/数字@域名"/>
            <span style="font-size: 10px;color: #8d8f95" id="e_mail">必填</span>
        </div>
    </form>
    <div class="remember-box">
        <label>
            <input type="checkbox" id="check_box" onclick="alert('压根儿没有协议,可以不用勾选!')"/>&nbsp;我同意遵守以下协议
        </label>
    </div>
    <div class="login-button-box" align="center">
        <button type="button" onclick="register()">注&nbsp;册</button>
    </div>
    <div class="logon-box">
        <a href="javascript:location.href='${pageContext.request.contextPath}/user/login'">去登录</a>
    </div>
</div>
</body>

<script>

    //用户名正则表达式
    var name_reg = /^[a-zA-Z]{4,8}$/;
    //密码正则表达式
    var pwd_reg = /^[a-zA-Z0-9]{8,16}$/;
    //邮箱正则表达式
    var email_reg = /^[a-zA-Z0-9]{1,9}@[a-zA-Z0-9]{2,5}.[a-z]{2,3}$/;

    //表单合法性验证
    $(function () {
        // 账号验证
        $("#userName").blur(function () {
            if (name_reg.test($("#userName").val())) {
                $("#submitForm").ajaxSubmit({
                    url: '${pageContext.request.contextPath}/user/regverify',
                    type: 'post',
                    success: function (backDate) {
                        if (backDate == "SUCCESS") {
                            $("#user_name").html("<span style=\"color: #009b27\">&nbsp;&nbsp;✔&nbsp;&nbsp;</span>")
                        } else {
                            $("#user_name").html("<span style=\"color: #e4304b\">占用</span>")
                        }
                    }
                });
            } else if ($("#userName").val() == "") {
                $("#user_name").html("必填");
            } else {
                $("#user_name").html("<span style=\"color: #e4304b\">非法</span>");
            }

        });

        //密码验证
        var pw;
        $("#password").blur(function () {
            if (pwd_reg.test($("#password").val())) {
                $("#pwd").html("<span style=\"color: #009b27\">&nbsp;&nbsp;✔&nbsp;&nbsp;</span>")
            } else if ($("#password").val() == "") {
                $("#pwd").html("必填");
            } else {
                $("#pwd").html("<span style=\"color: #e4304b\">非法</span>");
            }
            pw = $("#password").val();
        });

        //密码确认验证
        $("#passwordu").blur(function () {
            if (pw == $("#passwordu").val() && $("#passwordu").val() != "") {
                $("#pwdu").html("<span style=\"color: #009b27\">&nbsp;&nbsp;✔&nbsp;&nbsp;</span>")
            } else if ($("#passwordu").val() == "") {
                $("#pwdu").html("必填");
            } else {
                $("#pwdu").html("<span style=\"color: #e4304b\">有误</span>");
            }
        });

        //性别验证
        $("#gender").blur(function () {
            if ($("#gender").val() != -1) {
                $("#sex").html("<span style=\"color: #009b27\">&nbsp;&nbsp;✔&nbsp;&nbsp;</span>");
            } else {
                $("#sex").html("必选");
            }
        });

        //邮箱验证
        $("#email").blur(function () {
            if (email_reg.test($("#email").val())) {
                $("#e_mail").html("<span style=\"color: #009b27\">&nbsp;&nbsp;✔&nbsp;&nbsp;</span>")
            } else if ($("#email").val() == "") {
                $("#e_mail").html("必填");
            } else {
                $("#e_mail").html("<span style=\"color: #e4304b\">非法</span>");
            }
        });
    });

    //提交表单
    function register() {
        if ($("#userName").val() == "" || !name_reg.test($("#userName").val())) {
            $("#userName").focus();
        } else if ($("#password").val() == "" || !pwd_reg.test($("#password").val())) {
            $("#password").focus();
        } else if ($("#passwordu").val() == "" || $("#passwordu").val() != $("#password").val()) {
            $("#passwordu").focus();
        } else if ($("#gender").val() == -1) {
            $("#gender").focus();
        } else if ($("#email").val() == "" || !email_reg.test($("#email").val())) {
            $("#email").focus();
        } else {
            $("#submitForm").submit();
        }
    }

</script>
</html>
