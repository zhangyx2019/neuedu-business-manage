<%--
  Created by IntelliJ IDEA.
  User: zhangyuxuan
  Date: 2019/7/26
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录</title>
  </head>
  <body>

  <form action="http://localhost:8080/login" method="post">
    <span>用户名：</span> <input type="text"name="username"/><br/>
    <span>密  码：</span> <input type="password"name="password"/><br/>
    <input type="submit"value="登录"/>
  </form>

  </body>
</html>
