<%--
  Created by IntelliJ IDEA.
  User: zhangyuxuan
  Date: 2019/8/6
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>商品管理</title>
</head>
<body>

<h1>新增商品</h1>
<form action="" method="post">
    <table class="form">
        <tr>
            <td class="field">商品名称：</td>
            <td><input type="text" class="text" name="name"  /></td>
        </tr>
        <tr>
            <td class="field">商品副标题：</td>
            <td><input type="text" class="text tiny" name="subtitle" /></td>
        </tr>
        <tr>
            <td class="field">所属分类：</td>
            <td>
                <select name="categoryId">
                    <c:forEach var="f" items="${categorylist}">
                        <c:if test="${f.parentId==0}">
                            <option value="${f.id }">${f.name }</option>
                            <c:forEach var="c" items="${productlist}">
                                <c:if test="${f.id==c.parentId}">
                                    <option value="${f.id }-${c.parentId }">&nbsp;&nbsp;${c.name }</option>
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
        <tr>
            <td class="field">商品价格：</td>
            <td><input type="text" class="text tiny" name="price" /> 元(整数)</td>
        </tr>
        <tr>
            <td class="field">描述：</td>
            <td><input type="text" class="text" name="detail" /></td>
        </tr>
        <tr>
            <td class="field">库存：</td>
            <td><input type="text" class="text tiny" name="stock" /></td>
        </tr>
        <tr>
            <td class="field">产品状态：</td>
            <td><input type="text" class="text tiny" name="status" /></td>
        </tr>
        <tr>
            <td></td>
            <td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
        </tr>
    </table>
</form>

</body>
</html>
