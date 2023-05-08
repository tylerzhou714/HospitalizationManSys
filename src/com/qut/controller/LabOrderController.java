package com.qut.controller;

import com.qut.pojo.Consultation;
import com.qut.pojo.LabOrder;
import com.qut.pojo.MedicalRecord;
import com.qut.service.ConsultationService;
import com.qut.service.LabOrderService;
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

@Controller
@RequestMapping("/LabOrder")
public class LabOrderController {
    @Resource(name = "labOrderService")
    private LabOrderService labOrderService;
    Logger log = Logger.getLogger(Log4jLogsDetial.class);

    @RequestMapping(value = "/LabOrderSave.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String labOrderSave(@Param("patientId") String patientId, @Param("patientName") String patientName, @Param("cerificateNo") String cerificateNo,
                             @Param("bedNo") String bedNo, @Param("requestingDoctor") String requestingDoctor, @Param("labTestItems") String labTestItems, HttpServletRequest request,
                             @Param("createTime") String createTime)
            throws ParseException, UnsupportedEncodingException {
        LabOrder labOrder = new LabOrder();
        labOrder.setPatientId(BaseUtils.toString(patientId));
        labOrder.setCertificateNo(BaseUtils.toString(cerificateNo));
        labOrder.setPatientName(BaseUtils.toString(patientName));
        labOrder.setBedNo(BaseUtils.toString(bedNo));
        labOrder.setDoctorName(BaseUtils.toString(requestingDoctor));
        labOrder.setItems(BaseUtils.toString(labTestItems));
        labOrder.setCreateTime(BaseUtils.toDate(createTime));
        labOrder.setUpdateTime(BaseUtils.toDate(createTime));
        labOrderService.labOrferSave(labOrder);
        log.info("保存患者" + patientId + "检查单数据");
        JSON json = JSONSerializer.toJSON(new JsonResult<LabOrder>(labOrder));
        return json.toString();
    }
}
