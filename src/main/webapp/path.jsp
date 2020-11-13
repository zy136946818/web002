<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2020/10/10
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path="";
    if (request.getServerPort()==80){
        path=request.getScheme()+"://"+request.getServerName();
    }else {
        path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
    }
    System.out.println(path);
    pageContext.setAttribute("path",path);


%>
