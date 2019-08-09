<html>
<#include  "common/header.ftl">

<body>
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">

    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>密保问题</th>
                            <th>密保答案</th>
                            <th>邮箱</th>
                            <th>用户权限</th>
                            <th>ip</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list userInfolist as userinfo>
                        <tr>
                            <td>${userinfo.username}</td>
                            <td>${userinfo.password}</td>
                            <td>${userinfo.question}</td>
                            <td>${userinfo.answer}</td>
                            <td>${userinfo.email}</td>
                            <#if userinfo.role ?? && userinfo.role==0>
                                <td>管理员</td>
                            <#else>
                                <td>普通用户</td>
                            </#if>
                            <td>${userinfo.ip}</td>
                            <td>
                                <a href="update/${userinfo.id}">修改</a>
                                <a href="delect/${userinfo.id}">删除</a>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>