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
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>商品id</th>
                            <th>名称</th>
                            <th>图片</th>
                            <th>单价</th>
                            <th>库存</th>
                            <th>描述</th>
                            <th>类目</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list productlist as productInfo>
                        <tr>
                            <td>${productInfo.id}</td>
                            <td>${productInfo.name}</td>
                            <td><img src=${productInfo.mainImage} height="100" width="100"  alt=""></td>
                            <td>${productInfo.price}</td>
                            <td>${productInfo.stock}</td>
                            <td>${productInfo.detail}</td>
                            <td>${productInfo.categoryId}</td>
                            <td>${productInfo.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${productInfo.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>
                                <a href="update/${productInfo.id}">修改</a>
                                <a href="delect/${productInfo.id}">删除</a>
                            </td>
                            <td>
                                <#if productInfo.getStatus().message == "在架">
                                    <a href="/sell/seller/product/off_sale?productId=${productInfo.id}">下架</a>
                                <#else>
                                    <a href="/sell/seller/product/on_sale?productId=${productInfo.id}">上架</a>
                                </#if>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--分页-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#if currentPage lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/sell/seller/order/list?page=${currentPage - 1}&size=${size}">上一页</a></li>
                    </#if>

                    <#list 1..productInfoPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/sell/seller/order/list?page=${index}&size=${size}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if currentPage gte productInfoPage.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/sell/seller/order/list?page=${currentPage + 1}&size=${size}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>