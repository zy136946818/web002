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
        <form method="post" class="form-x" action="doUpdatePro.do">
            <c:forEach items="${lists}" var="lists">
                <input type="text" value="${lists.id}" hidden="hidden" id="id" name="id">
                <div class="form-group">
                    <div class="label">
                        <label>标题：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w50" value="${lists.name}" name="name" id="name" data-validate="required:请输入标题" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>主图片：</label>
                    </div>
                    <div class="field">
                        <input type="file"  name="mainImage" id="mainImage"  class="input tips" style="width:25%; float:left;"  value="${lists.mainImage}"  data-toggle="hover" data-place="right" data-image="" />
                        <div class="tipss">图片尺寸：500*500</div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="label">
                        <label>副图片：</label>
                    </div>
                    <div class="field">
                        <input type="file" id="url1" name="subImage" id="subImage"  class="input tips" style="width:25%; float:left;"  value="${lists.subImage}"  data-toggle="hover" data-place="right" data-image="" />
                        <div class="tipss">图片尺寸：500*500</div>
                    </div>
                </div>

                <if condition="$iscid eq 1">
                    <div class="form-group">
                        <div class="label">
                            <label>分类标题：</label>
                        </div>
                        <div class="field">
                            <select name="handleId" id="handleId" class="input w50">
                                <option value="">选择分类</option>
                                <option value="1" <c:if test="${lists.handleId==1}">selected="selected"</c:if>>电子产品</option>
                                <option value="2" <c:if test="${lists.handleId==2}">selected="selected"</c:if>>食品类</option>
                                <option value="3" <c:if test="${lists.handleId==3}">selected="selected"</c:if>>服务类</option>
                                <option value="4" <c:if test="${lists.handleId==4}">selected="selected"</c:if>>家电类</option>
                                <option value="5" <c:if test="${lists.handleId==5}">selected="selected"</c:if>>医疗保健</option>
                                <option value="6" <c:if test="${lists.handleId==6}">selected="selected"</c:if>>母婴用品</option>
                                <option value="7" <c:if test="${lists.handleId==7}">selected="selected"</c:if>>儿童玩具</option>
                            </select>
                            <div class="tips"></div>
                        </div>
                    </div>
                </if>
                <div class="form-group">
                    <div class="label">
                        <label>描述：</label>
                    </div>
                    <div class="field">
                        <textarea class="input"  name="detail" id="detail" style=" height:90px;">${lists.detail}</textarea>
                        <div class="tips"></div>
                    </div>
                </div>

                <div class="clear"></div>
                <div class="form-group">
                    <div class="label">
                        <label>关键字标题：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="subtitle" id="subtitle" value="${lists.subtitle}" />
                    </div>
                </div>
                <div class="clear"></div>
                <div class="form-group">
                    <div class="label">
                        <label>价格：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="price" id="price" value="${lists.price}" />
                    </div>
                </div>
                <div class="clear"></div>
                <div class="form-group">
                    <div class="label">
                        <label>库存：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="stock" id="stock" value="${lists.stock}" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>产品状态：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input" name="status" id="status" value="${lists.status}"/>
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
