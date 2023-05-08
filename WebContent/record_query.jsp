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
    <h2>电子病历查询</h2>
</div>
<form id="medicalRecordEntry">
    <div class="main">
        <p class="short-input ue-clear">
            <label id="patientNum"><font color="red">*</font>病历号：</label> <input
                id="patientId" name="patientId" type="search" results="s" readonly
                placeholder="病历号">
        </p>
        <p class="short-input ue-clear">
            <label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input id="patientName"
                                                              name="patientName" readonly type="text" placeholder="姓名" />
        </p>

        <p class="short-input ue-clear">
            <label>床位号：</label> <input type="text" id="bedNo" name="bedNo" readonly
                                       readonly placeholder="床位号" />
        </p>
        <p class="short-input ue-clear">
            <label>诊断：</label> <input type="text" id="diagnosis" readonly
                                      name="diagnosis" placeholder="诊断" />
        </p>
        <p class="short-input ue-clear">
            <label>治疗方案：</label> <input type="text" name="treatmentPlan" id="treatmentPlan" readonly
                                        placeholder="治疗方案" />
        </p>
        <p class="short-input ue-clear">
            <label>药物：</label> <input type="text" name="medication" id="medication" readonly
                                      placeholder="药物" />
        </p>
        <p class="short-input ue-clear">
            <label>备注：</label>
            <textarea placeholder="备注" name="remarks" readonly id="remarks"></textarea>
        </p>
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
<script type="text/javascript" src="js/record_query.js"></script>
</html>
