<%@ page import="com.neuedu.pojo.UserInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: zhangyuxuan
  Date: 2019/7/26
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<h1>用户管理</h1>
<table class="list">
    <tr>
        <th>ID</th>
        <th>用户名</th>
        <th>密码</th>
        <th>密保问题</th>
        <th>密保答案</th>
        <th>Email</th>
    </tr>
    <%--<%--%>
        <%--List<UserInfo> userlist=(List<UserInfo>)session.getAttribute("userlist");--%>
        <%--for(int i=0;i<userlist.size();i++){--%>
        <%--UserInfo p=(UserInfo) userlist.get(i);--%>
            <%--System.out.println(--%>
                    <%--"<td class=\"id\">"+p.getId()+"</td>"+--%>
            <%--"<td class=\"username\">"+p.getUsername()+"</td>"+--%>
            <%--"<td class=\"password\">"+p.getPassword()+"</td>"+--%>
            <%--"<td class=\"question\">"+p.getQuestion()+"</td>"+--%>
            <%--"<td class=\"question\">"+p.getAnswer()+"</td>"+--%>
            <%--"<td class=\"email\">"+p.getEmail()+"</td>"+--%>
            <%--"<td class=\"w1 c\">"+--%>
                <%--"<a href=\"modify\"></a>"+--%>
                <%--"<a href=\"home\"></a>"+--%>
            <%--"</td>");--%>
    <%--%>--%>
    <c:forEach items="${userlist}" var="userinfo">
        <tr>
            <td class="id">${userinfo.id}</td>
            <td class="username">${userinfo.username}</td>
            <td class="password">${userinfo.password}</td>
            <td class="question">${userinfo.question}</td>
            <td class="question">${userinfo.answer}</td>
            <td class="email">${userinfo.email}</td>
            <td class="w1 c">
                <a href="modify">修改</a>
                <a href="home">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>