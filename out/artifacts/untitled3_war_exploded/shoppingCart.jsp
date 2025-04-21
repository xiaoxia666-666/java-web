<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="s/echarts.min.js"></script>
    <title>我的购物车</title>
    <style>
        /** DIV文本超出宽度部分用...替换，鼠标移上显示全部 **/
        .textAuto {
            width: 150px;
            white-space: nowrap; /*强制单行显示*/
            text-overflow: ellipsis; /*多余部分省略号显示*/
            overflow: hidden; /*超出部分隐藏*/
            display: inline-block; /*块级显示以便更改高宽*/
        }

        .textAuto:hover {
            overflow: visible;
            text-overflow: ellipsis;
            white-space: normal;
        }
    </style>
</head>
<body>
<%--<c:out value="${sessionScope.goodsList}"/>--%>

<div class="container">
    <%--    建议先测试session中的数据，不然你不知道如何取数据--%>
    <%--    <c:out value="${sessionScope.goodsList[0].goods.imgUrl}"/>--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="jumbotron">
                <h3>
                    您还没有购买任何商品!
                </h3>
                <p>
                </p>
                <p>
                    <a class="btn btn-primary btn-large" href="index">去购物</a>
                </p>
            </div>

    <table class="table table-hover table-striped align-middle">
        <thead class="table-dark">
        <tr>
            <th class="text-center">
                <input type="checkbox" id="checkAll" class="form-check-input">
            </th>
            <th class="text-center">商品</th>
            <th class="text-center">描述</th>
            <th class="text-center">属性</th>
            <th class="text-center">单价(￥)</th>
            <th class="text-center">数量</th>
            <th class="text-center">小计</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody id="cartItems">
        <c:forEach items="${sessionScope.goodsList}" var="item">
            <tr class="rowData">
                <td class="text-center">
                    <input type="checkbox" class="ck form-check-input">
                </td>
                <td class="text-center">
                    <img src="images/${item.goods.imgUrl}"
                         class="img-thumbnail rounded"
                         style="width: 60px; height: 60px;">
                </td>
                <td>
                    <span class="textAuto fw-medium">${item.goods.keywords}</span>
                </td>
                <td class="text-muted">颜色:红色, 规格:束</td>
                <td class="text-center price">${item.goods.out_price}</td>
                <td class="text-center">
                    <div class="d-inline-flex align-items-center gap-2">
                        <button class="btn btn-sm btn-outline-secondary reduce">-</button>
                        <input type="text" value="${item.num}"
                               class="form-control form-control-sm w-16"
                               readonly>
                        <button class="btn btn-sm btn-outline-secondary plus">+</button>
                    </div>
                </td>
                <td class="text-center xj">23.00</td>
                <td class="text-center">
                    <span class="del text-danger" data-bs-toggle="tooltip" title="删除">×</span>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6" class="text-end fw-bold">
                总计：￥<span id="totalSum" class="fw-bold">0.00</span>
            </td>
            <td class="text-center">
                <button class="btn btn-danger btn-lg" id="jsBtn">去结算</button>
            </td>
        </tr>
        </tfoot>
    </table>
</div>

<script>
    $(function () {
        // 数量加减（事件委托优化）
        $("#cartItems").on('click', '.plus', function () {
            const $num = $(this).siblings('input');
            $num.val(++$num.val()).trigger('change');
        }).on('click', '.reduce', function () {
            const $num = $(this).siblings('input');
            if ($num.val() > 1) $num.val(--$num.val()).trigger('change');
        });

        // 小计计算（通过change事件统一处理）
        $("#cartItems").on('change', 'input[name="num"]', function () {
            const $row = $(this).closest('.rowData');
            const price = parseFloat($row.find('.price').text());
            const subtotal = ($(this).val() * price).toFixed(2);
            $row.find('.xj').text(subtotal);
            zj();
        });

        // 全选/反选
        $("#checkAll").on('click', function () {
            $(".ck").prop('checked', this.checked).trigger('change');
        });

        // 单选处理
        $("#cartItems").on('change', '.ck', function () {
            if (!this.checked) $("#checkAll").prop('checked', false);
            zj();
        });

        // 删除功能（带确认提示）
        $("#cartItems").on('click', '.del', function () {
            if (confirm('确认删除该商品？')) {
                $(this).closest('.rowData').remove();
                zj();
            }
        });

        // 总计计算
        function zj() {
            const total = [...$(".ck:checked")].reduce((sum, ck) =>
                sum + parseFloat($(ck).closest('.rowData').find('.xj').text()), 0);
            $("#totalSum").text(total.toFixed(2));
        }

        // 初始化tooltip
        $('[data-bs-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>