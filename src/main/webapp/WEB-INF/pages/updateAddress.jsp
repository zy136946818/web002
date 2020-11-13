<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2020/10/23
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/path.jsp"%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${path}/static/css/pintuer.css">
    <link rel="stylesheet" href="${path}/static/css/admin.css">
    <script src="${path}/static/js/jquery.js"></script>
    <script src="${path}/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="doUpdateAddress.do">
            <c:forEach items="${lists}" var="list">
            <input type="text" value="${list.id}" name="id" id="id" hidden="hidden">
                <div class="form-group">
                    <div class="label">
                        <label>收件人姓名</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userName}" name="userName" id="userName" data-validate="required:请输入姓名" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>收件人固定电话</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userPhone}" name="userPhone" id="userPhone" data-validate="required:请输入固定电话" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>收件人移动电话</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userMobile}" name="userMobile" id="userMobile" data-validate="required:请输入手机号" />
                        <div class="tips"></div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="label">
                        <label>省/直辖市</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userProvince}" name="userProvince" id="userProvince" data-validate="required:请输入省/直辖市" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>市</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userCity}" name="userCity" id="userCity" data-validate="required:请输入市" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>区/县</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userDistrict}" name="userDistrict" id="userDistrict" data-validate="required:请输入区/县" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>详细地址</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userAddress}" name="userAddress" id="userAddress" data-validate="required:请输入详细地址" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>邮政编码</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.userZip}" name="userZip" id="userZip" data-validate="required:请输入邮政编码" />
                        <div class="tips"></div>
                    </div>
                </div>

            </c:forEach>




            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <input  class="button bg-main icon-check-square-o" type="submit" value="修改">
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
