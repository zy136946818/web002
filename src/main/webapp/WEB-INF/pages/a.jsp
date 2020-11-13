<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2020/10/22
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        a{
            text-decoration:none;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>sno</th>
                <th>sname</th>
                <th>sage</th>
                <th>ssex</th>
                <th>dept</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pages.list}" var="s">
                <tr>
                    <td>${s.sno}</td>
                    <td>${s.sname}</td>
                    <td>${s.sage}</td>
                    <td>${s.ssex}</td>
                    <td>${s.dept}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <c:forEach items="${pages.navigatepageNums}" var="i">
        <a href="a.do?pageNum=${i}">${i}</a>
    </c:forEach>
</body>
</html>
