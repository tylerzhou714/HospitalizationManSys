package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/*
 * 病历表封装类
 */

public class Record implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer patient_id;
    private Integer doctor_d;
    private Integer department_id;
    private Date visit_date;
    private String symptoms;
    private String diagnosis;
    private String prescription;
    private String notes;

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

    public Integer getDoctor_d() {
        return doctor_d;
    }

    public void setDoctor_d(Integer doctor_d) {
        this.doctor_d = doctor_d;
    }

    public Integer getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(Integer department_id) {
        this.department_id = department_id;
    }

    public Date getVisit_date() {
        return visit_date;
    }

    public void setVisit_date(Date visit_date) {
        this.visit_date = visit_date;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "record{" +
                "id=" + id +
                ", patient_id=" + patient_id +
                ", doctor_d=" + doctor_d +
                ", department_id=" + department_id +
                ", visit_date=" + visit_date +
                ", symptoms='" + symptoms + '\'' +
                ", diagnosis='" + diagnosis + '\'' +
                ", prescription='" + prescription + '\'' +
                ", notes='" + notes + '\'' +
                '}';
    }
}
