<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-06-18
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>图书详情</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css" type="text/css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico"/>
</head>
<body>
<!--顶部菜单栏-->
<table width="100%" class="menu_bar" border="0" align="center" cellpadding="0px" cellspacing="0px"
       style="margin: 0px auto">
    <tr>
        <td width="110px" align="center"><a
                href="${pageContext.request.contextPath}/book/list">图书管理系统</a></td>
        <td width="180px"></td>
        <td align="center">图书信息</td>
        <td width="200px" align="center"> 操作员：${sessionScope.adminName}</td>
        <td width="90px" align="center"><a href="${pageContext.request.contextPath}/admin/login">退出登陆</a></td>
    </tr>
</table>
<table border="0px" cellspacing="0px" cellpadding="0px" align="center"
       style="text-align: center;height: 300px;margin-top: 50px">
    <tr>
        <td>
            图书编号&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="${requestScope.book.bookCode}" readonly>
        </td>
    </tr>
    <tr>
        <td>
            图书名称&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="${requestScope.book.bookName}" readonly>
        </td>
    </tr>
    <tr>
        <td>
            图书类型&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="${requestScope.book.bookType.bookTypeName}" readonly>
        </td>
    </tr>
    <tr>
        <td>
            作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="${requestScope.book.bookAuthor}" readonly>
        </td>
    </tr>
    <tr>
        <td>出&nbsp;&nbsp;版&nbsp;社&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="${requestScope.book.publishPress}" readonly>
        </td>
    </tr>
    <tr>
        <td>
            出版时间&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form"
                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${requestScope.book.publishDate}"/>" readonly>
        </td>
    </tr>
    <tr>
        <td>
            借阅状态&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form"
                   <c:if test="${requestScope.book.isBorrow==0}">value="未借阅"</c:if>
                   <c:if test="${requestScope.book.isBorrow==1}">value="已借出"</c:if> readonly>
        </td>
    </tr>
    <tr>
        <td>创&nbsp;&nbsp;建&nbsp;人&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="${requestScope.book.createdBy}" readonly>
        </td>
    </tr>
    <tr>
        <td>创建时间&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${requestScope.book.creationTime}"/>" readonly>
        </td>
    </tr>
    <tr>
        <td>最近更新&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="add_form" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${requestScope.book.lastUpdateTime}"/>" readonly>
        </td>
    </tr>
    <tr>
        <td>
            <br><br><br>
            <input type="button" value="返回" class="little_button" onclick="location.href='${pageContext.request.contextPath}/book/list'">
        </td>
    </tr>
</table>
</body>
</html>
