package com.qut.service;

import com.qut.pojo.Appointment;

public interface AppointmentService {
    /**
     * 挂号
     */
    void saveAppointment(Appointment appointment);

    /**
     * 退号
     */
    void updateAppointment(String id);

    /**
     * 查号
     */
    Appointment findAppointmentById(String id);
}
