<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/info-mgt.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
    <title>医院挂号系统 - 挂号详情</title>
</head>
<body>
<div class="title">
    <h2>挂号详情</h2>
</div>
<div class="table-box">
    <table>
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">患者姓名</th>
            <th class="process">医生姓名</th>
            <th class="node">科室</th>
            <th class="num">挂号时间</th>
            <th class="node">状态</th>
            <th class="time">操作</th>
        </tr>
        </thead>
        <tbody id="details">
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript">
    // 模拟数据
    var data = [
        {
            id: 1,
            patientName: '张三',
            doctorName: '李医生',
            department: '内科',
            registerTime: '2023-04-14 10:30',
            status: '已挂号'
        },
        {
            id: 2,
            patientName: '李四',
            doctorName: '王医生',
            department: '外科',
            registerTime: '2023-04-14 14:00',
            status: '已挂号'
        }
    ];

    // 渲染数据
    function renderData() {
        var html = '';
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            html += '<tr>';
            html += '<td class="num">' + item.id + '</td>';
            html += '<td class="name">' + item.patientName + '</td>';
            html += '<td class="process">' + item.doctorName + '</td>';
            html += '<td class="node">' + item.department + '</td>';
            html += '<td class="num">' + item.registerTime + '</td>';
            html += '<td class="node">' + item.status + '</td>';
            html += '<td class="time"><a href="javascript:;" onclick="cancelRegistration(' + i + ')" class="delete">退号</a></td>';
            html += '</tr>';
        }
        $('#details').html(html);
    }

    // 退号操作
    function cancelRegistration(index) {
        // 确认对话框
        if (confirm('确定要退号吗？')) {
            // 更新数据状态
            data[index].status = '已退号';

            // 重新渲染数据
            renderData();
        }
    }

    // 初始化
    $(function () {
        renderData();
    });
</script>
</html>
