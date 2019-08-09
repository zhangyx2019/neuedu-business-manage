<%--
  Created by IntelliJ IDEA.
  User: zhangyuxuan
  Date: 2019/8/6
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <table>
        <thead>
        <th>用户名</th>
        <th>用户密码</th>
        <th>用户邮箱</th>
        <th>手机号码</th>
        <th>密保问题</th>
        <th>密保答案</th>
        <th>用户权限</th>
        <th>用户ip</th>
        <a href="add">新增用户</a>
        </thead>
        <c:forEach items="${userInfolist}" var="userInfo">
        <tr>
            <th>${userInfo.username}</th>
            <th>${userInfo.password}</th>
            <th>${userInfo.email}</th>
            <th>${userInfo.phone}</th>
            <th>${userInfo.question}</th>
            <th>${userInfo.answer}</th>
            <th>${userInfo.role}</th>
            <th>${userInfo.ip}</th>
            <th>
                <a href="update/${userInfo.id}">修改</a>
                <a href="delect/${userInfo.id}">删除</a>
            </th>
        </tr>
        </c:forEach>
    </table>

</head>
<body>

</body>
</html>
