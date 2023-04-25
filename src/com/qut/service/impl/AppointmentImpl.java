package com.qut.service.impl;

import com.qut.mapper.AppointmentMapper;
import com.qut.pojo.Appointment;
import com.qut.service.AppointmentService;
import com.qut.util.Log4jLogsDetial;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("appointmentService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class AppointmentImpl implements AppointmentService {
    @Resource(name = "appointmentMapper")
    private AppointmentMapper appointmentMapper;
    Logger log = Logger.getLogger(Log4jLogsDetial.class);

    /**
     * 挂号
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void saveAppointment(Appointment appointment) {
        appointmentMapper.saveAppointment(appointment);
    }

    /**
     * 退号
     * @param id
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void updateAppointment(String id) {
        appointmentMapper.updateAppointment(id);
    }

    /**
     * 查询挂号
     * @param id
     * @return
     */
    @Override
    public Appointment findAppointmentById(String id) {
        return appointmentMapper.findAppointmentById(id);
    }
}
