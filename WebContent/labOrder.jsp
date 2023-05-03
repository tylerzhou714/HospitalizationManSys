<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>检验开单</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        .form-section {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="my-4">检验开单</h1>
    <form id="labOrderForm">
        <div class="form-section mb-3">
            <label for="outpatientId" class="form-label">门诊号：</label>
            <input type="text" id="outpatientId" name="outpatientId" class="form-control">
        </div>

        <div class="form-section mb-3">
            <label for="patientName" class="form-label">患者姓名：</label>
            <input type="text" id="patientName" name="patientName" class="form-control" readonly>
        </div>

        <div class="form-section mb-3">
            <label for="labTest" class="form-label">检验项目：</label>
            <select id="labTest" name="labTest" class="form-select">
                <option value="1">血常规</option>
                <option value="2">尿常规</option>
                <option value="3">肝功能</option>
                <option value="4">肾功能</option>
            </select>
        </div>

        <div class="form-section mb-3">
            <label for="testNotes" class="form-label">检验备注：</label>
            <textarea id="testNotes" name="testNotes" rows="15" class="form-control"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">提交</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $('#outpatientId').on('change', function () {
        // 示例数据，实际场景请根据门诊号查询患者姓名
        var patientName = "张三";
        $('#patientName').val(patientName);
    });

    $('#labOrderForm').submit(function (event) {
        event.preventDefault();
        var data = $(this).serialize();
        // 提交数据的逻辑
        console.log(data);
    });
</script>
</body>
</html>
