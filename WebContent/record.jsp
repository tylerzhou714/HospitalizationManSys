<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>病历录入</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simplemde/dist/simplemde.min.css">
    <style>
        .medical-record-header {
            width: 100%;
            margin-bottom: 20px;
        }

        .medical-record-header th,
        .medical-record-header td {
            padding: 5px;
            text-align: left;
        }

        .editor-toolbar {
            font-weight: bold;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
</head>

<body>
<h1>病历录入</h1>
<form id="medicalRecordForm">
    <label for="outpatientId">门诊号：</label>
    <input type="text" id="outpatientId" name="outpatientId">
    <button type="button" id="confirmButton">确定</button>
    <input type="hidden" id="patientId" name="patientId">
    <input type="hidden" id="patientName" name="patientName">
    <input type="hidden" id="keshi" name="keshi">
    <input type="hidden" id="zhicheng" name="zhicheng">
    <input type="hidden" id="gender" name="gender">

    <table class="medical-record-header" id="medicalRecordHeader">
    </table>

    <textarea id="diagnosisContent" name="diagnosisContent"></textarea>
    <button type="submit">提交</button>
    <button type="button" id="printButton">打印</button>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simplemde/dist/simplemde.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script>
    var simplemde = new SimpleMDE({ element: document.getElementById("diagnosisContent"), toolbar: false });

    function getPatientInfo(outpatientId) {
        // 根据门诊号获取患者信息的逻辑
        // 示例数据
        return {
            id: 1,
            name: "张三",
            keshi: 2,
            zhicheng: 3,
            gender: 1,
            hospital: "某某医院",
            medicalRecordId: "MR-123456",
            admissionDate: "2023-04-01",
            dischargeDate: "2023-04-10"
        };
    }

    function updateMedicalRecordHeader(patientInfo) {
        var headerHtml = `
                <tr>
                    <th>医院名称：</th>
                    <td>${patientInfo.hospital}</td>
                    <th>病历编号：</th>
                    <td>${patientInfo.medicalRecordId}</td>
                </<tr>
                    <th>姓名：</th>
                    <td>${patientInfo.name}</td>
                    <th>性 别：</th>
                    <td>${patientInfo.gender == 1 ? '男' : '女'}</td>
                </tr>
                    <tr>
                    <th>年龄：</th>
                    <td>30</td>
                    <th>入院日期：</th>
                    <td>${patientInfo.admissionDate}</td>
                </tr>
                <tr>
                    <th>出院日期：</th>
                    <td>${patientInfo.dischargeDate}</td>
                </tr>
                    `;
        $('#medicalRecordHeader').html(headerHtml);
    }
    $('#confirmButton').click(function () {
        var outpatientId = $('#outpatientId').val();
        var patientInfo = getPatientInfo(outpatientId);
        updateMedicalRecordHeader(patientInfo);
        $('#patientId').val(patientInfo.id);
        $('#patientName').val(patientInfo.name);
        $('#keshi').val(patientInfo.keshi);
        $('#zhicheng').val(patientInfo.zhicheng);
        $('#gender').val(patientInfo.gender);
    });
    $('#medicalRecordForm').submit(function (event) {
        event.preventDefault();
        var data = $(this).serialize();
        // 提交数据的逻辑
        console.log(data);
    });

    $('#printButton').click(function () {
        // 创建一个新的jsPDF实例
        var doc = new jsPDF();

        doc.setFontSize(18);
        doc.text('病历录入', 10, 20);
        doc.setFontSize(14);
        doc.text('医院名称：' + $('#medicalRecordHeader tr:nth-child(1) td:nth-child(2)').text(), 10, 30);
        doc.text('病历编号：' + $('#medicalRecordHeader tr:nth-child(1) td:nth-child(4)').text(), 10, 40);
        doc.text('姓名：' + $('#medicalRecordHeader tr:nth-child(2) td:nth-child(2)').text(), 10, 50);
        doc.text('性别：' + $('#medicalRecordHeader tr:nth-child(2) td:nth-child(4)').text(), 10, 60);
        doc.text('年龄：' + '30', 10, 70);
        doc.text('入院日期：' + $('#medicalRecordHeader tr:nth-child(3) td:nth-child(4)').text(), 10, 80);
        doc.text('出院日期：' + $('#medicalRecordHeader tr:nth-child(4) td:nth-child(2)').text(), 10, 90);
        doc.setFontSize(16);
        doc.setFont('helvetica', 'bold');
        doc.text('诊断内容：', 10, 100);
        doc.setFont('helvetica', 'normal');
        var diagnosisContent = simplemde.value();
        var splitContent = doc.splitTextToSize(diagnosisContent, 180);
        doc.text(splitContent, 10, 110);

        // 使用浏览器的保存文件对话框
        doc.save('病历录入.pdf');

        // 弹出提示框
        alert('打印成功! 请检查您的下载文件夹或您选择的保存位置。');
    });
</script>
</body>
</html>
