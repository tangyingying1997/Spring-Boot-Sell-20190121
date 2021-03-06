<html>
    <#include "../common/header.ftl">
<body>
<#--最外层 -->
<div id="wrapper" class="toggled">

    <#--侧边栏 -->
    <#include "../common/nav.ftl">

    <#--主要内容 -->
    <div id="page-content-wrapper">
    <#--右边数据部分 -->
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>订单id</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>地址</th>
                            <th>金额</th>
                            <th>订单状态</th>
                            <th>支付状态</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                <#list orderDTOPage.content as orderDTO>
                <tr>
                    <td>${orderDTO.orderId}</td>
                    <td>${orderDTO.buyerName}</td>
                    <td>${orderDTO.buyerPhone}</td>
                    <td>${orderDTO.buyerAddress}</td>
                    <td>${orderDTO.orderAmount}</td>
                    <td>${orderDTO.orderStatusEnum.message}</td>
                    <td>${orderDTO.payStatusEnum.message}</td>
                    <td>${orderDTO.createTime}</td>
                <#--给详情写链接也要注意判断条件，这里在按钮那里判断过了
                    给详情直接加链接-->
                    <td><a href="/sell/seller/order/detail?orderId=${orderDTO.orderId}">详情</a></td>
                <#--给取消按钮写链接的时候，注意要判断如果当前订单状态已经为取消的话，就不会显示取消链接 -->
                    <td>
                        <#if orderDTO.getOrderStatusEnum().message == "新订单">
                            <a href="/sell/seller/order/cancel?orderId=${orderDTO.orderId}">取消</a>
                        </#if>
                    </td>
                </tr>
                </#list>
                        </tr>
                        </tbody>
                    </table>
                </div>
            <#--分页 -->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#--上一页要注意当当前页码为1，上一页不可点 -->
                <#if currentPage lte 1>
                    <li class="disabled"><a href="#">上一页</a></li>
                <#else>
                    <li><a href="/sell/seller/order/list?page=${currentPage - 1}&size=#{size}">上一页</a></li>
                </#if>

                    <#--动态生成页码 -->
                <#list 1..orderDTOPage.getTotalPages() as index>
                    <#if currentPage == index>
                    <li class="disabled"><a href="#">${index}</a></li>
                    <#else>
                    <li><a href="/sell/seller/order/list?page=${index}&size=#{size}">${index}</a></li>
                    </#if>
                </#list>

                    <#--下一页要注意当当前页码>=最后一页，下一页不可点 -->
				<#if currentPage gte orderDTOPage.getTotalPages()>
				    <li class="disabled"><a href="#">下一页</a></li>
                <#else>
                    <li><a href="/sell/seller/order/list?page=${currentPage + 1}&size=#{size}">下一页</a></li>
                </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<#--<#list orderDTOPage.content as orderDTO>
    ${orderDTO.orderId}<br>
</#list>-->
