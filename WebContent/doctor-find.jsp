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
	<title>医院住院管理系统</title>
	<style type="text/css">
		#titlevalue, #departmentvalue, #statevalue {
			display: none;
		}
	</style>
</head>
<!-- 隐藏的label，用于存储选择的值 -->
<label id="titlevalue"></label>
<label id="departmentvalue"></label>
<label id="statevalue"></label>
<body>
<!-- 页面标题 -->
<div class="title">
	<h2>医生查询</h2>
</div>
<!-- 查询条件表单 -->
<div class="query">
	<form id="doctor_find_head">
		<div class="query-conditions ue-clear">
			<!-- 科室选择 -->
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
			<!-- 姓名输入框 -->
			<div class="conditionst staffs ue-clear">
				<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input
					id="name" type="text" />
			</div>
			<!-- 入职时间选择 -->
			<div class="conditionst time ue-clear">
				<label>&nbsp;&nbsp;入职时间：</label>
				<div class="time-select">
					<input type="date" id="startTime" placeholder="开始时间" />
				</div>
				<span class="line">-</span>
				<div class="time-select">
					<input type="date" id="endTime" placeholder="结束时间" />
				</div>
			</div>
			<!-- 职称选择 -->
			<div class="conditionst name ue-clear">
				<label>&nbsp;&nbsp;职称：</label>
				<div class="select-wrap">
					<div class="select-title ue-clear" id="titles">
						<span>请选择</span><i class="icon"></i>
					</div>
					<ul class="select-list" id="title">
					</ul>
				</div>
			</div>
			<!-- 是否离职选择 -->
			<div class="conditionst name ue-clear">
				<label>是否离职：</label>
				<div class="select-wrap">
					<div class="select-title ue-clear" id="states">
						<span>请选择</span><i class="icon"></i>
					</div>
					<ul class="select-list" id="state">
						<li value="-1">请选择</li>
						<li value="1">是</li>
						<li value="0">否</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 查询和清空条件按钮 -->
		<div class="query-btn ue-clear">
			<a href="javascript:;" id="select" class="confirm">查询</a> <a
				href="javascript:;" id="reset" class="clear">清空条件</a>
		</div>
	</form>
</div>
<!-- 数据表格 -->
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
			<th class="time">入职时间</th>
			<th class="num">是否在职</th>
			<th class="name">编辑</th>
		</tr>
		</thead>
		<tbody id="show">
		</tbody>
	</table>
</div>
<!-- 分页 -->
<div class="pagination ue-clear" id="showbuttom"></div>
<!-- 编辑医生弹窗 -->
<div class="showDoctor">
	<div class=".ui-dialog-panel">
		<form class="formDialog">
			<p>
				编&nbsp;&nbsp; 号：<input type="text" name="idUpdate" readonly
									   id="idUpdate" />
			</p>
			<p>
				姓&nbsp;&nbsp; 名：<input type="text" name="nameUpdate"
									   id="nameUpdate"><label style="color: red;"
															  class="nameUpdateError"></label>
			</p>
			<p>
				科&nbsp;&nbsp; 室：<select id="select_keshi">
			</select>
			</p>
			<p>
				性&nbsp;&nbsp; 别：<select id="select_gender">
				<option value="1">男</option>
				<option value="2">女</option>
			</select>
			</p>
			<p>
				职&nbsp;&nbsp; 称：<select id="select_zhicheng">
			</select>
			</p>
			<!-- 确定和取消按钮 -->
			<div class="buttons">
				<br> <input type="button" style="margin-left: 40px"
							class="button long2 ok" id="ok" value="确定" /> <input
					type="button" style="margin-left: 80px"
					class="button long2 normal" id="no" value="取消" />
			</div>
		</form>
	</div>
</div>
</body>
<!-- 引入 JavaScript 文件 -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/doctorfind.js"></script>
<!-- 以下为页面交互脚本和事件绑定的JavaScript代码 -->

<script type="text/javascript">
	// 绑定科室下拉菜单点击事件
	$("#department").on("click", function() {
		$("#depart").toggle();
		return false;
	});
	// 绑定科室选项点击事件
	$("#depart").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#department").find("span").text(txt);
		$("#departmentvalue").text(label);
	});
	// 绑定职称下拉菜单点击事件
	$("#titles").on("click", function() {
		$("#title").toggle();
		return false;
	});
	// 绑定职称选项点击事件
	$("#title").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#titles").find("span").text(txt);
		$("#titlevalue").text(label);
	});
	// 绑定是否离职下拉菜单点击事件
	$("#states").on("click", function() {
		$("#state").toggle();
		return false;
	});
	// 绑定是否离职选项点击事件
	$("#state").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#states").find("span").text(txt);
		$("#statevalue").text(label);
	});

	// 设置表格奇数行背景色
	$("tbody").find("tr:odd").css("backgroundColor", "#eff6fa");

	// 显示输入框占位符提示
	showRemind('input[type=text], textarea', 'placeholder');
</script>
</html>
