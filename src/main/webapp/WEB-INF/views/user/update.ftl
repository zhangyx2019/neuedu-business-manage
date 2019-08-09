<html>
<#include "common/header.ftl">

<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="">
                        <div class="form-group">
                            <label>用户名</label>
                            <input name="username" type="text" class="form-control" value="${(userinfo.username)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input name="password" type="text" class="form-control" value="${(userinfo.password)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>手机号码</label>
                            <input name="phone" type="text" class="form-control" value="${(userinfo.phone)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>密保问题</label>
                            <input name="question" type="text" class="form-control" value="${(userinfo.question)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>密保答案</label>
                            <input name="answer" type="text" class="form-control" value="${(userinfo.answer)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input name="email" type="text" class="form-control" value="${(userinfo.email)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>用户权限</label>
                            <input name="role" type="text" class="form-control" value="${(userinfo.role)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>ip</label>
                            <input name="ip" type="text" class="form-control" value="${(userinfo.ip)!''}"/>
                        </div>
                        <input hidden type="text" name="id" value="${(userinfo.id)!''}">
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>