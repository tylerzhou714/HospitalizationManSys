package com.qut.controller;

import com.qut.pojo.Appointment;
import com.qut.pojo.User;
import com.qut.service.AppointmentService;
import com.qut.util.JsonResult;
import com.qut.util.Log4jLogsDetial;
import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {
    @Resource(name = "appointmentService")
    private AppointmentService appointmentService;
    private JSON json;
    Logger log = Logger.getLogger(Log4jLogsDetial.class);

    @RequestMapping(value = "makeAppointment.do", produces = "application/json;charset=utf-8")
    public String makeAppointment(@Param("patient_id") String patient_id, @Param("doctor_id") Integer doctor_id,
                                  @Param("appointment_date") Date appointment_date, @Param("appointment_time") Date appointment_time){
        log.info("患者" + patient_id + "尝试挂号");
        Appointment appointment = new Appointment();
        appointment.setPatient_id("patient_id");
        appointment.setDoctor_id(doctor_id);
        appointment.setAppointment_date(appointment_date);
        appointment.setAppointment_time(appointment_time);
        appointment.setStatus(1);
        appointmentService.saveAppointment(appointment);
        log.info("患者" + patient_id + "挂号成功");
        JSON json = JSONSerializer.toJSON(new JsonResult<Appointment>(appointment));
        return json.toString();
    }
}
