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
    <title>管理员登陆</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico"/>
</head>
<body background="${pageContext.request.contextPath}/img/login.png">

<h1 class="title_style">图书管理系统平台--管理员</h1>
<div id="content_login">
    <div class="login-header">
        <img src="${pageContext.request.contextPath}/img/logo.png">
    </div>
    <form id="submitForm" action="${pageContext.request.contextPath}/book/list" method="post">
        <div class="login-input-box" align="center">
            <span class="icon icon-user">账号</span>
            <input id="adminName" name="adminName" type="text" placeholder="请输入账号"/>
        </div>
        <div class="login-input-box" align="center">
            <span class="icon icon-password">密码</span>
            <input id="adminPwd" name="adminPwd" type="password" placeholder="请输入密码"/>
        </div>
        <div class="remember-box">
            <label>
                <input id="remmsg" type="checkbox" onclick="alert('别白费力气了,记不住密码的!')"/>&nbsp;记住账号密码
            </label>
        </div>
        <div class="login-button-box" align="center">
            <button type="button" onclick="login()">管理员登陆</button>
        </div>
    </form>
    <div class="logon-box">
        <a href="javascript:alert('等我学会短信验证再做!')">忘记密码?</a>
        <a href="javascript:location.href='${pageContext.request.contextPath}/user/login'">用户登录</a>
    </div>
</div>
</body>
<script>
    function login() {
        if ($("#adminName").val() == "") {
            $("#adminName").focus();
        } else if ($("#adminPwd").val() == "") {
            $("#adminPwd").focus();
        } else {
            $("#submitForm").ajaxSubmit({
                url: '${pageContext.request.contextPath}/admin/login',
                type: 'post',
                success: function (backData) {
                    if (backData == "NOUSER") {
                        alert("非管理员,没有登陆权限!")
                    } else if (backData == "MISPASSWORD") {
                        alert("密码错误,请重试!");
                    } else {
                        $("#submitForm").submit();
                    }
                }
            });
        }
    }

</script>
</html>
