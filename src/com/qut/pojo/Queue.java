package com.qut.pojo;

import java.io.Serializable;

/*
 * 排队表封装类
 */

public class Queue implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer appointment_id;
    private Integer queue_number;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(Integer appointment_id) {
        this.appointment_id = appointment_id;
    }

    public Integer getQueue_number() {
        return queue_number;
    }

    public void setQueue_number(Integer queue_number) {
        this.queue_number = queue_number;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "queue{" +
                "id=" + id +
                ", appointment_id=" + appointment_id +
                ", queue_number=" + queue_number +
                ", status=" + status +
                '}';
    }
}
