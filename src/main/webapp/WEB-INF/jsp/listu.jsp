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
    <title>图书列表</title>
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
        <td width="110px" align="center"><a href="${pageContext.request.contextPath}/book/list">图书管理系统</a></td>
        <td width="180px"></td>
        <td align="center">图书列表</td>
        <td width="200px" align="center"> 用户：${sessionScope.userName}</td>
        <td width="90px" align="center"><a href="${pageContext.request.contextPath}/user/login">退出登陆</a></td>
    </tr>
</table>
<!--上部条件栏-->
<div align="center" style="margin: 0px auto;width: 100%;">
    <table width="100%" border="0" style="height: 80px" cellspacing="0xp" cellpadding="0px" align="center">
        <form id="serchform" action="${pageContext.request.contextPath}/book/list" method="post">
            <td width="200px" align="center">
            </td>
            <td align="center">
                图书分类
                <select name="bookTypeId" id="bookTypeId" class="criteria_form">
                    <option value="-1">--全部--</option>
                    <c:forEach items="${sessionScope.bookTypes}" var="bookType">
                        <option value="${bookType.bookTypeId}"
                                <c:if test="${bookType.bookTypeId==pageUtil.bookTypeId}">selected</c:if>>
                                ${bookType.bookTypeName}
                        </option>
                    </c:forEach>
                </select>
                &nbsp;&nbsp;&nbsp;&nbsp;
                图书名称
                <input type="text" name="bookName" id="bookName" class="criteria_form"
                       value="${requestScope.pageUtil.bookName}">
                &nbsp;&nbsp;&nbsp;&nbsp;
                是否借阅
                <select name="isBorrow" id="isBorrow" class="criteria_form">
                    <option value="-1">--全部--</option>
                    <option value="0" <c:if test="${pageUtil.isBorrow==0}">selected</c:if>>--未借阅--</option>
                    <option value="1" <c:if test="${pageUtil.isBorrow==1}">selected</c:if>>--已借出--</option>
                </select>
            </td>
            <td width="200px" align="center">
                <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                <input type="hidden" name="requestState" id="requestState" value="2">
                <input type="submit" value="GO" class="littler_button"/>
            </td>
        </form>
    </table>
    <!--中部显示列表-->
    <table width="98%" align="center" border="3px" cellpadding="30px" cellspacing="0px" class="table_style">
        <td>
            <table border="0" width="100%" align="center" cellpadding="0px" cellspacing="0px">
                <tr class="td_bgcolor_display" style="height: 35px">
                    <th width="150px">图书编号</th>
                    <th>图书分类</th>
                    <th width="200px">图书名称</th>
                    <th>作者</th>
                    <th width="200px">出版社</th>
                    <th width="200px">出版日期</th>
                    <th width="200px">最新更新时间</th>
                    <th>借阅状态</th>
                    <th colspan="2">操作</th>
                </tr>
                <c:forEach items="${requestScope.pageInfo.list}" var="book" varStatus="rows">
                    <tr <c:if test="${rows.index%2!=0}">class="td_bgcolor_display"</c:if>>
                        <td class="td_style" style="cursor: pointer;"
                            onclick="rud(${book.bookCode},1)">${book.bookCode}</td>
                        <td class="td_style">${book.bookType.bookTypeName}</td>
                        <td class="td_style">${book.bookName}</td>
                        <td class="td_style">${book.bookAuthor}</td>
                        <td class="td_style">${book.publishPress}</td>
                        <td class="td_style"><fmt:formatDate pattern="yyyy-MM-dd" value="${book.publishDate}"/></td>
                        <td class="td_style"><fmt:formatDate pattern="yyyy-MM-dd" value="${book.lastUpdateTime}"/></td>
                        <td class="td_style">
                            <c:if test="${book.isBorrow==0}">未借阅</c:if>
                            <c:if test="${book.isBorrow==1}">已借出</c:if>
                        </td>
                        <td class="td_style" width="80px">
                            <input type="button" value="借阅" class="little_button"
                                   onclick="borrowButton(${book.bookId},${book.isBorrow},1)"/>
                        </td>
                        <td class="td_style" width="80px">
                            <input type="button" value="归还" class="little_button"
                                   onclick="borrowButton(${book.bookId},${book.isBorrow},2)"/>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty pageInfo.list}">
                    <tr>
                        <td colspan="13"><br>没有符合条件的记录!</td>
                    </tr>
                </c:if>
            </table>
        </td>
    </table>
</div>
<!--底部按钮-->
<table border="0" width="93%" cellspacing="0xp" cellpadding="0px" align="center">
    <tr>
        <td id="rudMessage" align="center" colspan="13" height="60px" style="color: #00a0a3;"><h4>${showRUDMessage}</h4></td>
    </tr>
    <td align="left" style="height: 100px;">
        <input type="submit" value="首页" class="big_button" onclick="doPage(1)"/>
    </td>
    <td align="center">
        <input type="submit" value="上一页" class="big_button" onclick="doPage(${pageInfo.prePage})"/>
    </td>
    <td align="center">
        第${pageInfo.pageNum}页&nbsp;&nbsp;&nbsp;&nbsp;共${pageInfo.pages}页&nbsp;&nbsp;&nbsp;&nbsp;共${pageInfo.total}条&nbsp;&nbsp;&nbsp;&nbsp;
        <c:forEach items="${pageInfo.navigatepageNums}" var="count">
            <input type="button" onclick="doPage(${count})" value="${count}" class="circle_button">&nbsp;
        </c:forEach>
    </td>
    <td align="center">
        <input type="submit" value="下一页" class="big_button" onclick="doPage(${pageInfo.nextPage})"/>
    </td>
    <td align="right">
        <input type="submit" value="末页" class="big_button" onclick="doPage(${pageInfo.pages})"/>
    </td>
</table>
</body>
<script>
    $(function () {
        setTimeout(rudMessage, 2000);

    });
    function rudMessage() {
        $("#rudMessage").html("");
    }

    function doPage(pageIndex) {
        $("#pageIndex").val(pageIndex);
        $("#serchform").submit();
    }

    function borrowButton(bookId, isBorrow, state) {
        if (state == 1) {
            if (isBorrow == 1) {
                alert("书籍已被借阅!");
            } else {
                location.href = "${pageContext.request.contextPath}/book/borrow?bookId=" + bookId;
            }
        } else {
            if (isBorrow == 0) {
                alert("您未借阅书籍,无需归还!");
            } else {
                location.href = "${pageContext.request.contextPath}/book/reback?bookId=" + bookId;
            }
        }

    }
</script>
</body>
</html>
