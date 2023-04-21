<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/info-mgt.css" />
    <title>医院挂号系统 - 医生叫号</title>
    <style type="text/css">
        .operation-btn {
            cursor: pointer;
            color: #428bca;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="title">
    <h2>医生叫号</h2>
</div>
<div class="table-box">
    <table>
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">患者姓名</th>
            <th class="process">医生姓名</th>
            <th class="node">科室</th>
            <th class="time">挂号时间</th>
            <th class="name">操作</th>
        </tr>
        </thead>
        <tbody id="callNumberTable">
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
    // 模拟数据
    var data = [
        {
            patientName: '张三',
            doctorName: '李医生',
            department: '内科',
            registrationTime: '2023-04-14 09:00:00'
        },
        {
            patientName: '李四',
            doctorName: '李医生',
            department: '内科',
            registrationTime: '2023-04-14 09:30:00'
        },
        {
            patientName: '王五',
            doctorName: '李医生',
            department: '内科',
            registrationTime: '2023-04-14 10:00:00'
        }
    ];

    // 渲染数据
    function renderData() {
        var html = '';

        for (var i = 0; i < data.length; i++) {
            html += '<tr>';
            html += '<td>' + (i + 1) + '</td>';
            html += '<td>' + data[i].patientName + '</td>';
            html += '<td>' + data[i].doctorName + '</td>';
            html += '<td>' + data[i].department + '</td>';
            html += '<td>' + data[i].registrationTime + '</td>';
            html += '<td><span class="operation-btn" onclick="callNumber(' + i + ')">叫号</span></td>';
            html += '</tr>';
        }

        $('#callNumberTable').html(html);
    }

    // 叫号操作
    function callNumber(index) {
        alert('叫号：' + data[index].patientName);
    }

    // 初始化
    function init() {
        renderData();
    }

    // 页面加载时执行初始化
    $(document).ready(function() {
        init();
    });
</script>

</html>


