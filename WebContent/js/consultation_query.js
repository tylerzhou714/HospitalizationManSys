$(document).ready(function() {
    console.log("Document is ready"); // 添加此行
    var patientId = getPatientIdFromCookie();
    if (patientId) {
        getConsultation(patientId);
    }
});

function getPatientIdFromCookie() {
    var cookie = getCookie('user');
    var cookieValue = cookie.split("#")[0].substring(0);
    console.log(cookieValue); // 添加此行
    return cookieValue ? cookieValue : null;
}

function getConsultation(patientId) {
    $.ajax({
        type: "GET",
        url: "consultation/consultationQueryByCertificateNo.do",
        data: { patientId: patientId },
        dataType: "json",
        success: function(success) {
            console.log(success.state); // 添加此行
            if (success.state === 0) {
                var consultation = success.data[0];
                if (consultation) {
                    $("#patientId").val(consultation.id);
                    $("#patientName").val(consultation.patient_name);
                    $("#bedNo").val(consultation.bed_no);
                    $("#doctorName").val(consultation.consulting_doctors);
                    $("#diagnosisSuggestion").val(consultation.diagnosis_suggestion);
                } else {
                    alert("未找到会诊信息");
                }
            } else {
                alert("获取会诊信息失败");
            }
        },
        error: function() {
            alert("请求失败，请稍后再试");
        }
    });
}
