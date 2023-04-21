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
    <title>住院挂号子系统</title>
    <style type="text/css">
        #titlevalue, #departmentvalue {
            display: none;
        }
    </style>
</head>
<label id="titlevalue"></label>
<label id="departmentvalue"></label>
<body>
<div class="title">
    <h2>查看预约</h2>
</div>
<div class="query">
    <form id="register_find_head">

        <div class="query-conditions ue-clear">
            <!-- 科室查询条件 -->
            <div class="conditionst name ue-clear">
                <label>&nbsp;&nbsp;科室：</label>
                <div class="select-wrap">
                    <div class="select-title ue-clear" id="department">
                        <span>请选择</span><i class="icon"></i>
                    </div>
                    <ul class="select-list" id="depart"
                        style="height: 100px; overflow: auto;">
                    </ul>
                </div>
            </div>

            <!-- 医生姓名查询条件 -->
            <div class="conditions staffs ue-clear">
                <label>医生姓名：</label>
                <input id="doctorName" type="text" />
            </div>

            <!-- 预约时间查询条件 -->
            <div class="conditions time ue-clear">
                <label>预约时间：</label>
                <div class="time-select">
                    <input type="date" id="appointmentDate" placeholder="预约时间" />
                </div>
            </div>
        </div>
        <div class="query-btn ue-clear">
            <a href="javascript:;" id="select" class="confirm">查询</a>
            <a href="javascript:;" id="reset" class="clear">清空条件</a>
        </div>
    </form>
</div>
<div class="table-box">
    <table>
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">医生编号</th>
            <th class="process">姓名</th>
            <th class="node">科室</th>
            <th class="num">性别</th>
            <th class="node">职称</th>
            <th class="time">预约时间</th>
            <th class="name">操作</th>
        </tr>
        </thead>
        <tbody id="show">
        </tbody>
    </table>
</div>
<div class="pagination ue-clear" id="showbuttom"></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/doctorfind.js"></script>
<script type="text/javascript">
    $("#department").on("click", function() {
        $("#depart").toggle();
        return false;
    });
    $("#depart").on("click", "li", function() {
        var txt = $(this).text();
        var label = $(this).val();
        $("#department").find("span").text(txt);
        $("#departmentvalue").text(label);
    });

    // 清空条件按钮
    $("#reset").on("click", function() {
        $("#department").find("span").text("请选择");
        $("#departmentvalue").text("");
        $("#doctorName").val("");
        $("#appointmentDate").val("");
    });

    $("tbody").find("tr:odd").css("backgroundColor", "#eff6fa");

    showRemind('input[type=text], textarea', 'placeholder');
</script>

</html>

