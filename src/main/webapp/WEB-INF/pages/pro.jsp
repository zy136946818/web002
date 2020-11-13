
<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2020/10/23
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li> <a class="button border-main icon-plus-square-o" href="addPro.do"> 添加内容</a> </li>
                <li>搜索：</li>
                <form action="getProducts.do" method="post">

                <li>首页
                 <li>
                    <select name="status" id="status" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
                        <option value="">请选择商品状态</option>
                        <option value="1" >有效</option>
                        <option value="0" >无效</option>
                    </select>
                    </li>
                </li>
                <if condition="$iscid eq 1">
                    <li>
                        <select name="handleId" id="handleId" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
                            <option value="">请选择商品种类</option>
                            <c:forEach items="${handles}" var="hand">
                                <option value="${hand.id}">${hand.name}</option>
                            </c:forEach>
                        </select>
                    </li>
                </if>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" value="" name="name" id="name" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <input type="submit" class="button border-main icon-search">
                </form>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">ID</th>
<%--                <th width="10%">排序</th>--%>
                <th>商品名</th>
                <th>所属品类</th>
                <th>副标题</th>
                <th>图片</th>
                <th>价格</th>
                <th>库存</th>
                <th width="10%">更新时间</th>
                <th width="310">操作</th>
            </tr>
            <volist name="list" id="vo">
                <c:forEach items="${lists.list}" var="list">
                   <tr>
                       <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />
                               ${list.id}</td>
<%--                       <td><input type="text" name="sort[1]" value="${list.handleId}" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" /></td>--%>
<%--                       <td width="10%"><img src="images/11.jpg" alt="" width="70" height="50" /></td>--%>
                       <td>${list.name}</td>
                       <td>${list.handleId}</td>
                       <td>${list.subtitle}</td>
                       <td>${list.mainImage}</td>
                       <td>${list.price}</td>
                       <td>${list.stock}</td>
                       <td><fmt:formatDate value="${list.updateTime}" type="both"/></td>
                       <td><div class="button-group"> <a class="button border-main" href="updatePro.do?id=${list.id}"><span class="icon-edit"></span> 修改</a>
                           <a class="button border-red" href="delPro.do?id=${list.id}" ><span class="icon-trash-o"></span> 删除</a> </div></td>
                   </tr>

               </c:forEach>
                <tr>
                    <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
                        全选 </td>
                    <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 操作：
                        <select name="ishome" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeishome(this)">
                            <option value="">首页</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        <select name="isvouch" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeisvouch(this)">
                            <option value="">推荐</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        <select name="istop" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeistop(this)">
                            <option value="">置顶</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;

                        移动到：
                        <select name="movecid" style="padding:5px 15px; border:1px solid #ddd;" onchange="changecate(this)">
                            <option value="">请选择分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                        </select>
                        <select name="copynum" style="padding:5px 15px; border:1px solid #ddd;" onchange="changecopy(this)">
                            <option value="">请选择复制</option>
                            <option value="5">复制5条</option>
                            <option value="10">复制10条</option>
                            <option value="15">复制15条</option>
                            <option value="20">复制20条</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="8">
                        <div class="pagelist">
                            <c:choose>
                                <c:when test="${lists .hasPreviousPage}">
                                    <a href="getProducts.do?pageNum=${lists.prePage}">上一页</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)">上一页</a>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach items="${lists.navigatepageNums}" var="i">
                                <c:if test="${i==lists.pageNum}">
                                    <a class="current" href="javascript:void(0)">${i}</a>
                                </c:if>
                                <c:if test="${i!=lists.pageNum}">
                                    <a class="current" href="getProducts.do?pageNum=${i}">${i}</a>
                                </c:if>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${lists.isLastPage}">
                                    <a href="javascript:void(0)">下一页</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="getProducts.do?pageNum=${lists.nextPage}">下一页</a>
                                </c:otherwise>
                            </c:choose>

                            <a href="getProducts.do?pageNum=${lists.pages}">尾页</a>
                        </div>
                    </td>
                </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    //搜索
    function changesearch(){

    }

    //单个删除
    function del(id,mid,iscid){
        if(confirm("您确定要删除吗?")){

        }
    }

    //全选
    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
            $("#listform").submit();
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){


            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var i = 0;
            $("input[name='id[]']").each(function(){
                if (this.checked==true) {
                    i++;
                }
            });
            if(i>1){
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected","selected");
            }else{

                $("#listform").submit();
            }
        }
        else{
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected","selected");
            return false;
        }
    }

</script>
</body>
</html>
