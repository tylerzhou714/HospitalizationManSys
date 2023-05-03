package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

public class LabOrder implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer outpatient_id;
    private String patient_name;
    private String lab_test;
    private String test_notes;
    private String status;
    private Date create_time;
    private Date update_time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOutpatient_id() {
        return outpatient_id;
    }

    public void setOutpatient_id(Integer outpatient_id) {
        this.outpatient_id = outpatient_id;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getLab_test() {
        return lab_test;
    }

    public void setLab_test(String lab_test) {
        this.lab_test = lab_test;
    }

    public String getTest_notes() {
        return test_notes;
    }

    public void setTest_notes(String test_notes) {
        this.test_notes = test_notes;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    @Override
    public String toString() {
        return "LabOrder{" +
                "id=" + id +
                ", outpatient_id=" + outpatient_id +
                ", patient_name='" + patient_name + '\'' +
                ", lab_test='" + lab_test + '\'' +
                ", test_notes='" + test_notes + '\'' +
                ", status='" + status + '\'' +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }
}
