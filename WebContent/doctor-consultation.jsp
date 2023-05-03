<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会诊管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        .form-section {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>会诊管理</h1>
    <form id="consultationForm">
        <div class="form-section">
            <label for="outpatientId">门诊号：</label>
            <input type="text" id="outpatientId" name="outpatientId" class="form-control">
        </div>

        <div class="form-section">
            <label for="patientName">患者姓名：</label>
            <input type="text" id="patientName" name="patientName" class="form-control" readonly>
        </div>

        <div class="form-section">
            <label for="doctors">会诊医生：</label>
            <select id="doctors" name="doctors[]" class="form-select" multiple>
                <option value="1">医生A</option>
                <option value="2">医生B</option>
                <option value="3">医生C</option>
                <option value="4">医生D</option>
            </select>
        </div>

        <div class="form-section">
            <label for="consultationNotes">会诊意见：</label>
            <textarea id="consultationNotes" name="consultationNotes" rows="5" class="form-control"></textarea>
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

    $('#consultationForm').submit(function (event) {
        event.preventDefault();
        var data = $(this).serialize();
        // 提交数据的逻辑
        console.log(data);
    });
</script>
</body>
</html>
