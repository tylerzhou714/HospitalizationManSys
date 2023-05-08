$(document).ready(function() {
    var patientId = getPatientIdFromCookie();
    if (patientId) {
        getMedicalRecord(patientId);
    }
});

function getPatientIdFromCookie() {
    var cookie = getCookie('user');
    var cookieValue = cookie.split("#")[0].substring(0);
    return cookieValue ? cookieValue : null;
}

function getMedicalRecord(patientId) {
    $.ajax({
        type: "GET",
        url: "record/recordQueryByPatientId.do",
        data: { patientId: patientId },
        dataType: "json",
        success: function(success) {
            if (success.state === 0) {
                var medicalRecord = success.data[0];
                if (medicalRecord) {
                    $("#patientId").val(medicalRecord.id);
                    $("#patientName").val(medicalRecord.patient_name);
                    $("#bedNo").val(medicalRecord.bed_no);
                    $("#diagnosis").val(medicalRecord.diagnosis);
                    $("#treatmentPlan").val(medicalRecord.treatment_plan);
                    $("#medication").val(medicalRecord.medication);
                    $("#remarks").val(medicalRecord.remarks);
                } else {
                    alert("未找到病历信息");
                }
            } else {
                alert("获取病历信息失败");
            }
        },
        error: function() {
            alert("请求失败，请稍后再试");
        }
    });
}
