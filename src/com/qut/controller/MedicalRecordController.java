package com.qut.controller;


import com.qut.pojo.MedicalRecord;
import com.qut.pojo.PatientCode;
import com.qut.pojo.Sign;
import com.qut.service.MedicalRecordService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonResult;
import com.qut.util.Log4jLogsDetial;
import jdk.internal.org.objectweb.asm.tree.analysis.Value;
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
@RequestMapping("/record")
public class MedicalRecordController {
    @Resource(name="medicalRecordService")
    private MedicalRecordService medicalRecordService;
    Logger log = Logger.getLogger(Log4jLogsDetial.class);

    @RequestMapping(value = "/recordSave.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String recordSave(@Param("patientId") String patientId, @Param("patientName") String patientName,
                             @Param("bedNo") String bedNo, @Param("diagnosis") String diagnosis, @Param("treatmentPlan") String treatmentPlan,
                             @Param("medication") String medication, @Param("remarks") String remarks, HttpServletRequest request,
                             @Param("createTime") String createTime)
        throws ParseException, UnsupportedEncodingException{
        MedicalRecord medicalRecord = new MedicalRecord();
        medicalRecord.setPatientId(BaseUtils.toString(patientId));
        medicalRecord.setPatientName(BaseUtils.toString(patientName));
        medicalRecord.setBedNo(BaseUtils.toString(bedNo));
        medicalRecord.setDiagnosis(BaseUtils.toString(diagnosis));
        medicalRecord.setTreatmentPlan(BaseUtils.toString(treatmentPlan));
        medicalRecord.setMedication(BaseUtils.toString(medication));
        medicalRecord.setRemarks(BaseUtils.toString(remarks));
        medicalRecord.setCreateTime(BaseUtils.toDate(createTime));
        medicalRecord.setUpdateTime(BaseUtils.toDate(createTime));
        medicalRecordService.medicalRecordSave(medicalRecord);
        log.info("保存患者" + patientId + "病历数据");
        JSON json = JSONSerializer.toJSON(new JsonResult<MedicalRecord>(medicalRecord));
        return json.toString();
    }

    @RequestMapping(value = "/recordQuery.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String recordQuery(@Param(value = "patientId") String patientId, @Param("name") String patientName,
                            @Param("wardNo") Integer wardNo, @Param("bedNo") Integer bedNo, @Param("start") String start,
                            @Param("end") String end) throws ParseException {
        PatientCode patientCode = new PatientCode();
        if (patientId == null || "".equals(patientId)) {
            patientId = null;
        }
        if (patientName == null || "".equals(patientName)) {
            patientName = null;
        }
        // System.out.println("收到的patientName传参:"+patientName);
        patientCode.setPatientId(patientId);
        patientCode.setName(patientName);
        patientCode.setWardNo(wardNo);
        patientCode.setBedNo(bedNo);
        patientCode.setStart(BaseUtils.toDate(start));
        patientCode.setEnd(BaseUtils.toDate(end));
        List<Map<String, Object>> list = medicalRecordService.medicalRecordQuery(patientCode);
        log.info("查询患者" + patientName + patientId + "体征护理数据");
        for (Map<String, Object> map : list) {
            String str = map.get("measureTime").toString();
            map.put("measureTime", str);
        }
        JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
        return json.toString();
    }
}
