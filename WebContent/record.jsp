<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <h2>电子病历录入</h2>
</div>
<form id="medicalRecordEntry">
    <div class="main">
        <p class="short-input ue-clear">
            <label id="patientNum"><font color="red">*</font>病历号：</label> <input
                id="patientId" name="patientId" type="search" results="s">
        </p>
        <p class="short-input ue-clear">
            <label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input id="patientName"
                                                              name="patientName" readonly type="text"  />
        </p>

        <input type="hidden" id="createTime" name="createTime"
               readonly="readonly"  placeholder="诊断时间"/>

        <input type="hidden" id="cerificateNo" name="cerificateNo"
               readonly="readonly"  placeholder="身份证"/>

        <p class="short-input ue-clear">
            <label>床位号：</label> <input type="text" id="bedNo" name="bedNo"
                                       readonly />
        </p>
        <p class="short-input ue-clear">
            <label>诊断：</label> <input type="text" id="diagnosis"
                                      name="diagnosis" />
        </p>
        <p class="short-input ue-clear">
            <label>治疗方案：</label> <input type="text" name="treatmentPlan" id="treatmentPlan"/>
        </p>
        <p class="short-input ue-clear">
            <label>药物：</label> <input type="text" name="medication" id="medication"/>
        </p>
        <p class="short-input ue-clear">
            <label>备注：</label>
            <textarea placeholder="备注" name="remarks" id="remarks"></textarea>
        </p>
    </div>
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
<script>

</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/medicalRecordEntry.js"></script>
</html>
