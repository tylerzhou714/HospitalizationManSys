package com.qut.controller;

import com.qut.pojo.Doctor;
import com.qut.pojo.Schedule;
import com.qut.service.ScheduleService;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    @Resource(name="scheduleService")
    private ScheduleService scheduleService;
    private JSON json;
    Logger log = Logger.getLogger(Log4jLogsDetial.class);

    @RequestMapping(value = "save.do", produces = "application/json;charset=utf-8")
    public String scheduleSave(@Param("doctorId")Integer doctorId, @Param("date")Date date,
                               @Param("time_slot")String time_slot, @Param("quota")Integer quota)throws ParseException {
        Schedule schedule = new Schedule();
        if (!(date == null)) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date appintmentTime = (Date) sdf.parse(String.valueOf(date));
            schedule.setDate(appintmentTime);
        }
        schedule.setDoctorId(doctorId);
        schedule.setTimeSlot(time_slot);
        schedule.setQuota(quota);
        scheduleService.scheduleSave(schedule);
        log.info("新增排班" + schedule.getDoctorId());
        json = JSONSerializer.toJSON(new JsonResult<Schedule>(schedule));
        return json.toString();
    }
}
