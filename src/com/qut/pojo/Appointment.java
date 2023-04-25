package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/*
 * 挂号表封装类
 */

public class Appointment implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer patient_id;
    private Integer doctor_id;
    private Date appointment_date;
    private Date appointment_time;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(Integer patient_id) {
        this.patient_id = patient_id;
    }

    public Integer getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(Integer doctor_id) {
        this.doctor_id = doctor_id;
    }

    public Date getAppointment_date() {
        return appointment_date;
    }

    public void setAppointment_date(Date appointment_date) {
        this.appointment_date = appointment_date;
    }

    public Date getAppointment_time() {
        return appointment_time;
    }

    public void setAppointment_time(Date appointment_time) {
        this.appointment_time = appointment_time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "appointment{" +
                "id=" + id +
                ", patient_id=" + patient_id +
                ", doctor_id=" + doctor_id +
                ", appointment_date=" + appointment_date +
                ", appointment_time=" + appointment_time +
                ", status=" + status +
                '}';
    }
}
