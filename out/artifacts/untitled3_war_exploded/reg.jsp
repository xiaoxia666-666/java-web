<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2025/2/28
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <!-- 修正 CSS 文件路径，使用正斜杠 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">注册页面</h3>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form class="form-horizontal" role="form">
                <div class="form-group row">
                    <label for="account" class="col-sm-3 col-form-label">账号*</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="account" placeholder="请输入账号" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-3 col-form-label">密码*</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password" placeholder="请填写密码" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="confirmPassword" class="col-sm-3 col-form-label">确认密码*</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="confirmPassword" placeholder="请确认密码" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone" class="col-sm-3 col-form-label">手机*</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="phone" placeholder="请填写手机号或固定电话" required>
                        <button type="button" class="btn btn-default">获取验证码</button>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="verifyCode" class="col-sm-3 col-form-label">验证码*</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="verifyCode" placeholder="请填写验证码" required>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 offset-sm-6">
                        <button type="submit" class="btn btn-primary">注 册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>