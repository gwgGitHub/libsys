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
    <title>添加图书</title>
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
        <td align="center">添加图书</td>
        <td width="200px" align="center"> 操作员：${sessionScope.adminName}</td>
        <td width="90px" align="center"><a href="${pageContext.request.contextPath}/admin/login">退出登陆</a></td>
    </tr>
</table>
<table border="0px" cellspacing="0px" cellpadding="0px" align="center"
       style="text-align: center;height: 300px;margin-top: 100px">
    <form id="submitForm" action="${pageContext.request.contextPath}/book/addbook" method="post"
          enctype="multipart/form-data">
        <tr>
            <td>
                图书编号&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="bookCode" id="bookCode" class="add_form">
            </td>
        </tr>
        <tr>
            <td>
                图书名称&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="bookName" id="bookName" class="add_form">
            </td>
        </tr>
        <tr>
            <td>
                图书类型&nbsp;&nbsp;&nbsp;&nbsp;
                <select name="bookTypeId" id="bookTypeId" class="add_form"
                        style="text-align: center;text-align-last: center">
                    <option value="-1">--请选择--</option>
                    <c:forEach items="${sessionScope.bookTypes}" var="bookType">
                        <option value="${bookType.bookTypeId}">${bookType.bookTypeName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="bookAuthor" id="bookAuthor" class="add_form">
            </td>
        </tr>
        <tr>
            <td>出&nbsp;&nbsp;版&nbsp;社&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="publishPress" id="publishPress" class="add_form">
            </td>
        </tr>
        <tr>
            <td>
                出版时间&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" name="publishDate" id="publishDate" class="add_form">
            </td>
        </tr>
        <tr>
            <td>
                创&nbsp;&nbsp;建&nbsp;人&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="createdBy" id="createdBy" class="add_form" value="${sessionScope.adminName}"
                       readonly>
            </td>
        </tr>
        <tr>
            <td>
                <br><br><br>
                <input type="button" value="提交" class="little_button" onclick="judgesubmit()">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" value="重置" class="little_button">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="取消" class="little_button" onclick="location.href='${pageContext.request.contextPath}/book/list'">
            </td>
        </tr>
    </form>
</table>
<script>
    function judgesubmit() {
        if ($("#bookCode").val() == "") {
            alert("请输入图书编号！");
        } else if ($("#bookName").val() == "") {
            alert("请输入图书名称！");
        } else if ($("#bookTypeId").val() == -1) {
            alert("请选择图书类型！");
        } else if ($("#bookAuthor").val() == "") {
            alert("请输入作者");
        } else if ($("#publishPress").val() == "") {
            alert("请输入出版社");
        } else if ($("#publishDate").val() == "") {
            alert("请选择出版时间");
        } else if ($("#createdBy").val() == "") {
            alert("非管理员无法操作");
        } else {
            $("#submitForm").submit();
        }
    }
</script>
</body>
</html>
