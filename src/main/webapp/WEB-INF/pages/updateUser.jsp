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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加用户</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="doUpdateUser.do">

            <c:forEach items="${lists}" var="list">
                <input type="text" hidden="hidden" name="id" id="id" value="${list.id}">
                <div class="form-group">
                    <div class="label">
                        <label>用户名称：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${list.username}" name="username" id="username" data-validate="required:请输入标题" />
                        <div class="tips"></div>
                    </div>
                </div>
<%--                <div class="clear"></div>--%>
<%--                <div class="form-group">--%>
<%--                    <div class="label">--%>
<%--                        <label>密码：</label>--%>
<%--                    </div>--%>
<%--                    <div class="field">--%>
<%--                        <input type="password" class="input w50" name="password" id="password" value="" />--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="clear"></div>
                <div class="form-group">
                    <div class="label">
                        <label>电子邮箱：</label>
                    </div>
                    <div class="field">
                        <input type="email" class="input w50" name="email" id="email" value="${list.email}" />
                    </div>
                </div>
                <div class="clear"></div>
                <div class="form-group">
                    <div class="label">
                        <label>手机号：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" name="phone" id="phone" value="${list.phone}" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>问题：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="question" id="question" value="${list.question}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>答案：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="answer" id="answer" value="${list.answer}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>是否管理员：</label>
                    </div>
                    <div class="field">
                        <select name="role" id="role" class="input w50">
                            <option>请选择</option>
                            <option value="1" <c:if test="${list.role==1}">selected="selected"</c:if>>是</option>
                            <option value="0" <c:if test="${list.role==0}">selected="selected"</c:if>>否</option>

                        </select>
                        <div class="tips"></div>
                    </div>
                </div>
            </c:forEach>


            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
<%--                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>--%>
                    <input  class="button bg-main icon-check-square-o" type="submit" value="修改">
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
