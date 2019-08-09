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
        <th>商品id</th>
        <th>类别id</th>
        <th>商品名称</th>
        <th>商品副标题</th>
        <th>商品价格</th>
        <th>商品状态</th>
        <a href="add">新增类别</a>
        </thead>
        <c:forEach items="${productlist}" var="product">
        <tr>
            <th>${product.id}</th>
            <th>${product.categoryId}</th>
            <th>${product.name}</th>
            <th>${product.subtitle}</th>
            <th>${product.price}</th>
            <th>${product.status}</th>
            <th>
                <a href="update/${product.id}">修改</a>
                <a href="delect/${product.id}">删除</a>
            </th>
        </tr>
        </c:forEach>
    </table>

</head>
<body>

</body>
</html>
