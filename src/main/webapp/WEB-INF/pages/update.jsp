<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2020/10/23
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="/path.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改内容</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="doUpdate.do">

        <C:forEach items="${oneById}" var="o">
            <input type="text" id="id" name="id" value="${o.id}" hidden="hidden">
            <div class="form-group">
            <div class="label">
                <label>图片：</label>
            </div>
        <div class="field">
            <input type="file" id="img" name="img"  class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
<%--            <input type="file" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">--%>
            <div class="tipss">图片尺寸：500*500</div>
        </div>
    </div>

    <if condition="$iscid eq 1">
        <div class="form-group">
            <div class="label">
                <label>分类标题：</label>
            </div>

            <div class="field">
                <select name="name" id="name" class="input w50">
                        <%--                           // <option value="计算机系" <c:if test="${stu.dept=='计算机系'}">selected="selected"</c:if> >计算机系</option>--%>
                    <option value="">请选择分类</option>
                    <option value="电子产品" <c:if test="${o.name=='电子产品'}">selected="selected"</c:if>>电子产品</option>
                    <option value="食品类" <c:if test="${o.name=='食品类'}">selected="selected"</c:if>>食品类</option>
                    <option value="服务类" <c:if test="${o.name=='服务类'}">selected="selected"</c:if>>服务类</option>
                    <option value="家电类" <c:if test="${o.name=='家电类'}">selected="selected"</c:if>>家电类</option>
                    <option value="医疗保健" <c:if test="${o.name=='医疗保健'}">selected="selected"</c:if>>医疗保健</option>
                    <option value="母婴用品" <c:if test="${o.name=='母婴用品'}">selected="selected"</c:if>>母婴用品</option>
                    <option value="儿童玩具" <c:if test="${o.name=='儿童玩具'}">selected="selected"</c:if>>儿童玩具</option>
                </select>
                <div class="tips"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="label">
                <label>排序：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" name="sort" value="${o.sortOrder}"  data-validate="number:排序必须为数字" />
                <div class="tips"></div>
            </div>
        </div>

        </C:forEach>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
<%--                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>--%>
                    <input type="submit" class="button bg-main icon-check-square-o">
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
