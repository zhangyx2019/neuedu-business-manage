<%--
  Created by IntelliJ IDEA.
  User: zhangyuxuan
  Date: 2019/8/6
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>商品管理</title>
</head>
<body>

<h1>修改商品信息</h1>
<form action="" method="post">
    <input type="hidden" name="id" value="${product.id}"><br/>
    商品名称：<input type="text" name="name" value="${product.name}"><br/>
    商品副标题：<input type="text" name="subtitle" value="${product.subtitle}"><br/>
    <tr>
        <td class="field">所属分类：</td>
        <td>
            <select name="categoryId">
                <c:forEach var="f" items="${categorylist}">
                    <c:if test="${f.parentId==0}">
                        <option value="${f.id }">${f.name }</option>
                        <c:forEach var="c" items="${productlist}">
                            <c:if test="${f.id==c.parentId}">
                                <option value="${f.id }-${c.parentId }" selected="selected">&nbsp;&nbsp;${c.name }</option>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </select>
        </td>
    </tr>
    <tr>
        <td class="field">商品图片：</td>
        <td><input type="file" class="text" name="mainImage" /></td>
    </tr>
    商品价格：<input type="text" name="email" value="${product.price}"><br/>
    描述：<input type="text" name="phone" value="${product.detail}"><br/>
    库存：<input type="text" name="question" value="${product.stock}"><br/>
    产品状态：<input type="text" name="answer" value="${product.status}"><br/>
    <input type="submit" value="修改"><br/>
</form>

</body>
</html>
