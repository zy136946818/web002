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
        <form method="post" class="form-x" action="doAddPro.do">
            <div class="form-group">
                <div class="label">
                    <label>标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="name" id="name" data-validate="required:请输入标题" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>主图片：</label>
                </div>
                <div class="field">
                    <input type="file" id="url1" name="mainImage" id="mainImage"  class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
<%--                    <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">--%>
                    <div class="tipss">图片尺寸：500*500</div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>副图片：</label>
                </div>
                <div class="field">
                    <input type="file" id="url1" name="subImage" id="subImage"  class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
                    <%--                    <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">--%>
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
                            <option value="1">电子产品</option>
                            <option value="2">食品类</option>
                            <option value="3">服装类</option>
                            <option value="4">家电类</option>
                            <option value="5">医疗保健</option>
                            <option value="6">母婴用品</option>
                            <option value="7">儿童玩具</option>
                        </select>
                        <div class="tips"></div>
                    </div>
                </div>
<%--                <div class="form-group">--%>
<%--                    <div class="label">--%>
<%--                        <label>其他属性：</label>--%>
<%--                    </div>--%>
<%--                    <div class="field" style="padding-top:8px;">--%>
<%--                        首页 <input id="ishome"  type="checkbox" />--%>
<%--                        推荐 <input id="isvouch"  type="checkbox" />--%>
<%--                        置顶 <input id="istop"  type="checkbox" />--%>

<%--                    </div>--%>
<%--                </div>--%>
            </if>
            <div class="form-group">
                <div class="label">
                    <label>描述：</label>
                </div>
                <div class="field">
                    <textarea class="input" name="detail" id="detail" style=" height:90px;"></textarea>
                    <div class="tips"></div>
                </div>
            </div>
<%--            <div class="form-group">--%>
<%--                <div class="label">--%>
<%--                    <label>内容：</label>--%>
<%--                </div>--%>
<%--                <div class="field">--%>
<%--                    <textarea name="content" class="input" style="height:450px; border:1px solid #ddd;"></textarea>--%>
<%--                    <div class="tips"></div>--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>关键字标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="subtitle" id="subtitle" value="" />
                </div>
            </div>
            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>价格：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="price" id="price" value="" />
                </div>
            </div>
            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>库存：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="stock" id="stock" value="" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>产品状态：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="status" id="status" value=""/>
                </div>
            </div>
<%--            <div class="form-group">--%>
<%--                <div class="label">--%>
<%--                    <label>关键字描述：</label>--%>
<%--                </div>--%>
<%--                <div class="field">--%>
<%--                    <textarea type="text" class="input" name="s_desc" style="height:80px;"></textarea>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <div class="label">--%>
<%--                    <label>排序：</label>--%>
<%--                </div>--%>
<%--                <div class="field">--%>
<%--                    <input type="text" class="input w50" name="sort" value="0"  data-validate="number:排序必须为数字" />--%>
<%--                    <div class="tips"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <div class="label">--%>
<%--                    <label>发布时间：</label>--%>
<%--                </div>--%>
<%--                <div class="field">--%>
<%--                    <script src="js/laydate/laydate.js"></script>--%>
<%--                    <input type="text" class="laydate-icon input w50" name="datetime" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />--%>
<%--                    <div class="tips"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <div class="label">--%>
<%--                    <label>作者：</label>--%>
<%--                </div>--%>
<%--                <div class="field">--%>
<%--                    <input type="text" class="input w50" name="authour" value=""  />--%>
<%--                    <div class="tips"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <div class="label">--%>
<%--                    <label>点击次数：</label>--%>
<%--                </div>--%>
<%--                <div class="field">--%>
<%--                    <input type="text" class="input w50" name="views" value="" data-validate="member:只能为数字"  />--%>
<%--                    <div class="tips"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
<%--                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>--%>
                    <input  class="button bg-main icon-check-square-o" type="submit" value="添加">
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
