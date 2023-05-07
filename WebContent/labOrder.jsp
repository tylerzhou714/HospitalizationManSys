<%@ page language="java" contentType="text/html; utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/info-reg.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
    <title>医院住院管理系统</title>
</head>
<body>
<div class="title">
    <h2>检验开单管理</h2>
</div>
<form id="labOrderEntry">
    <div class="main">
        <p class="short-input ue-clear">
            <label id="patientNum"><font color="red">*</font>住院编号：</label> <input
                id="patientId" name="patientId" type="search" results="s"
                placeholder="住院编号">
        </p>
        <p class="short-input ue-clear">
            <label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input id="patientName"
                                                              name="patientName" readonly type="text" placeholder="姓名" />
        </p>
        <p class="short-input ue-clear">
            <label>床位号：</label> <input type="text" id="bedNo" name="bedNo"
                                       readonly placeholder="床位号" />
        </p>
        <p class="short-input ue-clear">
            <label>检验项目：</label> <input type="text" id="labTestItems"
                                        name="labTestItems" placeholder="检验项目" />
        </p>
        <p class="short-input ue-clear">
            <label>申请医生：</label> <input type="text" id="requestingDoctor"
                                        name="requestingDoctor" readonly placeholder="申请医生" />
        </p>
        <p class="short-input ue-clear">
            <label>备注：</label>
            <textarea placeholder="备注" name="remarks" id="remarks"></textarea>
        </p>
    </div>

    <input type="hidden" id="createTime" name="createTime"
           readonly="readonly" placeholder="开单时间" />

    <div class="btn ue-clear">
        <a href="javascript:;" class="confirm">保存</a> <a href="javascript:;"
                                                         class="clear">重置</a>
    </div>
    <!-- 病人查询 -->
    <div class="patientQuery">
        <iframe src="patient_find.jsp" frameBorder="0" width="100%"
                scrolling="auto" height="100%"></iframe>
    </div>
</form>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/labOrderEntry.js"></script>

</html>
