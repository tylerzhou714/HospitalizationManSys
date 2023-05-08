package com.qut.controller;

import com.qut.pojo.Consultation;
import com.qut.pojo.MedicalRecord;
import com.qut.service.ConsultationService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonResult;
import com.qut.util.Log4jLogsDetial;
import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/consultation")
public class ConsultationController {
    @Resource(name = "consultationService")
    private ConsultationService consultationService;
    Logger log = Logger.getLogger(Log4jLogsDetial.class);

    @RequestMapping(value = "/consultationSave.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String recordSave(@Param("patientId") String patientId, @Param("patientName") String patientName, @Param("cerificateNo") String cerificateNo,
                             @Param("bedNo") String bedNo, @Param("consultingDoctors") String consultingDoctors, @Param("diagnosisSuggestion") String diagnosisSuggestion, HttpServletRequest request,
                             @Param("createTime") String createTime)
            throws ParseException, UnsupportedEncodingException {
        Consultation consultation = new Consultation();
        consultation.setPatientId(BaseUtils.toString(patientId));
        consultation.setCertificateNo(BaseUtils.toString(cerificateNo));
        consultation.setPatientName(BaseUtils.toString(patientName));
        consultation.setBedNo(BaseUtils.toString(bedNo));
        consultation.setConsultingDoctor(BaseUtils.toString(consultingDoctors));
        consultation.setDiagnosis(BaseUtils.toString(diagnosisSuggestion));
        consultation.setCreateTime(BaseUtils.toDate(createTime));
        consultation.setUpdateTime(BaseUtils.toDate(createTime));
        consultationService.consultationSave(consultation);
        log.info("保存患者" + patientId + "会诊数据");
        JSON json = JSONSerializer.toJSON(new JsonResult<Consultation>(consultation));
        return json.toString();
    }

    @RequestMapping(value = "/consultationQueryByCertificateNo.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String consultationQueryByCertificateNo(HttpServletRequest request) throws  ParseException {
        String certificateNo = BaseUtils.toString(request.getParameter("userId"));
        List<Map<String, Object>> list = consultationService.consultationQueryByCertificateNo(certificateNo);
        JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
        return json.toString();
    }
}
