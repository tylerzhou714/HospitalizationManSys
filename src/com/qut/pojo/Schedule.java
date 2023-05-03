package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 医生排班表封装类
 */

public class Schedule implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer doctorId;
    private Date date;
    private String timeSlot;
    private Integer quota;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Integer getQuota() {
        return quota;
    }

    public void setQuota(Integer quota) {
        this.quota = quota;
    }

    @Override
    public String toString() {
        return "schedule{" +
                "id=" + id +
                ", doctorId=" + doctorId +
                ", date=" + date +
                ", timeSlot='" + timeSlot + '\'' +
                ", quota=" + quota +
                '}';
    }
}
