<%--
  Created by IntelliJ IDEA.
  User: zhangyuxuan
  Date: 2019/8/3
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
</head>
<body>

<table class="form">
    <tr>
        <td class="field">id：</td>
        <td><input type="text" class="text" name="id" value="${userinfo.id}" /></td>
    </tr>
    <tr>
        <td class="field">用户名：</td>
        <td><input type="text" class="text" name="username" value="${userinfo.username}" /></td>
    </tr>
    <tr>
        <td class="field">密码：</td>
        <td><input type="text" class="text" name="password" value="${userinfo.password}" /></td>
    </tr>
    <tr>
        <td class="field">密保问题：</td>
        <td><input type="text" class="text" name="question" value="${userinfo.question}" /></td>
    </tr>
    <tr>
        <td class="field">密保答案：</td>
        <td><input type="text" class="text" name="answer" value="${userinfo.answer}" /></td>
    </tr>
    <tr>
        <td class="field">邮箱：</td>
        <td><input type="text" class="text" name="email" value="${userinfo.email}" /></td>
    </tr>
    <tr>
        <td></td>
        <td><label class="ui-blue"><input type="submit" name="submit" value="更新" /></label></td>
    </tr>

</table>

</body>
</html>
