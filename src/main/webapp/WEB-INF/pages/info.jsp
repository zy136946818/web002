<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2020/10/24
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="/path.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main" style="width: 1100px;height:600px;"></div>
</body>
<script src="${path}/static/js/jquery-3.2.1.js"></script>
<script src="${path}/static/js/echarts.min.js"></script>
<script>
    $(function () {
        var stocks=[];
        var names=[];
        $.ajax({
            url:"getPro.do",
            type:"get",
            dataType:"json",
            async:false,
            success:function (e) {
                $(e).each(function (index,element) {
                    names.push(element.name);
                    stocks.push(element.stock)
                });
                console.log(names);
                console.log(stocks)
            }

            }

        );
        // // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '商品库存'
            },
            tooltip: {},
            legend: {
                data:['库存']
            },
            xAxis: {
                data: names
            },
            yAxis: {},
            series: [{
                name: '库存',
                type: 'bar',
                data: stocks
            }]
        };


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

    })

</script>
</html>
